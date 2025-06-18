#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/io.h>
#include <linux/interrupt.h>
#include <linux/irq.h>
#include <linux/of_irq.h>
#include <linux/cdev.h>
#include <linux/ioctl.h>
#include <linux/delay.h>
#include <linux/of.h>
#include <linux/slab.h>

#define DEVICE_NAME "crypto_ips"
#define CLASS_NAME "crypto_class"
#define DEVICE_CNT 1

// IP base addresses (from your vivado address editor)
#define INTER_IP_BASEADDR 0x43C00000
#define AES_IP_BASEADDR   0x43C10000
#define DES_IP_BASEADDR   0x43C20000
#define GCD_IP_BASEADDR   0x43C30000
#define IP_SIZE           0x1000

// IOCTL command definitions
#define CRYPTO_IOC_MAGIC 'c'
#define CRYPTO_READ_SWITCH     _IOR(CRYPTO_IOC_MAGIC, 1, int)
#define CRYPTO_WRITE_LED       _IOW(CRYPTO_IOC_MAGIC, 2, int)
#define CRYPTO_DES_ENCRYPT     _IOWR(CRYPTO_IOC_MAGIC, 3, struct des_operation)
#define CRYPTO_DES_DECRYPT     _IOWR(CRYPTO_IOC_MAGIC, 4, struct des_operation)
#define CRYPTO_GCD_CALC        _IOWR(CRYPTO_IOC_MAGIC, 5, struct gcd_operation)
#define CRYPTO_AES_ENCRYPT     _IOWR(CRYPTO_IOC_MAGIC, 6, struct aes_operation)

// Data structures for operations
struct des_operation {
    uint64_t input;
    uint64_t key;
    uint64_t output;
};

struct gcd_operation {
    int x;
    int y;
    int result;
};

struct aes_operation {
    uint32_t key[4];     // 128-bit key
    uint32_t input[4];   // 128-bit input
    uint32_t output[4];  // 128-bit output
};

struct crypto_device {
    dev_t devid;
    int major;
    struct cdev cdev;
    struct class *class;
    struct device_node *nd;
    void __iomem *inter_base;
    void __iomem *aes_base;
    void __iomem *des_base;
    void __iomem *gcd_base;
    unsigned int irq;
};

static struct crypto_device crypto_dev;
static volatile int button_pressed = 0;

// Interrupt handler
static irqreturn_t btn_handler(int irq, void *dev_id) {
    printk(KERN_INFO "Button interrupt triggered!\n");
    button_pressed = 1;
    return IRQ_HANDLED;
}

// DES encrypt function
static int des_encrypt_op(struct des_operation *op) {
    uint32_t pt_high = (uint32_t)(op->input >> 32);
    uint32_t pt_low = (uint32_t)(op->input & 0xFFFFFFFF);
    uint32_t key_high = (uint32_t)(op->key >> 32);
    uint32_t key_low = (uint32_t)(op->key & 0xFFFFFFFF);
    uint32_t res_high, res_low;
    uint32_t status;
    int timeout = 0;

    // Reset DES IP
    writel(0, crypto_dev.des_base + 0x10); // control reg
    writel(0, crypto_dev.des_base + 0x1C); // status reg
    msleep(10);

    // Write plaintext and key
    writel(pt_low, crypto_dev.des_base + 0x00);
    writel(pt_high, crypto_dev.des_base + 0x04);
    writel(key_low, crypto_dev.des_base + 0x08);
    writel(key_high, crypto_dev.des_base + 0x0C);

    // Start encryption
    writel(0x01, crypto_dev.des_base + 0x10);

    // Wait for completion
    do {
        msleep(1);
        status = readl(crypto_dev.des_base + 0x1C);
        timeout++;
        if (timeout > 100) {
            printk(KERN_ERR "DES encryption timeout!\n");
            return -ETIMEDOUT;
        }
    } while ((status & 0x01) == 0);

    // Read result
    res_low = readl(crypto_dev.des_base + 0x14);
    res_high = readl(crypto_dev.des_base + 0x18);
    op->output = ((uint64_t)res_high << 32) | res_low;

    // Clear start signal
    writel(0, crypto_dev.des_base + 0x10);
    
    return 0;
}

// DES decrypt function
static int des_decrypt_op(struct des_operation *op) {
    uint32_t ct_high = (uint32_t)(op->input >> 32);
    uint32_t ct_low = (uint32_t)(op->input & 0xFFFFFFFF);
    uint32_t key_high = (uint32_t)(op->key >> 32);
    uint32_t key_low = (uint32_t)(op->key & 0xFFFFFFFF);
    uint32_t res_high, res_low;
    uint32_t status;
    int timeout = 0;

    // Reset DES IP
    writel(0, crypto_dev.des_base + 0x10);
    writel(0, crypto_dev.des_base + 0x1C);
    msleep(10);

    // Write ciphertext and key
    writel(ct_low, crypto_dev.des_base + 0x00);
    writel(ct_high, crypto_dev.des_base + 0x04);
    writel(key_low, crypto_dev.des_base + 0x08);
    writel(key_high, crypto_dev.des_base + 0x0C);

    // Start decryption (bit1=1 for decrypt)
    writel(0x03, crypto_dev.des_base + 0x10);

    // Wait for completion
    do {
        msleep(1);
        status = readl(crypto_dev.des_base + 0x1C);
        timeout++;
        if (timeout > 100) {
            printk(KERN_ERR "DES decryption timeout!\n");
            return -ETIMEDOUT;
        }
    } while ((status & 0x01) == 0);

    // Read result
    res_low = readl(crypto_dev.des_base + 0x14);
    res_high = readl(crypto_dev.des_base + 0x18);
    op->output = ((uint64_t)res_high << 32) | res_low;

    // Clear start signal
    writel(0, crypto_dev.des_base + 0x10);
    
    return 0;
}

// GCD calculation function
static int gcd_calc_op(struct gcd_operation *op) {
    int result;
    int timeout = 0;

    // Ensure start signal is 0
    writel(0, crypto_dev.gcd_base + 0x08);

    // Write X and Y values
    writel(op->x, crypto_dev.gcd_base + 0x00);
    writel(op->y, crypto_dev.gcd_base + 0x04);

    msleep(1);

    // Start calculation
    writel(1, crypto_dev.gcd_base + 0x08);

    // Poll for result
    do {
        msleep(1);
        result = readl(crypto_dev.gcd_base + 0x0C);
        timeout++;
        if (timeout > 1000) {
            printk(KERN_ERR "GCD calculation timeout!\n");
            return -ETIMEDOUT;
        }
    } while ((result & 0xFF) == 0);

    // Clear start signal
    writel(0, crypto_dev.gcd_base + 0x08);
    
    op->result = result & 0xFF;
    return 0;
}

// AES encrypt function
static int aes_encrypt_op(struct aes_operation *op) {
    uint32_t status;
    int timeout = 0;
    int i;

    // Write key (4 x 32-bit words)
    for (i = 0; i < 4; i++) {
        writel(op->key[i], crypto_dev.aes_base + 0x08 + (i * 4));
    }

    // Write input data (4 x 32-bit words)
    for (i = 0; i < 4; i++) {
        writel(op->input[i], crypto_dev.aes_base + 0x18 + (i * 4));
    }

    // Start encryption (mode=1 for encrypt, start=1)
    writel(0x00000003, crypto_dev.aes_base + 0x00);

    // Wait for completion
    do {
        msleep(1);
        status = readl(crypto_dev.aes_base + 0x04);
        timeout++;
        if (timeout > 1000) {
            printk(KERN_ERR "AES encryption timeout!\n");
            return -ETIMEDOUT;
        }
    } while (!(status & 0x00000001));

    // Read result (4 x 32-bit words)
    for (i = 0; i < 4; i++) {
        op->output[i] = readl(crypto_dev.aes_base + 0x28 + (i * 4));
    }

    return 0;
}

// Device file operations
static int crypto_open(struct inode *node, struct file *filp) {
    return nonseekable_open(node, filp);
}

static ssize_t crypto_read(struct file *filp, char *buf, size_t size, loff_t *offset) {
    int ret, value;
    // Read switch value (similar to myhwip)
    value = (readl(crypto_dev.inter_base + 0x04) >> 24) & 0xff;
    if ((ret = copy_to_user(buf, &value, size)))
        return ret;
    else
        return 0;
}

static ssize_t crypto_write(struct file *filp, const char __user *buf, size_t size, loff_t *offset) {
    int ret, value;
    // Write LED value (similar to myhwip)
    if ((ret = copy_from_user(&value, buf, size)))
        printk("err: copy_from_user. ret = %d\n", ret);
    writel(value & 0xff, crypto_dev.inter_base);
    return 0;
}

static long crypto_ioctl(struct file *filp, unsigned int cmd, unsigned long arg) {
    int ret = 0;
    struct des_operation des_op;
    struct gcd_operation gcd_op;
    struct aes_operation aes_op;
    int value;

    switch (cmd) {
        case CRYPTO_READ_SWITCH:
            value = (readl(crypto_dev.inter_base + 0x04) >> 24) & 0xff;
            ret = copy_to_user((int *)arg, &value, sizeof(int));
            break;

        case CRYPTO_WRITE_LED:
            ret = copy_from_user(&value, (int *)arg, sizeof(int));
            if (!ret) {
                writel(value & 0xff, crypto_dev.inter_base);
            }
            break;

        case CRYPTO_DES_ENCRYPT:
            ret = copy_from_user(&des_op, (struct des_operation *)arg, sizeof(des_op));
            if (!ret) {
                ret = des_encrypt_op(&des_op);
                if (!ret) {
                    ret = copy_to_user((struct des_operation *)arg, &des_op, sizeof(des_op));
                }
            }
            break;

        case CRYPTO_DES_DECRYPT:
            ret = copy_from_user(&des_op, (struct des_operation *)arg, sizeof(des_op));
            if (!ret) {
                ret = des_decrypt_op(&des_op);
                if (!ret) {
                    ret = copy_to_user((struct des_operation *)arg, &des_op, sizeof(des_op));
                }
            }
            break;

        case CRYPTO_GCD_CALC:
            ret = copy_from_user(&gcd_op, (struct gcd_operation *)arg, sizeof(gcd_op));
            if (!ret) {
                ret = gcd_calc_op(&gcd_op);
                if (!ret) {
                    ret = copy_to_user((struct gcd_operation *)arg, &gcd_op, sizeof(gcd_op));
                }
            }
            break;

        case CRYPTO_AES_ENCRYPT:
            ret = copy_from_user(&aes_op, (struct aes_operation *)arg, sizeof(aes_op));
            if (!ret) {
                ret = aes_encrypt_op(&aes_op);
                if (!ret) {
                    ret = copy_to_user((struct aes_operation *)arg, &aes_op, sizeof(aes_op));
                }
            }
            break;

        default:
            ret = -ENOTTY;
            break;
    }

    return ret;
}

static int crypto_release(struct inode *inode, struct file *flip) {
    return 0;
}

static struct file_operations crypto_fops = {
    .owner = THIS_MODULE,
    .open = crypto_open,
    .write = crypto_write,
    .read = crypto_read,
    .unlocked_ioctl = crypto_ioctl,
    .release = crypto_release,
};

// Initialize interrupt
static void get_node_irq(void) {
    int ret;
    crypto_dev.nd = of_find_node_by_path("/amba_pl/inter_ip@43c00000");
    if (crypto_dev.nd == NULL) {
        printk("no node from dts found!\n");
        return;
    }
    crypto_dev.irq = irq_of_parse_and_map(crypto_dev.nd, 0);
    printk("virtual irq: %d\n", crypto_dev.irq);
    ret = request_irq(crypto_dev.irq, btn_handler, IRQF_TRIGGER_RISING, "crypto_ips", NULL);
    if (ret < 0)
        printk("request_irq %d failed, ret = %d\n", crypto_dev.irq, ret);
}

static int __init crypto_init(void) {
    // Allocate device number
    if (alloc_chrdev_region(&crypto_dev.devid, 0, DEVICE_CNT, DEVICE_NAME) < 0) {
        printk("allocating chrdev region failed!\n");
        return -1;
    }
    crypto_dev.major = MAJOR(crypto_dev.devid);
    printk("major: %d\n", crypto_dev.major);

    // Initialize and add character device
    cdev_init(&crypto_dev.cdev, &crypto_fops);
    cdev_add(&crypto_dev.cdev, crypto_dev.devid, DEVICE_CNT);

    // Create device class and device
    crypto_dev.class = class_create(THIS_MODULE, CLASS_NAME);
    device_create(crypto_dev.class, NULL, crypto_dev.devid, NULL, DEVICE_NAME);

    // Setup interrupt
    get_node_irq();

    // Map all IP base addresses
    crypto_dev.inter_base = ioremap(INTER_IP_BASEADDR, IP_SIZE);
    crypto_dev.aes_base = ioremap(AES_IP_BASEADDR, IP_SIZE);
    crypto_dev.des_base = ioremap(DES_IP_BASEADDR, IP_SIZE);
    crypto_dev.gcd_base = ioremap(GCD_IP_BASEADDR, IP_SIZE);

    if (!crypto_dev.inter_base || !crypto_dev.aes_base || 
        !crypto_dev.des_base || !crypto_dev.gcd_base) {
        printk(KERN_ERR "Failed to map IP addresses\n");
        return -EINVAL;
    }

    printk(KERN_INFO "Crypto IPs module loaded successfully\n");
    printk(KERN_INFO "INTER: 0x%08x => %p\n", INTER_IP_BASEADDR, crypto_dev.inter_base);
    printk(KERN_INFO "AES: 0x%08x => %p\n", AES_IP_BASEADDR, crypto_dev.aes_base);
    printk(KERN_INFO "DES: 0x%08x => %p\n", DES_IP_BASEADDR, crypto_dev.des_base);
    printk(KERN_INFO "GCD: 0x%08x => %p\n", GCD_IP_BASEADDR, crypto_dev.gcd_base);

    return 0;
}

static void __exit crypto_exit(void) {
    printk(KERN_ALERT "Crypto IPs module unloaded\n");
    
    // Cleanup
    cdev_del(&crypto_dev.cdev);
    unregister_chrdev_region(crypto_dev.devid, DEVICE_CNT);
    device_destroy(crypto_dev.class, crypto_dev.devid);
    class_destroy(crypto_dev.class);
    
    // Unmap addresses
    if (crypto_dev.inter_base) iounmap(crypto_dev.inter_base);
    if (crypto_dev.aes_base) iounmap(crypto_dev.aes_base);
    if (crypto_dev.des_base) iounmap(crypto_dev.des_base);
    if (crypto_dev.gcd_base) iounmap(crypto_dev.gcd_base);
    
    // Free interrupt
    if (crypto_dev.irq) free_irq(crypto_dev.irq, NULL);
}

module_init(crypto_init);
module_exit(crypto_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("Crypto IPs Driver for PYNQ-Z2");
