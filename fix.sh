#!/bin/bash

. ./version.sh

./umnt.sh

sudo losetup /dev/loop5 ./${IMG} -o $OFFSET_ROOT || exit 1
sudo fsck -p /dev/loop5
sudo losetup -d /dev/loop5

