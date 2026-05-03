module syn_flow_led(
    input                 sys_clk,
    input                 sys_rst_n,
    output   reg [1:0]    led
);

reg  [24:0] cnt;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt <= 25'd0;
    else if(cnt < (25'd25000000 - 25'd1))
        cnt <= cnt + 25'd1;
    else
        cnt <= 25'd0;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led <= 2'b00;
    else if(cnt == (25'd25000000 - 25'd1))
        led <= ~led;
    else
        led <= led;
end

endmodule