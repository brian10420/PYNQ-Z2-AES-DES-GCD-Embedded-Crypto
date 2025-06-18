#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <stdint.h>
#include <string.h>
#include "crypto_ioctl.h"

static int crypto_fd;

void test_des() {
    struct des_operation des_op;
    uint64_t key = 0x133457799BBCDFF1ULL;
    uint64_t plaintext = 0x0123456789ABCDEFULL;

    printf("\n=== DES Test ===\n");
    printf("Key: 0x%016lX\n", key);
    printf("Plaintext: 0x%016lX\n", plaintext);

    // Encrypt
    des_op.input = plaintext;
    des_op.key = key;
    if (ioctl(crypto_fd, CRYPTO_DES_ENCRYPT, &des_op) < 0) {
        perror("DES encryption failed");
        return;
    }
    printf("Encrypted: 0x%016lX\n", des_op.output);

    // Decrypt
    des_op.input = des_op.output;
    if (ioctl(crypto_fd, CRYPTO_DES_DECRYPT, &des_op) < 0) {
        perror("DES decryption failed");
        return;
    }
    printf("Decrypted: 0x%016lX\n", des_op.output);

    if (des_op.output == plaintext) {
        printf("DES Test: PASSED\n");
    } else {
        printf("DES Test: FAILED\n");
    }
}

void test_gcd() {
    struct gcd_operation gcd_op;

    printf("\n=== GCD Test ===\n");
    
    // Test case 1
    gcd_op.x = 48;
    gcd_op.y = 18;
    if (ioctl(crypto_fd, CRYPTO_GCD_CALC, &gcd_op) < 0) {
        perror("GCD calculation failed");
        return;
    }
    printf("GCD(%d, %d) = %d\n", gcd_op.x, gcd_op.y, gcd_op.result);

    // Test case 2
    gcd_op.x = 144;
    gcd_op.y = 96;
    if (ioctl(crypto_fd, CRYPTO_GCD_CALC, &gcd_op) < 0) {
        perror("GCD calculation failed");
        return;
    }
    printf("GCD(%d, %d) = %d\n", gcd_op.x, gcd_op.y, gcd_op.result);

    printf("GCD Test: COMPLETED\n");
}

void test_aes() {
    struct aes_operation aes_op;

    printf("\n=== AES Test ===\n");

    // Test key
    aes_op.key[0] = 0x2B7E1516;
    aes_op.key[1] = 0x28AED2A6;
    aes_op.key[2] = 0xABF71588;
    aes_op.key[3] = 0x09CF4F3C;

    // Test data
    aes_op.input[0] = 0x6BC1BEE2;
    aes_op.input[1] = 0x2E409F96;
    aes_op.input[2] = 0xE93D7E11;
    aes_op.input[3] = 0x7393172A;

    printf("Key: 0x%08X%08X%08X%08X\n", 
           aes_op.key[3], aes_op.key[2], aes_op.key[1], aes_op.key[0]);
    printf("Input: 0x%08X%08X%08X%08X\n", 
           aes_op.input[3], aes_op.input[2], aes_op.input[1], aes_op.input[0]);

    if (ioctl(crypto_fd, CRYPTO_AES_ENCRYPT, &aes_op) < 0) {
        perror("AES encryption failed");
        return;
    }

    printf("Output: 0x%08X%08X%08X%08X\n", 
           aes_op.output[3], aes_op.output[2], aes_op.output[1], aes_op.output[0]);

    printf("AES Test: COMPLETED\n");
}

void test_switch_led() {
    int switch_val;
    int led_patterns[] = {0x1, 0x3, 0x6, 0x9, 0xC, 0xF, 0xA};
    int i;

    printf("\n=== Switch/LED Test ===\n");

    // Read switch
    if (ioctl(crypto_fd, CRYPTO_READ_SWITCH, &switch_val) < 0) {
        perror("Failed to read switch");
        return;
    }
    printf("Current switch value: %d\n", switch_val);

    // Test LED patterns
    printf("Testing LED patterns...\n");
    for (i = 0; i < 7; i++) {
        printf("Setting LED pattern: 0x%X\n", led_patterns[i]);
        if (ioctl(crypto_fd, CRYPTO_WRITE_LED, &led_patterns[i]) < 0) {
            perror("Failed to set LED");
            return;
        }
        sleep(1);
    }

    printf("Switch/LED Test: COMPLETED\n");
}

int main(int argc, char *argv[]) {
    printf("================================================\n");
    printf("    Crypto IPs Individual Test Program\n");
    printf("================================================\n");

    // Open crypto device
    crypto_fd = open("/dev/crypto_ips", O_RDWR);
    if (crypto_fd == -1) {
        perror("cannot open the device crypto_ips!!");
        exit(1);
    }

    if (argc > 1) {
        // Test specific IP
        if (strcmp(argv[1], "des") == 0) {
            test_des();
        } else if (strcmp(argv[1], "gcd") == 0) {
            test_gcd();
        } else if (strcmp(argv[1], "aes") == 0) {
            test_aes();
        } else if (strcmp(argv[1], "switch") == 0) {
            test_switch_led();
        } else {
            printf("Usage: %s [des|gcd|aes|switch]\n", argv[0]);
            printf("Or run without arguments to test all\n");
            close(crypto_fd);
            exit(1);
        }
    } else {
        // Test all IPs
        test_switch_led();
        test_des();
        test_gcd();
        test_aes();
    }

    close(crypto_fd);
    printf("\nAll tests completed!\n");
    return 0;
}