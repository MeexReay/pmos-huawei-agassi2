#!/bin/sh

# make an output dir and copy rootfs
rm -rf output
mkdir output
cp /tmp/postmarketOS-export/huawei-agassi2.img output/rootfs.img

# make a work dir and copy boot image
mkdir -p custom
cp /tmp/postmarketOS-export/boot.img custom/

# compile unpackbootimg
cd custom
git clone https://github.com/anestisb/android-unpackbootimg.git
cd android-unpackbootimg
make
cd ../..

# split boot image
cd custom
mkdir -p output
./android-unpackbootimg/unpackbootimg -i boot.img -o output
cd ..

# make kernel and ramdisk images
rm custom/empty.file
touch custom/empty.file # todo: try /dev/null
./android-unpackbootimg/mkbootimg.py \
  --kernel custom/empty.file \
  --ramdisk custom/output/boot.img-ramdisk.gz \
  --cmdline 'buildvariant=user' \
  --os_version 8.0.0 \
  --os_patch_level 2018-06-05 \
  -o output/ramdisk.img
./android-unpackbootimg/mkbootimg.py \
  --kernel custom/output/boot.img-zImage \
  --ramdisk custom/empty.file \
  --cmdline 'loglevel=4 initcall_debug=y page_tracker=on slub_min_objects=16 unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=enforcing buildvariant=user' \
  --base 0x10000000 \
  --kernel_offset 0x00008000 \
  --ramdisk_offset 0x01000000 \
  --second_offset 0x00f00000 \
  --tags_offset 0x00000100 \
  --os_version 8.0.0 \
  --os_patch_level 2018-12 \
  -o output/kernel.img

echo
echo "1. Flash rootfs to sdcard:"
echo
echo "dd if=output/rootfs.img of=/dev/sdX bs=4M status=progress"
echo
echo "2. Boot from fastboot"
echo "3. Flash kernel:"
echo
echo "fastboot flash kernel output/kernel.img"
echo "fastboot flash ramdisk output/ramdisk.img"
echo "fastboot reboot"
