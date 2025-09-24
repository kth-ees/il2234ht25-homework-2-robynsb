vlog -work work -vopt -sv -stats=none /home/robin/Desktop/digital-systems/il2234ht25-homework-2-robynsb/q1/shift_register.sv
vlog -work work -vopt -sv -stats=none /home/robin/Desktop/digital-systems/il2234ht25-homework-2-robynsb/q1/shift_register_tb.sv

vsim -voptargs=+acc work.shift_register_tb

add wave -position insertpoint  \
sim:/shift_register_tb/serial_parallel \
sim:/shift_register_tb/serial_out \
sim:/shift_register_tb/serial_in \
sim:/shift_register_tb/rst_n \
sim:/shift_register_tb/parallel_out \
sim:/shift_register_tb/parallel_in \
sim:/shift_register_tb/N \
sim:/shift_register_tb/load_enable \
sim:/shift_register_tb/clk \
sim:/shift_register_tb/shit_register_inst/inputData

run
