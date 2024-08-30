`timescale 1ns / 1ns
`include "shift_rows.v"

module shift_tb;

reg [127:0] data_in;
reg clk;
wire [127:0] data_out;

shift_rows shift(clk, data_in, data_out);

initial begin
    clk = 0;
    forever #10 clk = ~clk; // Once every 1ns?
end

initial begin

    $dumpfile("shift_tb.vcd");
    $dumpvars(0, shift_tb);

    data_in = 128'h637c777bf26b6fc53001672bfed7ab76;
    #20

    $display("Shifted: %h", data_out);
    $display("Test complete");
    $finish;
end

endmodule