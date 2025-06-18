#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include "crypto_ioctl.h"

int main(void) {
    int crypto_fd;
    unsigned int switch_data;

    crypto_fd = open("/dev/crypto_ips", O_RDWR);
    if (crypto_fd == -1) {
        perror("cannot open the device crypto_ips!!");
        exit(1);
    }

    // Method 1: Using read() (compatible with old myhwip style)
    if (read(crypto_fd, &switch_data, sizeof(char))) {
        perror("read() error!");
        close(crypto_fd);
        exit(1);
    }
    printf("SWITCH data (read): %d\n", switch_data);

    // Method 2: Using ioctl (new method)
    if (ioctl(crypto_fd, CRYPTO_READ_SWITCH, &switch_data) == 0) {
        printf("SWITCH data (ioctl): %d\n", switch_data);
    } else {
        printf("ioctl read failed, but read() worked\n");
    }

    close(crypto_fd);
    return 0;
}
