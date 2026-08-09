module fifo_rd(
    input             rd_clk,
    input             rst_n,
    // FIFO interface
    input  [7:0]      fifo_rd_data, // Data read from the FIFO
    input             full,         // Full flag from the write clock domain
    input             almost_empty, // Almost-empty flag
    input             rd_rst_busy,  // Read-side reset busy flag
    output reg        fifo_rd_en   // Read enable
    );

reg     full_d0;
reg     full_d1;

// Synchronize the write-domain full flag into the read clock domain.
always @(posedge rd_clk or negedge rst_n) begin
    if(!rst_n) begin
        full_d0 <= 1'd0;
        full_d1 <= 1'd0;
    end
    else begin
        full_d0 <= full;
        full_d1 <= full_d0;
    end
end

// Start reading after the FIFO has been filled, and stop near empty.
always @(posedge rd_clk or negedge rst_n) begin
    if(!rst_n)
        fifo_rd_en <= 1'b0;
    else if(!rd_rst_busy) begin
        if(full_d1)
            fifo_rd_en <= 1'b1;
        else if(almost_empty)
            fifo_rd_en <= 1'b0;
    end
end

endmodule
