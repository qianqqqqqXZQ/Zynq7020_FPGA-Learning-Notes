`timescale   1ns/1ns  //Simulation units and precision

module tb_key_led();

parameter  CLK_PERIOD = 20;

reg             sys_clk;    //Period:20ns
reg             sys_rst_n;
reg    [1:0]    key;

wire   [1:0]    led;

initial begin
       sys_clk <= 1'b0;
       sys_rst_n <= 1'b0;
       key <= 2'b11;
       #200
       sys_rst_n <= 1'b1;
       #2000
       key <= 2'b10;
       #2000
       key <= 2'b11;
       #2000
       key <= 2'b01;
       #2000
       key <= 2'b11;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

key_led u_key_led(
    .sys_clk      (sys_clk  ),
    .sys_rst_n    (sys_rst_n),
    .key          (key      ),
    .led          (led      )
);

endmodule