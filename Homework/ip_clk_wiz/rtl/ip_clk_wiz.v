module ip_clk_wiz(
    input     sys_clk,
    input     sys_rst_n,
    output    clk_33m,
    output    clk_33m_180deg
);

wire      locked;
wire      rst_n;

assign  rst_n = sys_rst_n & locked;


clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1    (clk_33m),     // output clk_out1
    .clk_out2    (clk_33m_180deg),     // output clk_out2
    // Status and control signals
    .reset       (~sys_rst_n), // input reset
    .locked      (locked),       // output locked
   // Clock in ports
    .clk_in1     (sys_clk)      // input clk_in1
);



endmodule