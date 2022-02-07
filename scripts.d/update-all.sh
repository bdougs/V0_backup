sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.btt-skr-mini-e3-v2
make menuconfig KCONFIG_CONFIG=config.btt-skr-mini-e3-v2
make KCONFIG_CONFIG=config.btt-skr-mini-e3-v2
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f103xe_37FFD5055358353227800843-if00 btt-skr-mini-e3-v2 

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi

sudo service klipper start

#make flash FLASH_DEVICE=0483:df11 
#display serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_0A0036000C43535035373520-if00
#expander serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_280014000A43564636373420-if00 DFU [0483:df11]