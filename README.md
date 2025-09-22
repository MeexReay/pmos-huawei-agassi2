# pmos-huawei-agassi2
PostmarketOS port for Huawei MediaPad T5

Fastboot firmware images: https://files.meex.lol/huawei-agassi2/agassi2_firmware_fastboot.zip

## installation

init device:

```sh
git clone https://github.com/MeexReay/pmos-huawei-agassi2.git
cd pmos-huawei-agassi2
./install.sh
pmbootstrap init # choose huawei-agassi2 here
```

create images:
  
```sh
pmbootstrap install
pmbootstrap export
./make-images.sh
```

flash output/rootfs.img to sdcard

enter fastboot mode

flash kernel:

```sh
fastboot flash kernel output/kernel.img
fastboot flash ramdisk output/ramdisk.img
```

reboot the device:

```sh
fastboot reboot
```

## flash recovery

```sh
wget https://files.meex.lol/huawei-agassi2/agassi2_recovery_twrp.img
fastboot flash recovery_ramdisk agassi2_recovery_twrp.img
```

## kernel.img, ramdisk.img -> boot.img

```sh
git clone https://github.com/anestisb/android-unpackbootimg.git
cp android-unpackbootimg/. . -a
make
./mkbootimg --kernel kernel.img --ramdisk ramdisk.img --output boot.img
```

## boot.img -> kernel.img, ramdisk.img

```sh
# cp /tmp/postmarketOS-export/boot.img .
git clone https://github.com/anestisb/android-unpackbootimg.git
cp android-unpackbootimg/. . -a
make
mkdir -p output/
./unpackbootimg -i boot.img -o output/
touch empty.file
./mkbootimg.py --kernel empty.file --ramdisk output/boot.img-ramdisk.gz --cmdline 'buildvariant=user' --os_version 8.0.0 --os_patch_level 2018-06-05 -o ramdisk.img
./mkbootimg.py --kernel output/boot.img-zImage --ramdisk empty.file --cmdline 'loglevel=4 initcall_debug=y page_tracker=on slub_min_objects=16 unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=enforcing buildvariant=user' --base 0x10000000 --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --second_offset 0x00f00000 --tags_offset 0x00000100 --os_version 8.0.0 --os_patch_level 2018-12 -o kernel.img
```
