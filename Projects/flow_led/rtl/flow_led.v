module  flow_led(
    input              sys_clk, //System clock
    input              sys_rst_n, //System reset, low level is active
    output  reg [1:0]  led
);

reg  [24:0]  cnt;

//The counter measures the time as 5s
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt <= 25'd0;
    else if(cnt<(25'd25000000-25'd1))
        cnt <= cnt + 25'd1;
    else
        cnt <= 25'd0;
end
    
//LED Shift Control
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led <= 2'b01;
    else if(cnt == (25'd250000000 - 25'd1))
        led <= {led[0],led[1]};
    else 
        led = led;
end

endmodule