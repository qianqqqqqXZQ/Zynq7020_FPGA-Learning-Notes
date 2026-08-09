`timescale   1ns/1ns  //Simulation units and precision

module tb_ip_clk_wiz();

parameter  CLK_PERIOD = 20;

reg             sys_clk;    //Period:20ns
reg             sys_rst_n;

wire            clk_33m;
wire            clk_33m_180deg;


initial begin
       sys_clk <= 1'b0;
       sys_rst_n <= 1'b0;
       #200
       sys_rst_n <= 1'b1;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

ip_clk_wiz u_ip_clk_wiz(
    .sys_clk          (sys_clk       ),
    .sys_rst_n        (sys_rst_n     ),
    .clk_33m          (clk_33m       ),
    .clk_33m_180deg   (clk_33m_180deg)
);

endmodule