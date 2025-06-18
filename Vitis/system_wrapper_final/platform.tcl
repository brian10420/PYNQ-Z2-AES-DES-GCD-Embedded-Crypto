# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\embeding_system\Vitis\system_wrapper_final\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\embeding_system\Vitis\system_wrapper_final\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {system_wrapper_final}\
-hw {C:\embeding_system\project_2_final\system_wrapper_final.xsa}\
-fsbl-target {psu_cortexa53_0} -out {C:/embeding_system/Vitis}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {system_wrapper_final}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
bsp reload
platform generate -domains 
