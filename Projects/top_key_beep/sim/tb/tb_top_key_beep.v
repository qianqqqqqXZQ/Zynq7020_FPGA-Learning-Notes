`timescale   1ns/1ns  //Simulation units and precision

module tb_top_key_beep();

parameter  CLK_PERIOD = 20;
parameter  CNT_MAX = 20'd10;

reg             sys_clk;    //Period:20ns
reg             sys_rst_n;
reg             key;

wire            beep;

initial begin
       sys_clk <= 1'b0;
       sys_rst_n <= 1'b0;
       key <= 1'b1;
       #200
       sys_rst_n <= 1'b1;
       #100
       key <= 1'b0;
       #40
       key <= 1'b1;
       #30
       key <= 1'b0;
       #1000
       key <= 1'b1;
       #50
       key <= 1'b0;
       #30
       key <= 1'b1;
end

always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

top_key_beep #(
    .CNT_MAX  (CNT_MAX)
    )

    u_top_key_beep(
    .sys_clk      (sys_clk  ),
    .sys_rst_n    (sys_rst_n),
    .key          (key      ),
    .beep         (beep     )
    );

endmodule