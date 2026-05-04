#时序约束
create_clock -period 20.000 -name sys_clk [get_ports sys_clk] 

#----------------------系统时钟---------------------------
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk]

#----------------------系统复位---------------------------
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]

#----------------------PL_KEY---------------------------
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports key]

#----------------------蜂鸣器---------------------------
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports beep]