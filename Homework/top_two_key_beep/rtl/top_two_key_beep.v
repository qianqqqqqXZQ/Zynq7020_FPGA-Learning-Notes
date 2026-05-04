module top_two_key_beep(
    input       sys_clk,
    input       sys_rst_n,
    input       key1,
    input       key2,
    output      beep
    );
    
parameter CNT_MAX = 20'd1000000;

wire  key_filter_1;
wire  key_filter_2;


key_debounce #(
    .CNT_MAX   (CNT_MAX)
    )
    u_key_debounce_1(
    .sys_clk     (sys_clk    ),
    .sys_rst_n   (sys_rst_n  ),
    .key         (key1       ),
    .key_filter  (key_filter_1)
    );
    
key_debounce #(
    .CNT_MAX   (CNT_MAX)
    )
    u_key_debounce_2(
    .sys_clk     (sys_clk     ),
    .sys_rst_n   (sys_rst_n   ),
    .key         (key2        ),
    .key_filter  (key_filter_2)
    );

two_key_beep u_two_key_beep(
    .sys_clk       (sys_clk     ),
    .sys_rst_n     (sys_rst_n   ),
    .key_filter_1  (key_filter_1),
    .key_filter_2  (key_filter_2),
    .beep          (beep        )
    );
    
endmodule