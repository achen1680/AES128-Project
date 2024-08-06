module gen_key (
    input [3:0] round,
    input [127:0] key_in,
    output [127:0] key_out
);

wire [31:0] col1, col2, col3, col4, temp;

assign col4 = key_in[31:0];
assign col3 = key_in[63:32];
assign col2 = key_in[95:64];
assign col1 = key_in[127:96];

// sbox function takes a rotated verison of last column of the previous key and stores it in temp
sbox first(.col(rotate(col4)[31:24]), .subbed(temp[31:24]));
sbox second(.col(rotate(col4)[23:16]), .subbed(temp[23:16]));
sbox third(.col(rotate(col4)[15:8]), .subbed(temp[15:8]));
sbox fourth(.col(rotate(col4)[7:0]), .subbed(temp[7:0]));

//xor with 1st col of previous round key and then xor with rcon
assign key_out[127:96] = col1 ^ temp ^ rcon(round);
assign key_out[95:64] = key_out[127:96] ^ col2;
assign key_out[63:32] = key_out[95:64] ^ col3;
assign key_out[31:0] = key_out[63:32] ^ col4;

function [31:0] rotate;
    input [31:0] col;
    rotate = {col[23:0], col[31:24]};
endfunction;

function [31:0] rcon;
    input [3:0] round;
    case (round)
        4'h0: rcon = 32'h01_00_00_00;
        4'h1: rcon = 32'h02_00_00_00;
        4'h2: rcon = 32'h04_00_00_00;
        4'h3: rcon = 32'h08_00_00_00;
        4'h4: rcon = 32'h10_00_00_00;
        4'h5: rcon = 32'h20_00_00_00;
        4'h6: rcon = 32'h40_00_00_00;
        4'h7: rcon = 32'h80_00_00_00;
        4'h8: rcon = 32'h1b_00_00_00;
        4'h9: rcon = 32'h36_00_00_00;
            default: rcon = 32'h00_00_00_00;
    endcase
endfunction;

endmodule



