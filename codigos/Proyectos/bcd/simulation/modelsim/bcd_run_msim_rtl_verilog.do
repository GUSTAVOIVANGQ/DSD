transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/bcd {D:/altera/13.0sp1/DSD_4CV5/Proyectos/bcd/bcd.v}
vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/bcd {D:/altera/13.0sp1/DSD_4CV5/Proyectos/bcd/DivFreq.v}

