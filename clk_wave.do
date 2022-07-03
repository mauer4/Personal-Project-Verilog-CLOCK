onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_CLOCK_rtl/DUT/clk
add wave -noupdate /tb_CLOCK_rtl/DUT/rst
add wave -noupdate /tb_CLOCK_rtl/DUT/state
add wave -noupdate /tb_CLOCK_rtl/DUT/next_state
add wave -noupdate -group Inputs /tb_CLOCK_rtl/DUT/set_min
add wave -noupdate -group Inputs /tb_CLOCK_rtl/DUT/set_hr
add wave -noupdate -group Inputs /tb_CLOCK_rtl/DUT/AM2PM
add wave -noupdate -expand -group Outputs -radix unsigned /tb_CLOCK_rtl/DUT/sec
add wave -noupdate -expand -group Outputs -radix unsigned /tb_CLOCK_rtl/DUT/min
add wave -noupdate -expand -group Outputs -radix unsigned /tb_CLOCK_rtl/DUT/hr
add wave -noupdate -expand -group Counter -radix unsigned /tb_CLOCK_rtl/DUT/counter
add wave -noupdate -expand -group Counter -radix unsigned /tb_CLOCK_rtl/DUT/next_counter
add wave -noupdate -expand -group {Next outputs} -radix unsigned /tb_CLOCK_rtl/DUT/next_sec
add wave -noupdate -expand -group {Next outputs} -radix unsigned /tb_CLOCK_rtl/DUT/next_min
add wave -noupdate -expand -group {Next outputs} -radix unsigned /tb_CLOCK_rtl/DUT/next_hr
add wave -noupdate -group {Set/Add signals} -radix unsigned /tb_CLOCK_rtl/DUT/add_min
add wave -noupdate -group {Set/Add signals} -radix unsigned /tb_CLOCK_rtl/DUT/next_add_min
add wave -noupdate -group {Set/Add signals} -radix unsigned /tb_CLOCK_rtl/DUT/add_hr
add wave -noupdate -group {Set/Add signals} -radix unsigned /tb_CLOCK_rtl/DUT/next_add_hr
add wave -noupdate /tb_CLOCK_rtl/DUT/set_AMPM
add wave -noupdate -expand -group Increase_module -radix unsigned /tb_CLOCK_rtl/DUT/increase_second/sec_in
add wave -noupdate -expand -group Increase_module -radix unsigned /tb_CLOCK_rtl/DUT/increase_second/min_in
add wave -noupdate -expand -group Increase_module -radix unsigned /tb_CLOCK_rtl/DUT/increase_second/hr_in
add wave -noupdate -expand -group Increase_module -radix unsigned /tb_CLOCK_rtl/DUT/increase_second/set_AMPM
add wave -noupdate -expand -group Increase_module -radix unsigned /tb_CLOCK_rtl/DUT/increase_second/sec_out
add wave -noupdate -expand -group Increase_module -radix unsigned /tb_CLOCK_rtl/DUT/increase_second/min_out
add wave -noupdate -expand -group Increase_module -radix unsigned /tb_CLOCK_rtl/DUT/increase_second/hr_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {56 ps} 0}
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
WaveRestoreZoom {0 ps} {64 ps}
