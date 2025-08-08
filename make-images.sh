#!/bin/sh

mkdir -p custom
cd custom
cp /tmp/postmarketOS-export/boot.img .
cp /tmp/postmarketOS-export/huawei-agassi2.img rootfs.img
git clone https://github.com/anestisb/android-unpackbootimg.git
cd android-unpackbootimg
make
cd ..
mkdir -p output/
./android-unpackbootimg/unpackbootimg -i boot.img -o output/
touch empty.file
./android-unpackbootimg/mkbootimg.py \
  --kernel empty.file \
  --ramdisk output/boot.img-ramdisk.gz \
  --cmdline 'buildvariant=user' \
  --os_version 8.0.0 \
  --os_patch_level 2018-06-05 \
  -o ramdisk.img
./android-unpackbootimg/mkbootimg.py \
  --kernel output/boot.img-zImage \
  --ramdisk empty.file \
  --cmdline 'loglevel=4 initcall_debug=y page_tracker=on slub_min_objects=16 unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=enforcing buildvariant=user' \
  --base 0x10000000 \
  --kernel_offset 0x00008000 \
  --ramdisk_offset 0x01000000 \
  --second_offset 0x00f00000 \
  --tags_offset 0x00000100 \
  --os_version 8.0.0 \
  --os_patch_level 2018-12 \
  -o kernel.img
cd ..
rm -rf output
mkdir output
mv custom/rootfs.img custom/kernel.img custom/ramdisk.img output

echo
echo "1. Boot from fastboot"
echo "2. Flash kernel:"
echo
echo "fastboot flash kernel output/kernel.img"
echo "fastboot flash ramdisk output/ramdisk.img"
echo
echo "3. Flash rootfs to sdcard:"
echo
echo "dd if=output/rootfs.img of=/path/to/sdcard bs=2048 status=progress"
echo "# change /path/to/sdcard to your /dev/<disk_id> from lsblk or fdisk -l"
