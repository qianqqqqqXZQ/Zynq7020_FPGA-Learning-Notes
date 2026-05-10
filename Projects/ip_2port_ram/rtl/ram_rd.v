module ram_rd(
    input                  clk,
    input                  rst_n,

    input                  rd_flag,
    //RAM????(B)
    input         [7:0]    ram_rd_data,
    output                 ram_rd_en,
    output  reg   [5:0]    ram_rd_addr
    );

assign ram_rd_en = rd_flag;

//RAM???B??????????:0-63
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        ram_rd_addr <= 6'b0;
    else if(ram_rd_en && ram_rd_addr < 6'd63)
        ram_rd_addr <= ram_rd_addr + 6'b1;
    else
        ram_rd_addr <= 6'b0;
end

endmodule
