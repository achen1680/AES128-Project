module gen_key (
    input clk, // sequential change
    input [3:0] round,
    input [127:0] key_in,
    output reg [127:0] key_out
);

wire [31:0] col1, col2, col3, col4, temp, rotated_col4;
wire [127:0] temp_key; //Added for sequential assignment

assign col4 = key_in[31:0];
assign col3 = key_in[63:32];
assign col2 = key_in[95:64];
assign col1 = key_in[127:96];
assign rotated_col4 = rotate(col4);


// sbox function takes a rotated verison of last column of the previous key and stores it in temp
sbox first(.clk(clk), .col(rotated_col4[31:24]), .subbed(temp[31:24]));
sbox second(.clk(clk), .col(rotated_col4[23:16]), .subbed(temp[23:16]));
sbox third(.clk(clk), .col(rotated_col4[15:8]), .subbed(temp[15:8]));
sbox fourth(.clk(clk), .col(rotated_col4[7:0]), .subbed(temp[7:0]));

//xor with 1st col of previous round key and then xor with rcon
assign temp_key[127:96] = col1 ^ temp ^ rcon(round);
assign temp_key[95:64] = temp_key[127:96] ^ col2;
assign temp_key[63:32] = temp_key[95:64] ^ col3;
assign temp_key[31:0] = temp_key[63:32] ^ col4;

always @(posedge clk) key_out <= temp_key; //sequential change

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



