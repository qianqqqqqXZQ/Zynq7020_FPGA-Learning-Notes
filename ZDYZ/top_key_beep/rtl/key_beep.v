module key_beep(
    input           sys_clk,
    input           sys_rst_n,
    input           key_filter,
    output   reg    beep
    );

reg     key_filter_d0;    

wire    neg_key_filter;

assign  neg_key_filter = key_filter_d0 & (~key_filter);

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        key_filter_d0 <= 1'b1;
    else
        key_filter_d0 <= key_filter;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        beep <= 1'b1;
    else if(neg_key_filter)
        beep <= ~beep;
    else
        beep <= beep;
end

endmodule