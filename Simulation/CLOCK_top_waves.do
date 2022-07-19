onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_clock_top_rtl/DUT/CLOCK_50
add wave -noupdate -label rst {/tb_clock_top_rtl/DUT/KEY[3]}
add wave -noupdate -expand -group CLOCK_signals /tb_clock_top_rtl/DUT/clk/state
add wave -noupdate -expand -group CLOCK_signals /tb_clock_top_rtl/DUT/clk/next_state
add wave -noupdate -expand -group CLOCK_signals -radix unsigned /tb_clock_top_rtl/DUT/clk/counter
add wave -noupdate -label set_AMPM {/tb_clock_top_rtl/DUT/KEY[2]}
add wave -noupdate -label set_hr {/tb_clock_top_rtl/DUT/KEY[1]}
add wave -noupdate -label set_nmin {/tb_clock_top_rtl/DUT/KEY[0]}
add wave -noupdate /tb_clock_top_rtl/DUT/AMPM
add wave -noupdate -radix unsigned /tb_clock_top_rtl/DUT/hr
add wave -noupdate -radix unsigned /tb_clock_top_rtl/DUT/min
add wave -noupdate -radix unsigned /tb_clock_top_rtl/DUT/sec
add wave -noupdate -group Digits /tb_clock_top_rtl/DUT/sec_dig1
add wave -noupdate -group Digits /tb_clock_top_rtl/DUT/sec_dig2
add wave -noupdate -group Digits /tb_clock_top_rtl/DUT/min_dig1
add wave -noupdate -group Digits /tb_clock_top_rtl/DUT/min_dig2
add wave -noupdate -group Digits /tb_clock_top_rtl/DUT/hr_dig1
add wave -noupdate -group Digits /tb_clock_top_rtl/DUT/hr_dig2
add wave -noupdate -group {Hex displays} /tb_clock_top_rtl/DUT/HEX0
add wave -noupdate -group {Hex displays} /tb_clock_top_rtl/DUT/HEX1
add wave -noupdate -group {Hex displays} /tb_clock_top_rtl/DUT/HEX2
add wave -noupdate -group {Hex displays} /tb_clock_top_rtl/DUT/HEX3
add wave -noupdate -group {Hex displays} /tb_clock_top_rtl/DUT/HEX4
add wave -noupdate -group {Hex displays} /tb_clock_top_rtl/DUT/HEX5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1 ns}
