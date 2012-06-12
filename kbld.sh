#!/bin/sh

. ./version.sh

CURDIR=`pwd`

clean() {
	cd "$LINUXDIR"
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} clean || exit 1
	cd "$CURDIR"
}

uimage() {
	cd "$LINUXDIR"
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} uImage  -j4 || exit 1
	cd "$CURDIR"
}

modules() {
	cd "$LINUXDIR"
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=${OBJDIR} modules -j4 || exit 1
	cd "$CURDIR"
}

if [ ! -d $OBJDIR ] ; then
	mkdir ${OBJDIR} || exit 1
	cp -f config-omap3 ${OBJDIR}/.config || exit 2
fi

if [ ! -d "$LINUXDIR" ] ; then
	echo "$LINUXDIR" is not existed.?
fi

case "$1" in
  all)
    clean
	uimage
	modules
	;;
  clean)
    clean
	;;
  *)
    uimage
    ;;
esac

exit 0

