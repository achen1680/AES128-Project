`timescale 1ns / 1ns
`include "sub_byte.v"
`include "sbox.v"

module sub_tb;

reg [127:0] data_in;
wire [127:0] data_out;

sub_byte sub(data_in, data_out);

initial begin

    $dumpfile("sub_tb.vcd");
    $dumpvars(0, sub_tb);

    data_in = 128'h000102030405060708090a0b0c0d0e0f;
    #20

    $display("Subbed: %h", data_out);
    $display("Test complete");
    $finish;
end

endmodule
