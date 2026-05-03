`timescale   1ns/1ns  //Simulation units and precision

module tb_flow_led();

parameter  CLK_PERIOD = 20;

reg             sys_clk;    //Period:20ns
reg             sys_rst_n;
reg             touch_key;

wire            led;

initial begin
       sys_clk <= 1'b0;
       sys_rst_n <= 1'b0;
       touch_key <= 1'b0;
       #200
       sys_rst_n <= 1'b1;
       #1000
       touch_key <= 1'b1;
       #2000
       touch_key <= 1'b0;
       #1000
       touch_key <= 1'b1;
       #2000
       touch_key <= 1'b0;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

touch_led u_touch_led(
    .sys_clk      (sys_clk  ),
    .sys_rst_n    (sys_rst_n),
    .touch_key    (touch_key),
    .led          (led      )
);

endmodule