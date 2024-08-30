`timescale 1ns / 1ns
`include "gen_key.v"
`include "sbox.v"

module gen_key_tb;

reg [3:0] round;
reg [127:0] key_in;
reg clk;
wire [127:0] key_out;

gen_key test(clk, round, key_in, key_out);

//Clock Generation?

initial begin
    clk = 0;
    forever #10 clk = ~clk; // Once every 1ns?
end

initial begin
    
    $dumpfile("gen_key_tb.vcd");
    $dumpvars(0, gen_key_tb);

    /* Keys
    Init - 2b7e151628aed2a6abf7158809cf4f3c
    R0 - a0fafe1788542cb123a339392a6c7605
    R1 - f2c295f27a96b9435935807a7359f67f
    R2 - 3d80477d4716fe3e1e237e446d7a883b
    R3 - ef44a541a8525b7fb671253bdb0bad00
    R4 - d4d1c6f87c839d87caf2b8bc11f915bc
    R5 - 6d88a37a110b3efddbf98641ca0093fd
    R6 - 4e54f70e5f5fc9f384a64fb24ea6dc4f
    R7 - ead27321b58dbad2312bf5607f8d292f
    R8 - ac7766f319fadc2128d12941575c006e
    R9 - d014f9a8c9ee2589e13f0cc8b6630ca6
    */

    key_in = 128'ha0fafe1788542cb123a339392a6c7605;
    #20

    round = 4'h1;
    #20

    $display("Round: %d, Key Out: %h", round, key_out);
    $display("Test complete");
    $finish;
end

endmodule

// Icarus Verilog Sim Terminal Commands:
// iverilog -o gen_key_tb.vvp gen_key_tb.v
// vvp gen_key_tb.vvp