transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/altera/13.0sp1/DSD_4CV5/Proyectos/ram1 {D:/altera/13.0sp1/DSD_4CV5/Proyectos/ram1/ram1.v}

