# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\EOS\project\project_1\vitis_test_project\testfinalFreeRTOS06151537_system\_ide\scripts\debugger_testfinalfreertos06151537-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\EOS\project\project_1\vitis_test_project\testfinalFreeRTOS06151537_system\_ide\scripts\debugger_testfinalfreertos06151537-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT2232H 1234-tulA" && level==0 && jtag_device_ctx=="jsn-HW-FTDI-TEST FT2232H-1234-tulA-23727093-0"}
fpga -file D:/EOS/project/project_1/vitis_test_project/testfinalFreeRTOS06151537/_ide/bitstream/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/EOS/project/project_1/vitis_test_project/testfinalFreeRTOS06151536/export/testfinalFreeRTOS06151536/hw/system_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/EOS/project/project_1/vitis_test_project/testfinalFreeRTOS06151537/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/EOS/project/project_1/vitis_test_project/testfinalFreeRTOS06151537/Debug/testfinalFreeRTOS06151537.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
