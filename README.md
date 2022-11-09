# V0_backup
	After hard reset - update shell command .py 
	https://github.com/th33xitus/kiauh/blob/master/resources/gcode_shell_command.py

########### Hardware ###########

MCU
	
	BTT SKR Mini e3-v2
	STM32F103
	28KiB bootloader
	8 MHz clock
	serial: /dev/serial/by-id/usb-Klipper_stm32f103xe_37FFD5055358353227800843-if00
	https://docs.vorondesign.com/build/software/miniE3_v20_klipper.html

Toolhead
	
	EBB36 
	STM32G0B1
	no bootloader
	8 MHz clock
	canbus UUID: 6015553193ee, Application: CanBoot
	https://github.com/bigtreetech/EBB/tree/master/EBB%20CAN%20V1.1%20(STM32G0B1) 
	https://github.com/maz0r/klipper_canbus/blob/main/toolhead/ebb36-42_v1.1.md 

Klipper expander
	
	STM32F042
	no bootloader
	internal clock
	DFU [0483:df11]
	serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_280014000A43564636373420-if00 
	https://github.com/VoronDesign/Voron-Hardware/blob/master/Klipper_Expander/Documentation/README.md#seup 

Display
	
	STM32F042
	no bootloader
	internal clock
	DFU [0483:df11]
	serial: /dev/serial/by-id/usb-Klipper_stm32f042x6_0A0036000C43535035373520-if00
	https://github.com/VoronDesign/Voron-Hardware/tree/master/V0_Display
	
<img src="V0_backup/blob/main/Menuconfig_Options.png" width="1000">

