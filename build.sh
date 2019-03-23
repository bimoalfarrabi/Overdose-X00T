	#!/bin/bash
	clear
	echo OverdoseKernel Compile Tool
	echo By MrDarkness
	echo Please Sit Back And Chill...
	export MAIN=`readlink -f ../`
	export KERNELDIR=`readlink -f .`
	rm -rf $KERNELDIR/built
	mkdir -p $KERNELDIR/built/
	make ARCH=arm64 X00T_defconfig
	make -j$(nproc --all) ARCH=arm64 \
                      CC="$MAIN/aosp-clang/bin/clang" \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE="$MAIN/aarch64-linux-gnu/bin/aarch64-linux-gnu-"
	rm -rf $KERNELDIR/built
	mkdir -p $KERNELDIR/built/
	mv $KERNELDIR/arch/arm64/boot/Image.gz-dtb $KERNELDIR/built/Image.gz-dtb

	echo ""
	echo "Compile Done"
