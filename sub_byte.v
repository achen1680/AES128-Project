module sub_byte(
    input clk,
    input [127:0] data_in,
    output [127:0] data_out
);

wire [127:0] subbed;
reg [127:0] data_out;

sbox group1(.col(data_in[127:120]), .subbed(subbed[127:120]));
sbox group2(.col(data_in[119:112]), .subbed(subbed[119:112]));
sbox group3(.col(data_in[111:104]), .subbed(subbed[111:104]));
sbox group4(.col(data_in[103:96]), .subbed(subbed[103:96]));
sbox group5(.col(data_in[95:88]), .subbed(subbed[95:88]));
sbox group6(.col(data_in[87:80]), .subbed(subbed[87:80]));
sbox group7(.col(data_in[79:72]), .subbed(subbed[79:72]));
sbox group8(.col(data_in[71:64]), .subbed(subbed[71:64]));
sbox group9(.col(data_in[63:56]), .subbed(subbed[63:56]));
sbox group10(.col(data_in[55:48]), .subbed(subbed[55:48]));
sbox group11(.col(data_in[47:40]), .subbed(subbed[47:40]));
sbox group12(.col(data_in[39:32]), .subbed(subbed[39:32]));
sbox group13(.col(data_in[31:24]), .subbed(subbed[31:24]));
sbox group14(.col(data_in[23:16]), .subbed(subbed[23:16]));
sbox group15(.col(data_in[15:8]), .subbed(subbed[15:8]));
sbox group16(.col(data_in[7:0]), .subbed(subbed[7:0]));

always @(posedge clk) data_out <= subbed;

endmodule