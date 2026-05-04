module touch_led(
    input        sys_clk,
    input        sys_rst_n,
    input        touch_key,
    output  reg  led
);

reg    touch_key_d0;
reg    touch_key_d1;

wire   pos_touch_key;

assign pos_touch_key = ~touch_key_d1 & touch_key_d0;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        touch_key_d0 <= 1'b0;
        touch_key_d1 <= 1'b1;
    end
    else begin
        touch_key_d0 <= touch_key;
        touch_key_d1 <= touch_key_d0;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led <= 1'b1;
    else if(pos_touch_key)
        led <= ~led;
    else
        led <= led;
end

endmodule