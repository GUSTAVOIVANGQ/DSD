transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout/FFD.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout/DivFreq.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout/FDD_FPGA.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParalelinSerialout/FFD_ctrl.v}

