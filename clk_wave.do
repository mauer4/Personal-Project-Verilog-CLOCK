onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/clk
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/rst
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/TMOD
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/set_TMOD
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/rst_counter
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/counter
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/rst_sec
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/inc_sec
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/sec
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/rst_min
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/set_min
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/inc_min
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/min
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/rst_hr
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/set_hr
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/inc_hr
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/hr
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/next_sec
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/next_min
add wave -noupdate -radix unsigned /tb_CLOCK_rtl/DUT/next_hr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {85 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {528 ps}
