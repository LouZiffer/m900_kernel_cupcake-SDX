#!/bin/bash

CROSS_COMPILE=/usr/local/arm/4.3.1-eabi-armv6/usr/bin/arm-linux-
CROSS_INCLUDE=/usr/local/arm/4.3.1-eabi-armv6/usr/arm-linux/include

PWD=`pwd`

make -j8 ARCH=arm CFLAGS_KERNEL="-Os -I${CROSS_INCLUDE}" CROSS_COMPILE=$CROSS_COMPILE LINUX_VERSION="2.6.27" -C linux-2.6.27 zImage

make -j8 CROSS_COMPILE=$CROSS_COMPILE KDIR="${PWD}/linux-2.6.27" PRJROOT=$PWD BOARD_NAME="instinctq" FLASH_ONENAND=y BOARD_REVISION="01" LINUX_VERSION=2.6.27 MODULES_DPRAM=y MODULES_CAMERA=y MODULES_TA=n MODULES_WLAN=y MODULES_VIBETONZ=y MODULES_MULTIMEDIA=y MODULES_PARAM=y MODULES_BTGPIO=y -C modules
