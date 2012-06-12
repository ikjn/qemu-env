#!/bin/bash

. ./version.sh

./umnt.sh

sudo mount ${IMG} ./mnt/boot -o loop,offset=${OFFSET_BOOT}&&\
sudo mount ${IMG} ./mnt/rootfs -o loop,offset=${OFFSET_ROOT}
