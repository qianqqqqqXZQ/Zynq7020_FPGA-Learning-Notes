module ip_fifo(
    input       sys_clk,
    input       sys_rst_n
    );

wire    clk_50m;
wire    clk_100m;
wire    locked;

wire    rst_n;

(*mark_debug = "true"*)wire          empty       ;
(*mark_debug = "true"*)wire          almost_full ;
(*mark_debug = "true"*)wire          wr_rst_busy ;
(*mark_debug = "true"*)wire          fifo_wr_en  ;
(*mark_debug = "true"*)wire  [7:0]   fifo_wr_data;

(*mark_debug = "true"*)wire  [7:0]   fifo_rd_data;
(*mark_debug = "true"*)wire          full        ;
(*mark_debug = "true"*)wire          almost_empty;
(*mark_debug = "true"*)wire          rd_rst_busy ;
(*mark_debug = "true"*)wire          fifo_rd_en  ;

(*mark_debug = "true"*)wire  [7:0]   rd_data_count;
(*mark_debug = "true"*)wire  [7:0]   wr_data_count;

assign  rst_n = sys_rst_n & locked;


clk_wiz_0 u_clk_wiz_0
(

    .clk_out1 (clk_50m),
    .clk_out2 (clk_100m),
    .locked   (locked),
    .clk_in1  (sys_clk)
);

fifo_wr u_fifo_wr(
   .wr_clk        (clk_50m     ),
   .rst_n         (rst_n       ),

   .empty         (empty       ),
   .almost_full   (almost_full ),
   .wr_rst_busy   (wr_rst_busy ),
   .fifo_wr_en    (fifo_wr_en  ),
   .fifo_wr_data  (fifo_wr_data)
);

fifo_rd u_fifo_rd(
    .rd_clk       (clk_100m     ),
    .rst_n        (rst_n        ),

    .fifo_rd_data (fifo_rd_data ),
    .full         (full         ),
    .almost_empty (almost_empty ),
    .rd_rst_busy  (rd_rst_busy  ),
    .fifo_rd_en   (fifo_rd_en   )
);

fifo_generator_0 u_fifo_generator_0 (
  .rst            (~rst_n),      // Active-high FIFO reset
  .wr_clk         (clk_50m),
  .rd_clk         (clk_100m),
  .din            (fifo_wr_data),
  .wr_en          (fifo_wr_en),
  .rd_en          (fifo_rd_en),
  .dout           (fifo_rd_data),
  .full           (full),
  .almost_full    (almost_full),
  .empty          (empty),
  .almost_empty   (almost_empty),
  .rd_data_count  (rd_data_count),
  .wr_data_count  (wr_data_count),
  .wr_rst_busy    (wr_rst_busy),
  .rd_rst_busy    (rd_rst_busy)
);

endmodule
