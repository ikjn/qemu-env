#!/bin/bash

. ./version.sh

#./umnt.sh

$QEMU -M beagle -m 256 -clock unix \
	-monitor stdio  \
	-drive file=${IMG},if=sd,cache=writeback \
	-serial telnet::4567,server,nowait \
	-usb \
	-netdev user,id=mynet \
	-drive if=none,file=usb.img,id=myusb \
	-device usb-net,netdev=mynet \
	-device usb-storage,id=myusb,drive=myusb,removable=on \
    -s

