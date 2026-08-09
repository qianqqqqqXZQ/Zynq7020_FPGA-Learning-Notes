create_clock -period 20.000 -name sys_clk [get_ports sys_clk]

#IO绾︽潫鏂囦欢

#----------------------绯荤粺鏃堕挓---------------------------
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk]

#----------------------绯荤粺澶嶄綅---------------------------
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]

set_property -dict {PACKAGE_PIN U20 IOSTANDARD LVCMOS33} [get_ports clk_33m]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports clk_33m_180deg]
