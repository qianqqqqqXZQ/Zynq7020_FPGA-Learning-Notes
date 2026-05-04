module two_key_beep(
    input          sys_clk,
    input          sys_rst_n,
    input          key_filter_1,
    input          key_filter_2,
    output   reg   beep
    );
    
reg      key_filter_1_d0;
reg      key_filter_2_d0;

wire     neg_key_filter_1;
wire     neg_key_filter_2;
wire     neg_key_filter_flag;

assign   neg_key_filter_1 = key_filter_1_d0 & (~key_filter_1);
assign   neg_key_filter_2 = key_filter_2_d0 & (~key_filter_2);
assign   neg_key_filter_flag = neg_key_filter_1 | neg_key_filter_2;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        key_filter_1_d0 <= 1'b1;
    else
        key_filter_1_d0 <= key_filter_1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        key_filter_2_d0 <= 1'b1;
    else
        key_filter_2_d0 <= key_filter_2;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        beep <= 1'b1;
    else if(neg_key_filter_flag)
        beep <= ~beep;
    else
        beep <= beep;
end

endmodule