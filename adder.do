vlog ~/syn/rtl/Carry_Select_Adder_11bit.vhd
vlog ~/syn/rtl/Carry_Select_Adder_10bit.vhd
vlog ~/syn/rtl/Carry_Select_Adder_9bit.vhd
vlog ~/syn/rtl/Carry_Select_Adder_8bit.vhd
vlog ~/syn/rtl/Carry_Select_Adder_7bit.vhd
vlog ~/syn/rtl/Carry_Select_Adder_6bit.vhd
vlog ~/syn/rtl/Carry_Select_Adder_5bit.vhd
vlog ~/syn/rtl/Carry_Select_Adder_4bit.vhd
vlog ~/syn/rtl/Ripple_Carry_Adder_4bit.vhd
vlog ~/syn/rtl/Full_Adder.vhd
vlog ~/syn/rtl/SQRT_CSLA_64bit.vhd

vlog ~/syn/tb/SQRT_CSLA_64bit_tb.v

vsim -t 10ns +notimingchecks -novopt work.SQRT_CSLA_64bit_tb

run 2500 ms
quit -sim
quit
