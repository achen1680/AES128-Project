module gen_key (
    input clk,
    input [3:0],
    input [127:0] key_in,
    output [127:0] key_out,
);

wire [31:0] col1, col2, col3, col4;

assign col1 = key_in[31:0];
assign col2 = key_in[63:32];
assign col3 = key_in[75:64];
assign col4 = key_in[127:76];

function [31:0] rotate;
    input [31:0] col;
    rotate = {in[7:0], in[31:8]};
endfunction;

function [31:0] rcon;
    input [3:0] round;
    case (round)
        4'h0: RCON = 32'h01_00_00_00;
        4'h1: RCON = 32'h02_00_00_00;
        4'h2: RCON = 32'h04_00_00_00;
        4'h3: RCON = 32'h08_00_00_00;
        4'h4: RCON = 32'h10_00_00_00;
        4'h5: RCON = 32'h20_00_00_00;
        4'h6: RCON = 32'h40_00_00_00;
        4'h7: RCON = 32'h80_00_00_00;
        4'h8: RCON = 32'h1b_00_00_00;
        4'h9: RCON = 32'h36_00_00_00;
            default: RCON = 32'h00_00_00_00;
    endcase
endfunction;


endmodule



