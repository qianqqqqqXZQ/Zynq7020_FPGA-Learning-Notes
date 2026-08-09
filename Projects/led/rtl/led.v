module led(
    input     key, // Input key; active-high by default
    output    led  // LED output; active-high
    );

assign led = ~key;

endmodule
