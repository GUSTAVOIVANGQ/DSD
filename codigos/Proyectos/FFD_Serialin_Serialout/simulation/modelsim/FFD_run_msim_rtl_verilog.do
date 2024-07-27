transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_Serialin_Serialout {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_Serialin_Serialout/FFD.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_Serialin_Serialout {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_Serialin_Serialout/DivFreq.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_Serialin_Serialout {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_Serialin_Serialout/FDD_FPGA.v}

