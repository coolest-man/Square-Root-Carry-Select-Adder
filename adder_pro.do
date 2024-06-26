vlog /opt/fb_smic18_sc-x_2005q4v1/aci/sc-x/verilog/smic18.v 
vlog ~/syn/mapped/SQRT_CSLA_64bit.v

vlog ~/syn/tb/SQRT_CSLA_64bit_tb.v


vsim -t 10ns +notimingchecks -novopt -sdfmax /SQRT_CSLA_64bit_tb/DUT=../mapped/SQRT_CSLA_64bit.sdf -sdfnoerror -sdfnowarn work.SQRT_CSLA_64bit_tb

run 2500 ms
quit -sim
quit
