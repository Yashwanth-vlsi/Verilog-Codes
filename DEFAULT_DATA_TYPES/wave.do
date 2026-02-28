onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /data_type/a
add wave -noupdate /data_type/b
add wave -noupdate /data_type/c
add wave -noupdate /data_type/d
add wave -noupdate /data_type/e
add wave -noupdate /data_type/f
add wave -noupdate /data_type/g
add wave -noupdate /data_type/h
add wave -noupdate /data_type/i
add wave -noupdate /data_type/j
add wave -noupdate /data_type/k
add wave -noupdate /data_type/l
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {85 ns} {101 ns}
