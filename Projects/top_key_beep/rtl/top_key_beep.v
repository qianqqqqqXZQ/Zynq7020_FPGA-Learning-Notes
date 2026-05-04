module top_key_beep(
    input        sys_clk,
    input        sys_rst_n,
    input        key,
    output       beep
    );
    
parameter CNT_MAX = 20'd1000000;

wire  key_filter;

key_debounce #(
    .CNT_MAX   (CNT_MAX)
    )
    u_key_debounce(
    .sys_clk     (sys_clk   ),
    .sys_rst_n   (sys_rst_n ),
    .key         (key       ),
    .key_filter  (key_filter)
    );
        
key_beep u_key_beep(
    .sys_clk     (sys_clk   ),
    .sys_rst_n   (sys_rst_n ),
    .key_filter  (key_filter),
    .beep        (beep      )
    );
    
endmodule