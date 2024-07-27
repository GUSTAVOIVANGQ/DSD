onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /count/clk_i
add wave -noupdate /count/rst_ni
add wave -noupdate /count/dir_i
add wave -noupdate -expand /count/count
add wave -noupdate /count/clk_div
add wave -noupdate -expand /count/count_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {3897 ps} {4897 ps}
