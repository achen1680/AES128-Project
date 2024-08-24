`timescale 1ns / 1ns
`include "gen_key.v"
`include "sbox.v"
`include "shift_rows.v"
`include "sub_byte.v"
`include "mix_columns.v"
`include "round.v"
`include "last_round.v"
`include "aes128_main.v"

module main_tb;

reg [127:0] data_in;
reg [127:0] key_in;
wire [127:0] data_out;

aes128 test(data_in, key_in, data_out);

initial begin

    $dumpfile("main_tb.vcd");
    $dumpvars(0, main_tb);

    data_in = 128'h746865626C6F636B627265616B657273;
    key_in = 128'h2b7e151628aed2a6abf7158809cf4f3c;

    $display("CipherText: %h", data_out);
    $display("Test complete");
    $finish;
end

endmodule
