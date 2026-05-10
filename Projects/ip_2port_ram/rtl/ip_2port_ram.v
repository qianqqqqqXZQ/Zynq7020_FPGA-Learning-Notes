module ip_2port_ram(
    input                  sys_clk,
    input                  sys_rst_n
    );

(*mark_debug = "true"*) wire            ram_wr_en   ;
(*mark_debug = "true"*) wire            ram_wr_we   ;
(*mark_debug = "true"*) wire    [5:0]   ram_wr_addr ;
(*mark_debug = "true"*) wire    [7:0]   ram_wr_data ;
(*mark_debug = "true"*) wire            rd_flag     ;
(*mark_debug = "true"*) wire    [7:0]   ram_rd_data ;
(*mark_debug = "true"*) wire            ram_rd_en   ;
(*mark_debug = "true"*) wire    [5:0]   ram_rd_addr ;

ram_wr u_ram_wr(
    .clk            (sys_clk    ),
    .rst_n          (sys_rst_n  ),

    .ram_wr_en      (ram_wr_en  ),
    .ram_wr_we      (ram_wr_we  ),
    .ram_wr_addr    (ram_wr_addr),
    .ram_wr_data    (ram_wr_data),
    .rd_flag        (rd_flag    )
);

blk_mem_gen_0  u_blk_mem_gen_0 (
  .clka     (sys_clk),
  .ena      (ram_wr_en),
  .wea      (ram_wr_we),
  .addra    (ram_wr_addr),
  .dina     (ram_wr_data),
  .clkb     (sys_clk),
  .enb      (ram_rd_en),
  .addrb    (ram_rd_addr),
  .doutb    (ram_rd_data)
);

ram_rd u_ram_rd(
  .clk          (sys_clk     ),
  .rst_n        (sys_rst_n   ),

  .rd_flag      (rd_flag     ),

  .ram_rd_data  (ram_rd_data ),
  .ram_rd_en    (ram_rd_en   ),
  .ram_rd_addr  (ram_rd_addr )
);
endmodule
