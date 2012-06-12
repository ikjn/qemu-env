#!/bin/sh

. ./version.sh

cd linux-stable || exit 1
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} menuconfig || exit 1

