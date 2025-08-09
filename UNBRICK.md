# THIS UNBRICK GUIDE IS UNCOMPLETE!!! DONT FOLLOW IT!!!

download idt images https://files.meex.lol/huawei-agassi2/agassi2_idt_images.zip

download this repository https://github.com/96boards-hikey/tools-images-hikey960/

extract idt images to repository so you will replace config file

disassembly the tablet

disconnect battery and then display as said here https://4pda.to/forum/index.php?showtopic=921432&st=2680#entry109315001

short testpoint and connect usb (you have to see Huawei device in lsusb)

run this command ./hikey_idt -c config -p /dev/ttyUSB0 (maybe you will need to do that as sudo)

now you are in fastboot mode

download board software for agassi2 - https://files.meex.lol/huawei-agassi2/agassi2_board_software.zip

extract some rars so you find usb_update directory

go to usb_update directory and run these commands

```
fastboot flash huawei_crc_check fastbootimage/ptable_crc.img
fastboot flash ptable fastbootimage/ptable.img
fastboot flash huawei_crc_check fastbootimage/sec_xloader_crc.img
fastboot flash xloader fastbootimage/sec_xloader.img
fastboot flash huawei_crc_check fastbootimage/sec_fastboot_crc.img
fastboot flash fastboot fastbootimage/sec_fastboot.img
fastboot flash huawei_crc_check fastbootimage/sec_kernel_crc.img
fastboot flash kernel fastbootimage/sec_kernel.img
fastboot flash huawei_crc_check fastbootimage/boot_ramdisk_crc.img
fastboot flash ramdisk fastbootimage/boot_ramdisk.img
fastboot flash huawei_crc_check fastbootimage/sec_vbmeta_crc.img
fastboot flash vbmeta fastbootimage/sec_vbmeta.img
fastboot flash huawei_crc_check fastbootimage/odm_sparse_crc32c.img
fastboot flash odm fastbootimage/odm.img
fastboot flash huawei_crc_check fastbootimage/recovery_ramdisk_crc.img
fastboot flash recovery_ramdisk fastbootimage/recovery_ramdisk.img
fastboot flash huawei_crc_check fastbootimage/recovery_vendor_crc.img
fastboot flash recovery_vendor fastbootimage/recovery_vendor.img
fastboot flash huawei_crc_check fastbootimage/sec_recovery_vbmeta_crc.img
fastboot flash recovery_vbmeta fastbootimage/sec_recovery_vbmeta.img
fastboot erase cust 
fastboot erase misc 
fastboot flash huawei_crc_check fastbootimage/cache_sparse_crc32c.img
fastboot flash cache fastbootimage/cache.img
fastboot flash huawei_crc_check fastbootimage/sec_lpm3_crc.img
fastboot flash fw_lpm3 fastbootimage/sec_lpm3.img
fastboot flash huawei_crc_check fastbootimage/sec_hifi_crc.img
fastboot flash fw_hifi fastbootimage/sec_hifi.img
fastboot flash huawei_crc_check fastbootimage/sec_trustedcore_crc.img
fastboot flash teeos fastbootimage/sec_trustedcore.img
fastboot flash huawei_crc_check fastbootimage/sec_bl31_crc.bin
fastboot flash trustfirmware fastbootimage/sec_bl31.bin
fastboot flash huawei_crc_check fastbootimage/sec_sensorhub_crc.img
fastboot flash sensorhub fastbootimage/sec_sensorhub.img
fastboot flash huawei_crc_check fastbootimage/sec_dt_crc.img
fastboot flash dts fastbootimage/sec_dt.img
fastboot flash huawei_crc_check fastbootimage/nv_crc.bin
fastboot flash modemnvm_update fastbootimage/nv.bin
fastboot flash huawei_crc_check fastbootimage/sec_modem_fw_crc.img
fastboot flash modem_fw fastbootimage/sec_modem_fw.img
fastboot flash huawei_crc_check fastbootimage/system_sparse_crc32c.img
fastboot flash system fastbootimage/system.img
fastboot flash huawei_crc_check fastbootimage/vendor_sparse_crc32c.img
fastboot flash vendor fastbootimage/vendor.img
fastboot erase product 
fastboot flash huawei_crc_check fastbootimage/product_sparse_crc32c.img
fastboot flash product fastbootimage/product.img
fastboot erase version 
fastboot flash huawei_crc_check fastbootimage/version_sparse_crc32c.img
fastboot flash version fastbootimage/version.img
fastboot erase userdata 
fastboot flash huawei_crc_check fastbootimage/userdata_sparse_crc32c.img
fastboot flash userdata fastbootimage/userdata.img
fastboot flash huawei_crc_check fastbootimage/splash2_sparse_crc32c.img
fastboot flash splash2 fastbootimage/splash2.img
fastboot erase modemnvm_factory 
fastboot erase bootfail_info 
fastboot erase dfx 
fastboot erase rrecord 
fastboot erase patch 
fastboot reboot-bootloader 
sleep 30
fastboot oem hwdog certify set 0 
fastboot oem oeminfoerase-all 
fastboot oem erase_storage_all 
fastboot reboot
```
