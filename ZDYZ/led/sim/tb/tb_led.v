`timescale 1ns/1ns    //单位/精度

module tb_led();

reg     key;
wire    led;

initial begin
    key <= 1'b1;
    #200
    key <= 1'b0;
    #500
    key <= 1'b1;
    #1000
    key <= 1'b0;
    #1000
    key <= 1'b1;
end

led u_led(
    .key    (key),
    .led    (led)

);

endmodule