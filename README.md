# V0_backup

########### Hardware ###########

MCU
https://docs.vorondesign.com/build/software/miniE3_v20_klipper.html
	
	BTT SKR Mini e3-v2
	STM32F103
	28KiB bootloader
	8 MHz clock
	serial: /dev/serial/by-id/usb-Klipper_stm32f103xe_37FFD5055358353227800843-if00
 


Toolhead
https://github.com/bigtreetech/EBB/tree/master/EBB%20CAN%20V1.1%20(STM32G0B1) 
	https://github.com/maz0r/klipper_canbus/blob/main/toolhead/ebb36-42_v1.1.md 
	
	EBB36 
	STM32G0B1
	8KiB offset
	8 MHz clock
	canbus UUID: 6015553193ee, Application: CanBoot
	

Klipper expander
https://github.com/VoronDesign/Voron-Hardware/blob/master/Klipper_Expander/Documentation/README.md#seup 
	
	STM32F042
	no bootloader
	internal clock
	DFU [0483:df11]
	serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_280014000A43564636373420-if00 
	

Display
https://github.com/VoronDesign/Voron-Hardware/tree/master/V0_Display

	STM32F042
	no bootloader
	internal clock
	DFU [0483:df11]
	serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_0A0036000C43535035373520-if00
	
After hard reset - recreate gcode_shell_command.py
https://github.com/th33xitus/kiauh/blob/master/resources/gcode_shell_command.py

########### firmware ###########

auto update firmare command
~~~~~~~~~~~~~~~~~~~~~~~~~
cd ~/klipper
sudo bash update-all.sh
~~~~~~~~~~~~~~~~~~~~~~~~~
auto update firmware code
~~~~~~~~~~~~~~~~~~~~~~~~~
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
#make clean 
#make menuconfig 
#make
#make flash FLASH_DEVICE=0483:df11 

sudo service klipper start
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
