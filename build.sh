    #!/bin/bash
    clear
    echo OverdoseKernel Compile Tool
    echo By MrDarkness
    echo Please Sit Back And Chill...
	export MAIN=`readlink -f ../`
	export KERNELDIR=`readlink -f .`
	rm -rf $KERNELDIR/built
	mkdir -p $KERNELDIR/built/
    export CROSS_COMPILE=$MAIN/aarch64-linux-gnu/bin/aarch64-linux-gnu-   
    export ARCH=arm64
    make X00T_defconfig
    make -j$(nproc --all) | tee $KERNELDIR/built/kernel_output.txt
	mv $KERNELDIR/arch/arm64/boot/Image.gz-dtb $KERNELDIR/built/Image.gz-dtb
    echo ""
    echo "Compile Done"

