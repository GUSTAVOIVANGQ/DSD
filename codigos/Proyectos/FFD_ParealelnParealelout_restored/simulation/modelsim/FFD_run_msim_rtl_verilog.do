transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored/FFD.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored/DivFreq.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored/FDD_FPGA.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored {D:/altera/13.0sp1/DSD_4CV5/Proyectos/FFD_ParealelnParealelout_restored/FFD_ctr.v}

