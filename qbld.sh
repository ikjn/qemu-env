#!/bin/bash

. ./version.sh

CURDIR=`pwd`

configure() {
	if [ ! -d $QOBJDIR ] ; then
		mkdir $QOBJDIR
	fi
	cd $QOBJDIR
	echo "configure $qconf_opt"
	make distclean 2>/dev/null
	../qemu-linaro/configure ${qconf_opt} || exit 1
	cd $CURDIR
}

build() {
	if [ ! -d $QOBJDIR ] ; then
		echo "$QOBJDIR" is not found.
		exit 1
	fi
	cd $QOBJDIR
	make -j4 || exit 1
	make install || exit 1
	cd $CURDIR
}

case "$1" in
  all)
  	configure
	build
	;;
  *)
    build
	;;
esac

exit 0

