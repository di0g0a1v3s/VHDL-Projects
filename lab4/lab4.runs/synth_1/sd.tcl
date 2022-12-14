# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Maria/Desktop/lab4/lab4.cache/wt [current_project]
set_property parent.project_path C:/Users/Maria/Desktop/lab4/lab4.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/Maria/Desktop/lab4/lab4.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/full_adder.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/ff_de.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/somador5.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/dec_4.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/ctr_control.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/ctr_16.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/instr_counter.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/controlo_v2.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/alu.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/float_reg_v2.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/design/float_add.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/placa/disp7.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/placa/clkdiv.vhd
  C:/Users/Maria/Desktop/lab4/lab4.srcs/sources_1/imports/placa/sd.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Maria/Desktop/lab4/lab4.srcs/constrs_1/imports/placa/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/Maria/Desktop/lab4/lab4.srcs/constrs_1/imports/placa/Basys3_Master.xdc]


synth_design -top sd -part xc7a35tcpg236-1


write_checkpoint -force -noxdef sd.dcp

catch { report_utilization -file sd_utilization_synth.rpt -pb sd_utilization_synth.pb }
