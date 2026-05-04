`timescale   1ns/1ns  //Simulation units and precision

module tb_breath_led();

parameter  CLK_PERIOD = 20;

parameter CNT_2US_MAX = 7'd1;   
parameter CNT_2MS_MAX = 10'd10;  
parameter CNT_2S_MAX  = 10'd10;

reg             sys_clk;    //Period:20ns
reg             sys_rst_n;

wire            led;

initial begin
       sys_clk <= 1'b0;
       sys_rst_n <= 1'b0;
       #200
       sys_rst_n <= 1'b1;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

breath_led #(
    .CNT_2US_MAX       (CNT_2US_MAX),
    .CNT_2MS_MAX       (CNT_2MS_MAX),
    .CNT_2S_MAX        (CNT_2S_MAX )
    )
    u_breath_led(
    .sys_clk      (sys_clk  ),
    .sys_rst_n    (sys_rst_n),
    .led          (led      )
    );

endmodule