# Crypto IPs Linux Driver for PYNQ-Z2

This project provides Linux drivers and user-space applications for the cryptographic IP cores on PYNQ-Z2.

## Files Overview

### Kernel Module
- `crypto_ips.c` - Main kernel module managing all 4 IP cores
- `crypto_ioctl.h` - Header file with IOCTL definitions

### User Applications
- `crypto_workflow.c` - Main cryptographic workflow (equivalent to standalone.c)
- `switch_read.c` - Simple switch reader
- `led_control.c` - Simple LED controller
- `crypto_test.c` - Individual IP testing program

### Build System
- `Makefile` - Complete build system for all components

## IP Cores Supported

1. **INTER_IP** (0x43C00000) - Interrupt control, LED control, Switch reading
2. **AES_IP** (0x43C10000) - AES encryption (128-bit)
3. **DES_IP** (0x43C20000) - DES encryption/decryption (64-bit)
4. **GCD_IP** (0x43C30000) - Greatest Common Divisor calculation

## Build Instructions

### 1. Compile Everything
```bash
make all
```

### 2. Compile Only Kernel Module
```bash
make module
```

### 3. Compile Only User Programs
```bash
make userspace
```

### 4. Clean Build Files
```bash
make clean
```

## Installation on PYNQ-Z2

### 1. Copy Files to PYNQ-Z2
Copy the following files to your PYNQ-Z2:
- `crypto_ips.ko`
- `crypto_workflow`
- `switch_read`
- `led_control`
- `crypto_test`

### 2. Load Kernel Module
```bash
sudo insmod crypto_ips.ko
```

### 3. Set Device Permissions
```bash
sudo chmod 666 /dev/crypto_ips
```

### 4. Verify Module Loading
```bash
dmesg | tail           # Check kernel messages
lsmod | grep crypto    # Verify module is loaded
ls -l /dev/crypto_ips  # Check device file
```

## Usage Examples

### 1. Full Cryptographic Workflow
```bash
./crypto_workflow
```
- Interactive program with switch-based mode selection
- Implements the complete standalone.c workflow:
  - Mode selection (Auto/Manual/Debug/Simple)
  - Test case selection
  - DES encryption/decryption
  - GCD calculation
  - AES encryption
  - LED status indication

### 2. Simple Switch Reading
```bash
./switch_read
```
- Reads current switch position
- Shows both ioctl and read() methods

### 3. LED Control
```bash
./led_control 10    # Set LED pattern to 1010 (binary)
./led_control 15    # Set LED pattern to 1111 (all on)
./led_control 0     # Turn off all LEDs
```

### 4. Individual IP Testing
```bash
./crypto_test           # Test all IPs
./crypto_test des       # Test only DES IP
./crypto_test gcd       # Test only GCD IP
./crypto_test aes       # Test only AES IP
./crypto_test switch    # Test switch/LED
```

## LED Status Patterns

The system uses the following LED patterns to indicate status:
- `0x1` (0001) - Idle
- `0x3` (0011) - Input stage
- `0x6` (0110) - DES processing
- `0x9` (1001) - GCD calculation
- `0xC` (1100) - AES encryption
- `0xF` (1111) - Complete
- `0xA` (1010) - Error

## Operation Modes

### Auto Mode (SW1=0, SW0=0)
- Automatic execution with 2-second delays
- Minimal user interaction required

### Manual Mode (SW1=0, SW0=1)
- Manual confirmation for each step
- Press Enter to continue between stages

### Debug Mode (SW1=1, SW0=0)
- Detailed output showing intermediate values
- All encryption keys and results displayed

### Simple Mode (SW1=1, SW0=1)
- Minimal output for quick testing
- Essential results only

## Test Cases

The system includes 4 predefined test cases:
- **Case 0** (SW1=0, SW0=0): Values 12, 8 (simple)
- **Case 1** (SW1=0, SW0=1): Values 48, 18 (medium)
- **Case 2** (SW1=1, SW0=0): Values 144, 96 (complex)
- **Case 3** (SW1=1, SW0=1): Values 255, 85 (max complexity)

## Interrupt Handling

The system supports button interrupt on the INTER_IP:
- Press the push button to trigger interrupts
- Interrupts are logged in kernel messages (`dmesg`)
- Used for workflow progression in Manual mode

## Troubleshooting

### Module Loading Issues
```bash
# Check if device tree includes the IPs
ls /proc/device-tree/amba_pl/

# Check kernel messages
dmesg | grep crypto

# Verify IP addresses are correct
cat /proc/iomem | grep 43c
```

### Permission Issues
```bash
# Set correct permissions
sudo chmod 666 /dev/crypto_ips

# Or run as root
sudo ./crypto_workflow
```

### IP Communication Issues
```bash
# Test individual IPs
./crypto_test des
./crypto_test gcd
./crypto_test aes

# Check switch/LED functionality
./crypto_test switch
```

## Uninstall

```bash
# Remove kernel module
sudo rmmod crypto_ips

# Clean build files
make clean
```

## Differences from Standalone Version

1. **User Space**: All applications run in user space instead of bare metal
2. **IOCTL Interface**: Uses Linux IOCTL for IP communication
3. **Interrupt Handling**: Kernel module handles interrupts, user space gets notifications
4. **File I/O**: Standard Linux file operations for device access
5. **Memory Management**: Linux kernel handles memory mapping

This provides the same functionality as the standalone version but with the benefits of Linux process management, debugging tools, and system services.