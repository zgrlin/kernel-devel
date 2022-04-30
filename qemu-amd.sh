#!/bin/bash

cd kernel/linux
make ARCH=arm64 defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8

RUN qemu-system-aarch64 \
	  -s \
	  -machine virt \
	  -cpu cortex-a57 \
	  -smp 4  \
	  -machine type=virt \
	  -nographic \
	  -m 2048 \
	  -kernel ~/arm64_kernel/arch/arm64/boot/Image \
	  --append "console=ttyAMA0" \
	  -initrd ~/buildroot/output/images/rootfs.cpio
