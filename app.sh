#!/bin/bash

./mnt.sh

cp -f output/rootfs/home/* ./mnt/rootfs/home/

./umnt.sh
