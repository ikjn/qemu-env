#!/bin/bash

. ./version.sh

./umnt.sh

rm -rf output
rm -rf mnt

mkdir output
mkdir output/boot
mkdir output/rootfs

# 1. busybox
# check config
# copy source
# build

# 2. kernel (config-omap3)
# check config
# source
# objdir

# 3. qemu-linaro
# build
# install

# 4. create sd card image

# ...
