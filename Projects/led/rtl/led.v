module led(
    input     key, //输入按键，默认为高电平
    output    led  //输出LED，高电平
    );

assign led = ~key;

endmodule
