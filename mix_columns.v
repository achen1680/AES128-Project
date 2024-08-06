module mix_columns (
    input [127:0] data_in,
    output [127:0] data_out
);

assign data_out[127:96] = mixer(data_in[127:96]);
assign data_out[95:64] = mixer(data_in[95:64]);
assign data_out[63:32] = mixer(data_in[63:32]);
assign data_out[31:0] = mixer(data_in[31:0]);

function [7:0] xTwo;
    input [7:0] data;
    xTwo = (data << 1) ^ (data[7] == 1 ? 8'h1b : 8'h00);
endfunction;

function [7:0] xThree;
    input [7:0] data;
    xThree = xTwo(data) ^ data;
endfunction;

function [31:0] mixer;
    input [31:0] col;
    // row 0
    mixer[31:24] = xTwo(col[31:24]) ^ xThree(col[23:16]) ^ col[15:8] ^ col[7:0];

    //row 1
    mixer[23:16] = col[31:24] ^ xTwo(col[23:16]) ^ xThree(col[15:8]) ^ col[7:0];

    //row 2
    mixer[15:8] = col[31:24] ^ col[23:16] ^ xTwo(col[15:8]) ^ xThree(col[7:0]);

    //row 3
    mixer[7:0] = xThree(col[31:24]) ^ col[23:16] ^ col[15:8] ^ xTwo(col[7:0]);
endfunction;

endmodule