module ip_1port_ram(
    input       sys_clk,
    input       sys_rst_n
    );
wire  [7:0]       ram_rd_data;
wire              ram_en;
wire              ram_we;
wire  [4:0]       ram_addr;
wire  [7:0]       ram_wr_data;

ram_rw   u_ram_rw(
    .clk            (sys_clk),
    .rst_n          (sys_rst_n),

    .ram_rd_data    (ram_rd_data  ),
    .ram_en         (ram_en        ),
    .ram_we         (ram_we       ),
    .ram_addr       (ram_addr     ),
    .ram_wr_data    (ram_wr_data  )
    );

blk_mem_gen_0 blk_mem_gen_0 (
  .clka     (sys_clk    ),
  .ena      (ram_en     ),
  .wea      (ram_we     ),
  .addra    (ram_addr   ),
  .dina     (ram_wr_data),
  .douta    (ram_rd_data)
);

endmodule