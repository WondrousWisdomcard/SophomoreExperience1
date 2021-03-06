# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.cache/wt [current_project]
set_property parent.project_path C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/ALU.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/ALUControl.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Add1.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Add2.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/CPU.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Control.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/DataMemory.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/EX.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/ID.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/IF.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/InstructionMemory.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/JumpUnit.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Light.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/MEM.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Mux1.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Mux2.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Mux3.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Mux4.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Mux5.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Mux6.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/PC.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/RegEXMEM.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/RegIDEX.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/RegIFID.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/RegMEMWB.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/Registers.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/SetPCSrc.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/SignExtend.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/WB.v
  C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/sources_1/new/ToFPGA.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/constrs_1/new/XDC.xdc
set_property used_in_implementation false [get_files C:/Users/17727/Desktop/VivadoArea/MultiCycleCPU/MultiCycleCPU.srcs/constrs_1/new/XDC.xdc]


synth_design -top ToFPGA -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ToFPGA.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file ToFPGA_utilization_synth.rpt -pb ToFPGA_utilization_synth.pb"
