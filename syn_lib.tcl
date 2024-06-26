##################################
####   set library & path
##################################
set lib_root_db /opt/fb_smic18_sc-x_2005q4v1/aci/sc-x/synopsys
set lib_root_sym /opt/fb_smic18_sc-x_2005q4v1/aci/sc-x/symbols/synopsys
set search_path ". $lib_root_db $lib_root_sym"
set target_library " slow.db "
set symbol_library " smic18.sdb"
set link_library "* $target_library "

set top_path /home/1120212262/syn
set report_path $top_path/rpts
set mod SQRT_CSLA_64bit
##################################
####   read design files
##################################
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_11bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_10bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_9bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_8bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_7bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_6bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_5bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Carry_Select_Adder_4bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Ripple_Carry_Adder_4bit.vhd
read_file -format vhdl -rtl $top_path/rtl/Full_Adder.vhd
read_file -format vhdl -rtl $top_path/rtl/SQRT_CSLA_64bit.vhd

##################################
####   link design
##################################
current_design {SQRT_CSLA_64bit}

link
##################################
####   define variables
################################## 
set     clock_period1   8 
set     chip_area       6500
##################################
####   deal with clock
##################################
create_clock -period $clock_period1 -name clk
set_clock_uncertainty -setup 0.04 clk
set_clock_uncertainty -hold  0.02 clk

set_input_delay 0.2 -clock clk [all_inputs]
set_output_delay 0.3 -clock clk [all_outputs]

set_load 1 [all_outputs]

set_driving_cell -lib_cell INVX1 [all_inputs]

set_max_area $chip_area
set_max_fanout 100 [ get_designs SQRT_CSLA_64bit]
##################################
####   set wire load
##################################
set auto_wire_load_selection true
set_wire_load_model -name smic18_wl10 -library slow
##################################
####   complile type
##################################
compile
##################################
####   write files
##################################
write -f verilog -hier -output $top_path/mapped/$mod\.v
write_sdf ./mapped/$mod\.sdf

check_design > $report_path/check.rpt
report_constraint -all_violators -verbose > $report_path/constraint.rpt
report_timing -path full -delay max -max_path 50 -input_pins \
	      -nets -transition_time -capacitance  > $report_path/timing_max.rpt
report_timing -path full -delay min -max_path 50 -input_pins \
	      -nets -transition_time -capacitance  > $report_path/timing_min.rpt
report_clock > $report_path/clk.rpt
report_qor   > $report_path/qor.rpt
report_power > $report_path/power.rpt
report_cell  > $report_path/cell.rpt

exit
