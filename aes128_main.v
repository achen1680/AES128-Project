module aes128 (
    input data_in [127:0],
    input key_zero [127:0],
    input clk,
    input reset,
    output data_out [127:0]
);

