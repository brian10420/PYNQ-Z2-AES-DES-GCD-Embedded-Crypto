#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include "crypto_ioctl.h"

int main(int argc, char *argv[]) {
    int crypto_fd;
    int led_value;

    if (argc != 2) {
        printf("Usage: %s <led_value>\n", argv[0]);
        printf("Example: %s 10  (sets LED pattern to 1010)\n", argv[0]);
        exit(1);
    }

    led_value = atoi(argv[1]);

    crypto_fd = open("/dev/crypto_ips", O_RDWR);
    if (crypto_fd == -1) {
        perror("cannot open the device crypto_ips!!");
        exit(1);
    }

    // Method 1: Using ioctl (recommended)
    if (ioctl(crypto_fd, CRYPTO_WRITE_LED, &led_value) < 0) {
        perror("ioctl write failed");
        close(crypto_fd);
        exit(1);
    }
    printf("LED pattern set to: %d (0x%X)\n", led_value, led_value);

    // Method 2: Using write() for compatibility
    unsigned char data = (unsigned char)(led_value & 0xFF);
    if (write(crypto_fd, &data, sizeof(char)) < 0) {
        perror("write() error!");
        close(crypto_fd);
        exit(1);
    }

    close(crypto_fd);
    return 0;
}