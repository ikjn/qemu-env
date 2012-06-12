#!/bin/bash

. ./version.sh

arm-linux-gnueabi-objdump -dS $OBJDIR/vmlinux > $LINUXDIR/vmlinux.dis

