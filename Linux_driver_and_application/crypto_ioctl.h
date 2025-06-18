#ifndef CRYPTO_IOCTL_H
#define CRYPTO_IOCTL_H

#include <linux/ioctl.h>
#include <stdint.h>

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

#endif // CRYPTO_IOCTL_H