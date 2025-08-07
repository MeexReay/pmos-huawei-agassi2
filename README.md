# pmos-huawei-agassi2
PostmarketOS port for Huawei MediaPad T5

Fastboot firmware images: https://files.meex.lol/huawei-agassi2/agassi2_firmware_fastboot.zip

## How to get boot.img from kernel.img and ramdisk.img

```sh
git clone https://github.com/anestisb/android-unpackbootimg.git
make
./mkbootimg --kernel kernel.img --ramdisk ramdisk.img --output boot.img
```

## How to get kernel.img and ramdisk.img from boot.img

idk maybe later
