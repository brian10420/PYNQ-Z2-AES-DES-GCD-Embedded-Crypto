#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <stdint.h>
#include <string.h>
#include "crypto_ioctl.h"

// LED Status Patterns (matching standalone.c)
#define LED_IDLE        0x1  // 0001 - Idle
#define LED_INPUT       0x3  // 0011 - Input stage
#define LED_DES_WORK    0x6  // 0110 - DES processing
#define LED_GCD_WORK    0x9  // 1001 - GCD calculation
#define LED_AES_WORK    0xC  // 1100 - AES encryption
#define LED_COMPLETE    0xF  // 1111 - Complete
#define LED_ERROR       0xA  // 1010 - Error

// Mode definitions
#define MODE_AUTO       0    // Auto execute all steps
#define MODE_MANUAL     1    // Manual confirmation for each step
#define MODE_DEBUG      2    // Show detailed debug information
#define MODE_SIMPLE     3    // Simplified output mode

static int crypto_fd;
static int selected_mode = 0;

// Function prototypes
int read_switch_value(void);
void set_led_status(int pattern);
void wait_for_user_continue(void);
int get_switch_value(void);
void stage1_mode_selection(void);
int stage2_value_input(void);
void execute_crypto_workflow(int value1, int value2);

int read_switch_value(void) {
    int switch_val;
    if (ioctl(crypto_fd, CRYPTO_READ_SWITCH, &switch_val) < 0) {
        perror("Failed to read switch");
        return -1;
    }
    return switch_val & 0x3; // Only 2 switches
}

void set_led_status(int pattern) {
    if (ioctl(crypto_fd, CRYPTO_WRITE_LED, &pattern) < 0) {
        perror("Failed to set LED");
    }
}

void wait_for_user_continue(void) {
    if (selected_mode == MODE_AUTO) {
        sleep(2); // Auto mode waits 2 seconds
        return;
    }

    if (selected_mode != MODE_SIMPLE) {
        printf("Press Enter to continue...\n");
    }
    getchar();
}

int get_switch_value(void) {
    int current_switch = 0;
    int last_switch = -1;

    while (1) {
        current_switch = read_switch_value();
        if (current_switch < 0) return 0;

        if (current_switch != last_switch) {
            if (selected_mode != MODE_SIMPLE) {
                printf("Current Switch: SW1=%d SW0=%d = Case %d ",
                      (current_switch>>1)&1, current_switch&1, current_switch);
                switch(current_switch) {
                    case 0: printf("(Values: 12, 8)\n"); break;
                    case 1: printf("(Values: 48, 18)\n"); break;
                    case 2: printf("(Values: 144, 96)\n"); break;
                    case 3: printf("(Values: 255, 85)\n"); break;
                }
            }
            last_switch = current_switch;
        }
        usleep(200000); // 200ms delay

        printf("Press Enter to confirm selection...\n");
        getchar();
        printf("Test case confirmed: %d\n\n", current_switch);
        return current_switch;
    }
}

void stage1_mode_selection(void) {
    int current_switch = 0;
    int last_switch = -1;

    set_led_status(LED_INPUT);
    printf("\n=== Stage 1: Mode Selection ===\n");
    printf("Use 2 Switch combination to select operation mode:\n");
    printf("SW1 SW0 = Mode\n");
    printf("0   0   = Auto Mode (fully automatic execution)\n");
    printf("0   1   = Manual Mode (manual confirmation for each step)\n");
    printf("1   0   = Debug Mode (show detailed intermediate results)\n");
    printf("1   1   = Simple Mode (minimal output for quick testing)\n");
    printf("Press Enter to confirm selection\n\n");

    while (1) {
        current_switch = read_switch_value();
        if (current_switch < 0) break;

        if (current_switch != last_switch) {
            printf("Current selection: SW1=%d SW0=%d = Mode %d - ",
                  (current_switch>>1)&1, current_switch&1, current_switch);
            switch(current_switch) {
                case MODE_AUTO:   printf("Auto Mode\n"); break;
                case MODE_MANUAL: printf("Manual Mode\n"); break;
                case MODE_DEBUG:  printf("Debug Mode\n"); break;
                case MODE_SIMPLE: printf("Simple Mode\n"); break;
            }
            last_switch = current_switch;
        }
        usleep(200000);

        printf("Press Enter to confirm...\n");
        getchar();
        selected_mode = current_switch;
        printf("Mode confirmed: %d\n\n", selected_mode);
        break;
    }
}

int stage2_value_input(void) {
    int value1 = 0, value2 = 0;
    int test_case;

    // Predefined test cases with different complexity levels
    int test_values[4][2] = {
        {12, 8},     // Case 0: Simple case
        {48, 18},    // Case 1: Medium case
        {144, 96},   // Case 2: Complex case
        {255, 85}    // Case 3: Max complexity
    };

    set_led_status(LED_INPUT);
    printf("=== Stage 2: Test Case Selection ===\n");

    if (selected_mode != MODE_SIMPLE) {
        printf("=== Value Input Instructions ===\n");
        printf("Use 2 Switch combination to select test case:\n");
        printf("SW1 SW0 = Test Case\n");
        printf("0   0   = Case 0: Values 12, 8   (simple case)\n");
        printf("0   1   = Case 1: Values 48, 18  (medium case)\n");
        printf("1   0   = Case 2: Values 144, 96 (complex case)\n");
        printf("1   1   = Case 3: Values 255, 85 (max complexity)\n");
        printf("\nReady for selection...\n");
    }
    
    test_case = get_switch_value();

    // Get values from predefined test case
    value1 = test_values[test_case][0];
    value2 = test_values[test_case][1];

    printf("Test case %d selected: Value1=%d, Value2=%d\n\n", test_case, value1, value2);

    return (value1 << 16) | value2; // Pack both values
}

void execute_crypto_workflow(int value1, int value2) {
    uint64_t des_key = 0x133457799BBCDFF1ULL;
    struct des_operation des_op;
    struct gcd_operation gcd_op;
    struct aes_operation aes_op;

    printf("=== Starting Cryptographic Workflow ===\n");
    printf("Processing values: %d and %d\n\n", value1, value2);

    // Stage 3: DES Encryption
    set_led_status(LED_DES_WORK);
    if (selected_mode != MODE_SIMPLE) printf("=== Stage 3: DES Encryption ===\n");

    if (selected_mode == MODE_DEBUG) {
        printf("DES Key: 0x%016lX\n", des_key);
    }

    // Encrypt first value
    des_op.input = (uint64_t)value1;
    des_op.key = des_key;
    if (ioctl(crypto_fd, CRYPTO_DES_ENCRYPT, &des_op) < 0) {
        perror("DES encryption failed");
        set_led_status(LED_ERROR);
        return;
    }
    uint64_t encrypted1 = des_op.output;

    // Encrypt second value
    des_op.input = (uint64_t)value2;
    if (ioctl(crypto_fd, CRYPTO_DES_ENCRYPT, &des_op) < 0) {
        perror("DES encryption failed");
        set_led_status(LED_ERROR);
        return;
    }
    uint64_t encrypted2 = des_op.output;

    if (selected_mode == MODE_DEBUG) {
        printf("Value1 encrypted: 0x%016lX\n", encrypted1);
        printf("Value2 encrypted: 0x%016lX\n", encrypted2);
    } else if (selected_mode != MODE_SIMPLE) {
        printf("DES encryption completed\n");
    }

    wait_for_user_continue();

    // Stage 4: DES Decryption Verification
    if (selected_mode != MODE_SIMPLE) printf("\n=== Stage 4: DES Decryption Verification ===\n");

    // Decrypt first value
    des_op.input = encrypted1;
    des_op.key = des_key;
    if (ioctl(crypto_fd, CRYPTO_DES_DECRYPT, &des_op) < 0) {
        perror("DES decryption failed");
        set_led_status(LED_ERROR);
        return;
    }
    uint64_t decrypted1 = des_op.output;

    // Decrypt second value
    des_op.input = encrypted2;
    if (ioctl(crypto_fd, CRYPTO_DES_DECRYPT, &des_op) < 0) {
        perror("DES decryption failed");
        set_led_status(LED_ERROR);
        return;
    }
    uint64_t decrypted2 = des_op.output;

    if ((int)(decrypted1 & 0xFFFFFFFF) == value1 && (int)(decrypted2 & 0xFFFFFFFF) == value2) {
        printf("DES verification SUCCESS: decrypted values %d, %d\n", 
               (int)(decrypted1 & 0xFFFFFFFF), (int)(decrypted2 & 0xFFFFFFFF));
    } else {
        printf("DES verification FAILED! Original: %d,%d, Decrypted: %d,%d\n",
               value1, value2, (int)(decrypted1 & 0xFFFFFFFF), (int)(decrypted2 & 0xFFFFFFFF));
        set_led_status(LED_ERROR);
        return;
    }

    wait_for_user_continue();

    // Stage 5: GCD Calculation
    set_led_status(LED_GCD_WORK);
    if (selected_mode != MODE_SIMPLE) printf("\n=== Stage 5: GCD Calculation ===\n");

    gcd_op.x = value1;
    gcd_op.y = value2;
    if (ioctl(crypto_fd, CRYPTO_GCD_CALC, &gcd_op) < 0) {
        perror("GCD calculation failed");
        set_led_status(LED_ERROR);
        return;
    }

    printf("GCD(%d, %d) = %d\n", value1, value2, gcd_op.result);

    wait_for_user_continue();

    // Stage 6: AES Encryption
    set_led_status(LED_AES_WORK);
    if (selected_mode != MODE_SIMPLE) printf("\n=== Stage 6: AES Encryption of GCD Result ===\n");

    // AES test key (128-bit)
    aes_op.key[0] = 0x2B7E1516;
    aes_op.key[1] = 0x28AED2A6;
    aes_op.key[2] = 0xABF71588;
    aes_op.key[3] = 0x09CF4F3C;

    // Prepare data (GCD result in first word, rest zeros)
    aes_op.input[0] = gcd_op.result;
    aes_op.input[1] = 0x00000000;
    aes_op.input[2] = 0x00000000;
    aes_op.input[3] = 0x00000000;

    if (selected_mode == MODE_DEBUG) {
        printf("AES Key: 0x%08X%08X%08X%08X\n", 
               aes_op.key[3], aes_op.key[2], aes_op.key[1], aes_op.key[0]);
        printf("Input Data: 0x%08X%08X%08X%08X\n", 
               aes_op.input[3], aes_op.input[2], aes_op.input[1], aes_op.input[0]);
    }

    if (ioctl(crypto_fd, CRYPTO_AES_ENCRYPT, &aes_op) < 0) {
        perror("AES encryption failed");
        set_led_status(LED_ERROR);
        return;
    }

    printf("AES Encrypted Result: 0x%08X%08X%08X%08X\n",
           aes_op.output[3], aes_op.output[2], aes_op.output[1], aes_op.output[0]);

    // Stage 7: Complete
    set_led_status(LED_COMPLETE);
    printf("\n=== Stage 7: Workflow Complete ===\n");
    printf("All cryptographic operations completed!\n");
}

int main(void) {
    int values;
    int value1, value2;

    printf("\n================================================\n");
    printf("    Interactive Cryptographic Workstation v1.0\n");
    printf("    Supporting DES, GCD, AES with Interrupt Control\n");
    printf("================================================\n");

    // Open crypto device
    crypto_fd = open("/dev/crypto_ips", O_RDWR);
    if (crypto_fd == -1) {
        perror("cannot open the device crypto_ips!!");
        exit(1);
    }

    printf("Crypto device opened successfully\n");

    while (1) {
        set_led_status(LED_IDLE);

        // Stage 1: Mode selection
        stage1_mode_selection();

        // Stage 2: Value input
        values = stage2_value_input();
        value1 = (values >> 16) & 0xFFFF;
        value2 = values & 0xFFFF;

        // Stage 3-7: Execute crypto workflow
        execute_crypto_workflow(value1, value2);

        printf("\nPress Enter to restart...\n");
        getchar();

        printf("\n================================================\n");
        printf("Restarting system...\n");
        printf("================================================\n");
    }

    close(crypto_fd);
    return 0;
}