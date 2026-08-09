#鏃跺簭绾︽潫
create_clock -period 20.000 -name sys_clk [get_ports sys_clk]

#----------------------绯荤粺鏃堕挓---------------------------
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk]

#----------------------绯荤粺澶嶄綅---------------------------
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]

set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports led]
