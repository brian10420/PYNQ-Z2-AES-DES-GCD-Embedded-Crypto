PWD := $(shell pwd)
MODULE_NAME := crypto_ips
ARCH := arm
CROSS_COMPILE := arm-xilinx-linux-gnueabi-
KSRC := /home/eos/lab3/pynqz2/build/tmp/work-shared/zynq-generic/kernel-build-artifacts

# Use environment variables from PetaLinux SDK (set by environment-setup script)
# If CC is not set, use default cross compiler
CC ?= arm-xilinx-linux-gnueabi-gcc

# Kernel module
obj-m := $(MODULE_NAME).o

# User space programs
USER_PROGRAMS := crypto_workflow switch_read led_control crypto_test

.PHONY: all clean module userspace install check-env

all: check-env module userspace

# Check if PetaLinux environment is loaded
check-env:
ifndef CC
	@echo "Error: PetaLinux environment not loaded!"
	@echo "Please run: source /home/eos/lab3/pynqz2/images/linux/sdk/environment-setup-cortexa9t2hf-neon-xilinx-linux-gnueabi"
	@echo "Or add it to your ~/.bashrc for automatic loading"
	@exit 1
endif
	@echo "Using compiler: $(CC)"
	@echo "Sysroot: $(SDKTARGETSYSROOT)"

# Build kernel module
module:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(PWD) modules

# Build user space programs
userspace: $(USER_PROGRAMS)

crypto_workflow: crypto_workflow.o
	$(CC) $< -o $@

crypto_workflow.o: crypto_workflow.c crypto_ioctl.h
	$(CC) -c $<

switch_read: switch_read.o
	$(CC) $< -o $@

switch_read.o: switch_read.c crypto_ioctl.h
	$(CC) -c $<

led_control: led_control.o
	$(CC) $< -o $@

led_control.o: led_control.c crypto_ioctl.h
	$(CC) -c $<

crypto_test: crypto_test.o
	$(CC) $< -o $@

crypto_test.o: crypto_test.c crypto_ioctl.h
	$(CC) -c $<

# Install files (copy to target directory)
install: all
	@echo "Copy files to your PYNQ-Z2 target:"
	@echo "Kernel module: $(MODULE_NAME).ko"
	@echo "Programs: $(USER_PROGRAMS)"
	@echo ""
	@echo "On PYNQ-Z2, run:"
	@echo "  sudo insmod $(MODULE_NAME).ko"
	@echo "  sudo chmod 666 /dev/crypto_ips"
	@echo "  ./crypto_workflow    # Main program"

# Clean build files
clean:
	rm -f *.o *.ko *.mod.c Module* modules* *.mod $(USER_PROGRAMS)
	rm -rf .tmp_versions
	rm -f *.order *.symvers

# Quick environment setup (alternative to permanent setup)
env-setup:
	@echo "source /home/eos/lab3/pynqz2/images/linux/sdk/environment-setup-cortexa9t2hf-neon-xilinx-linux-gnueabi"

# Help target
help:
	@echo "Available targets:"
	@echo "  all       - Build kernel module and user programs"
	@echo "  module    - Build only kernel module"
	@echo "  userspace - Build only user programs"
	@echo "  install   - Show installation instructions"
	@echo "  clean     - Clean all build files"
	@echo "  env-setup - Show environment setup command"
	@echo "  help      - Show this help"
