`timescale   1ns/1ns  //Simulation units and precision

module tb_ip_fifo();

parameter  CLK_PERIOD = 20;

reg             sys_clk;    //Period:20ns
reg             sys_rst_n;


initial begin
       sys_clk <= 1'b0;
       sys_rst_n <= 1'b0;
       #200
       sys_rst_n <= 1'b1;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

ip_fifo u_ip_fifo(
    .sys_clk      (sys_clk  ),
    .sys_rst_n    (sys_rst_n)
);

endmodule