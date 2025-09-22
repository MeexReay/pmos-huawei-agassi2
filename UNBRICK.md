download stock files and scripts https://files.meex.lol/huawei-agassi2/agassi2_testpoint_flash_stock.zip

disassembly the tablet

short testpoint, connect usb, check lsusb for huawei device, if there is not, hold power button

run ./enter-fastboot.sh

now you are in fastboot mode, check it with `fastboot devices`

run ./flash-fastboot.sh to flash firmware

you can flash twrp with ./flash-twrp.sh

it will be a weird chinese firmware, but it still work

to flash any image on it, you need to use ./generatecrc16 script from here: https://github.com/MeexReay/huawei-firmware-tools
you will need to install rsbkb to make it work (https://github.com/trou/rsbkb)

flashing kernel and ramdisk will look like this:

```
./generatecrc16 kernel.img ramdisk.img
fastboot flash huawei_crc_check kernel_crc.img
fastboot flash kernel kernel.img
fastboot flash huawei_crc_check ramdisk_crc.img
fastboot flash ramdisk ramdisk.img
```

you can flash anything so

original fastboot images can be found here: https://files.meex.lol/huawei-agassi2/agassi2_firmware_fastboot.zip

i flashed them like this:

```
./flash_with_crc.sh
fastboot reboot # hold vol down here
./flash.sh
fastboot reboot
```

but it still didnt boot, so i stay on that first weird firmware

we need a way to generate _sparse_crc32c of images, then we could flash stock firmware without rebooting to its fastboot. generatecrc32c from [huawei-firmware-tools](https://github.com/MeexReay/huawei-firmware-tools) makes some part of it
