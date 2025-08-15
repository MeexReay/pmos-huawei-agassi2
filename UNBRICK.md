download stock files and scripts https://files.meex.lol/huawei-agassi2/agassi2_testpoint_flash_stock.zip

disassembly the tablet

short testpoint, connect usb, check lsusb for huawei device, if there is not, hold power button

run ./enter-fastboot.sh

now you are in fastboot mode, check it with `fastboot devices`

run ./flash-fastboot.sh to flash firmware

it will be a weird chinese firmware, but i think pmos can still be installed on it, and even twrp
