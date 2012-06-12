#!/bin/bash

. ./version.sh

busybox() {
	rm -rf ./busybox
	git clone git://busybox.net/busybox.git ./busybox || exit 1
	cd ./busybox
	git checkout -b $BBTAG+ $BBTAG
	cd ..
}

kernel() {
	rm -rf linux-stable
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git || exit 1
	cd linux-stable
	git checkout -b $VERSION $KTAG || exit 1
	cd ..
}

init() {
	rm -rf output
	rm -rf mnt

	mkdir output
	mkdir output/boot
	mkdir output/rootfs
}

qemu() {
	rm -rf qemu-linaro
	git clone $QEMU_GIT
	cd qemu-linaro
}

case "$1" in
  all)
  	init
	busybox
	kernel
	qemu
	;;
  busybox)
    busybox
	;;
  kernel)
    kernel
	;;
  qemu)
    qemu
	;;
esac

exit 0

