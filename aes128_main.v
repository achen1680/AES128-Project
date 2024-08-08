module aes128 (
    input [127:0] data_in,
    input [127:0] key_in,
    output [127:0] data_out
);

wire [127:0] pw_data, key_out1, key_out2, key_out3, key_out4, key_out5, key_out6, key_out7, key_out8, key_out9, key_out10;
wire [127:0] data_out1, data_out2, data_out3, data_out4, data_out5, data_out6, data_out7, data_out8, data_out9, data_out10;

// Pre-whitening
assign pw_data = key_in ^ data_in;

// Key Generation
gen_key key1(.round(4'h0), .key_in(key_in), .key_out(key_out1));
gen_key key2(.round(4'h1), .key_in(key_out1), .key_out(key_out2));
gen_key key3(.round(4'h2), .key_in(key_out2), .key_out(key_out3));
gen_key key4(.round(4'h3), .key_in(key_out3), .key_out(key_out4));
gen_key key5(.round(4'h4), .key_in(key_out4), .key_out(key_out5));
gen_key key6(.round(4'h5), .key_in(key_out5), .key_out(key_out6));
gen_key key7(.round(4'h6), .key_in(key_out6), .key_out(key_out7));
gen_key key8(.round(4'h7), .key_in(key_out7), .key_out(key_out8));
gen_key key9(.round(4'h8), .key_in(key_out8), .key_out(key_out9));
gen_key key10(.round(4'h9), .key_in(key_out9), .key_out(key_out10));

// Round Iterations
round R1(.data_in(pw_data), .key(key_in), .data_out(data_out1));
round R2(.data_in(data_out1), .key(key_out1), .data_out(data_out2));
round R3(.data_in(data_out2), .key(key_out2), .data_out(data_out3));
round R4(.data_in(data_out3), .key(key_out3), .data_out(data_out4));
round R5(.data_in(data_out4), .key(key_out4), .data_out(data_out5));
round R6(.data_in(data_out5), .key(key_out5), .data_out(data_out6));
round R7(.data_in(data_out6), .key(key_out6), .data_out(data_out7));
round R8(.data_in(data_out7), .key(key_out7), .data_out(data_out8));
round R9(.data_in(data_out8), .key(key_out8), .data_out(data_out9));
last_round R10(.data_in(data_out9), .key(key_out9), .data_out(data_out10));

assign data_out = data_out10;

endmodule


