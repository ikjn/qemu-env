#!/bin/sh

. ./version.sh

uimage() {
	cp ${OBJDIR}/arch/arm/boot/uImage ./output/boot
	sudo cp ${OBJDIR}/arch/arm/boot/uImage ./mnt/boot
}

modules() {
	CURDIR=`pwd`
	
	if [ ! -d ${MODDIR} ] ; then
		mkdir ${MODDIR} || exit 1
	fi

	cd $LINUXDIR || exit 1
	make INSTALL_MOD_PATH=${MODDIR} ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- \
		O=${OBJDIR} modules_install  || exit 1
	cd $CURDIR

	sudo rm -rf ./mnt/rootfs/lib/modules/${VERSION}
	sudo cp -R ${MODDIR}/lib/modules/${VERSION} ./mnt/rootfs/lib/modules/
}

./mnt.sh

case "$1" in
  all)
    uimage
	modules
	;;
  *)
    uimage
	;;
esac

./umnt.sh

