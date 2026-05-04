module touch_flow_led(
    input                   sys_clk,
    input                   sys_rst_n,
    input                   touch_key,
    
    output   reg   [1:0]    led     
);

parameter  MAX_CNT = 25000000;

reg                     touch_key_d0;
reg                     touch_key_d1;
reg       [24:0]        cnt;

reg                     touch_flag;

wire                    pos_touch_key;
assign  pos_touch_key = ~touch_key_d1 & touch_key_d0;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt <= 25'd0;
    else if(touch_flag == 1'b1) begin
    if (cnt < (MAX_CNT - 25'd1))
        cnt <= cnt + 25'd1;
    else
        cnt <= 25'd0;
    end
    else ;
end

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
        touch_flag <= 1'b0;
    else if(pos_touch_key)
        touch_flag <= ~touch_flag;
    else ;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led <= 2'b01;
    else if(cnt == (MAX_CNT - 1))
        led <= {led[0],led[1]};
    else
        led <= led;
end

endmodule