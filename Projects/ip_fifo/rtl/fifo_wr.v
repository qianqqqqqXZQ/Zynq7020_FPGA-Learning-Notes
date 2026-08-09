module fifo_wr(
    input               wr_clk, // Write clock
    input               rst_n,
    // FIFO interface
    input               empty, // Empty flag from the read clock domain
    input               almost_full, // Almost-full flag
    input               wr_rst_busy, // Write-side reset busy flag
    output  reg         fifo_wr_en, // Write enable
    output  reg  [7:0]  fifo_wr_data // Data written to the FIFO
    );

reg      empty_d0;
reg      empty_d1;

// Synchronize the read-domain empty flag into the write clock domain.
always @(posedge wr_clk or negedge rst_n) begin
    if(!rst_n) begin
        empty_d0 <= 1'd0;
        empty_d1 <= 1'd0;
    end
    else begin
        empty_d0 <= empty;
        empty_d1 <= empty_d0;
    end
end

// Start writing when data is available, and stop near full.
always @(posedge wr_clk or negedge rst_n) begin
    if(!rst_n)
        fifo_wr_en <= 1'b0;
    else if(!wr_rst_busy) begin
        if(empty_d1)
            fifo_wr_en <= 1'b1;
        else if(almost_full)
            fifo_wr_en <= 1'b0;
    end
end

// Generate a repeating 0..254 test pattern.
always @(posedge wr_clk or negedge rst_n) begin
    if(!rst_n)
        fifo_wr_data <= 8'b0;
    else if(fifo_wr_en && fifo_wr_data < 8'd254)
        fifo_wr_data <= fifo_wr_data + 8'b1;
    else
        fifo_wr_data <= 8'b0;
end

endmodule
