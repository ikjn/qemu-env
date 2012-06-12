#!/bin/sh

. ./version.sh

if [ ! -d $OBJDIR ] ; then
	mkdir ${OBJDIR} || exit 1
	cp -f config-omap3 ${OBJDIR}/.config || exit 2
fi

cd $LINUXDIR || exit 1
echo make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} uImage -j4 || exit 1
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} clean || exit 1
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} uImage  -j4 || exit 1
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} modules -j4 || exit 1
cd ..

