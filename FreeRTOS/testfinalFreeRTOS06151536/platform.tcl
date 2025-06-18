# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\EOS\project\project_1\vitis_test_project\testfinalFreeRTOS06151536\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\EOS\project\project_1\vitis_test_project\testfinalFreeRTOS06151536\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {testfinalFreeRTOS06151536}\
-hw {D:\EOS\project\project_1\system_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {freertos10_xilinx} -fsbl-target {psu_cortexa53_0} -out {D:/EOS/project/project_1/vitis_test_project}

platform write
platform generate -domains 
platform active {testfinalFreeRTOS06151536}
platform generate
platform clean
platform generate
