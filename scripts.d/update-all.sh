sudo service klipper stop
cd ~/klipper
git pull

#MCU
make clean KCONFIG_CONFIG=config.btt-skr-mini-e3-v2
make menuconfig KCONFIG_CONFIG=config.btt-skr-mini-e3-v2
make KCONFIG_CONFIG=config.btt-skr-mini-e3-v2
#make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f103xe_37FFD5055358353227800843-if00 KCONFIG_CONFIG=config.btt-skr-mini-e3-v2
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f103xe_37FFD5055358353227800843-if00 btt-skr-mini-e3-v2 

#linuxhost
make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi

#toolhead
make clean 
make menuconfig 
make 
python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 6015553193ee

#V0Display / expander
#display serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_0A0036000C43535035373520-if00 DFU [0483:df11]
#expander serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_280014000A43564636373420-if00 DFU [0483:df11]
make clean 
make menuconfig 
make
make flash FLASH_DEVICE=0483:df11 

sudo service klipper start
