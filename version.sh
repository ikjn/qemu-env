VERSION=3.1.1+
LINUXDIR=`pwd`/linux-stable
OBJDIR=`pwd`/obj-${VERSION}
MODDIR=`pwd`/output/rootfs
# ...
QEMU=/home/coolbox/usr/qemu-linaro/bin/qemu-system-arm
#QEMU=/home/coolbox/usr/qemu-linaro-0.15.91/bin/qemu-system-arm
#QEMU=/usr/bin/qemu-system-arm

# file system info
IMG=test.img
OFFSET_BOOT=32256
OFFSET_ROOT=54525952

KCONFIG="config-omap3"

QOBJDIR=`pwd`/qemu-obj

qconf_trace="--enable-trace-backend=simple"
qconf_prefix="--prefix=/home/coolbox/usr/qemu-linaro"
qconf_fi="--enable-fault-injection"
qconf_mtrace="--enable-mtrace"
qconf_targets="--target-list=arm-softmmu"
qconf_opt="$conf_prefix $conf_trace $conf_fi $conf_mtrace $conf_targets"

BBCONFIG="config-busybox"
BBTAG="1_19_4"
KCONFIG="config-$VERSION"
KTAG=3.1.1
QEMU_GIT="git@github.com:ikjn/qemu-fi-monitor.git"

