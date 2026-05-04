#时序约束
create_clock -period 20.000 -name sys_clk [get_ports sys_clk] 

#----------------------系统时钟---------------------------
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk]

#----------------------系统复位---------------------------
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]

set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports led]