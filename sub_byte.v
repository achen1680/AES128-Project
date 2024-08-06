module sub_byte(
    input [127:0] data_in,
    output [127:0] data_out
);

sbox group1(.col(data_in[127:120]), .subbed(data_out[127:120]));
sbox group2(.col(data_in[119:112]), .subbed(data_out[119:112]));
sbox group3(.col(data_in[111:104]), .subbed(data_out[111:104]));
sbox group4(.col(data_in[103:96]), .subbed(data_out[103:96]));
sbox group5(.col(data_in[95:88]), .subbed(data_out[95:88]));
sbox group6(.col(data_in[87:80]), .subbed(data_out[87:80]));
sbox group7(.col(data_in[79:72]), .subbed(data_out[79:72]));
sbox group8(.col(data_in[71:64]), .subbed(data_out[71:64]));
sbox group9(.col(data_in[63:56]), .subbed(data_out[63:56]));
sbox group10(.col(data_in[55:48]), .subbed(data_out[55:48]));
sbox group11(.col(data_in[47:40]), .subbed(data_out[47:40]));
sbox group12(.col(data_in[39:32]), .subbed(data_out[39:32]));
sbox group13(.col(data_in[31:24]), .subbed(data_out[31:24]));
sbox group14(.col(data_in[23:16]), .subbed(data_out[23:16]));
sbox group15(.col(data_in[15:8]), .subbed(data_out[15:8]));
sbox group16(.col(data_in[7:0]), .subbed(data_out[7:0]));

endmodule