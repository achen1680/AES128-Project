module last_round(
    input [127:0] data_in,
    input [127:0] key,
    output [127:0] data_out
);

wire [127:0] sub_data, shift_data;

sub_byte sub(.data_in(data_in), .data_out(sub_data));
shift_rows shift(.data_in(sub_data), .data_out(shift_data));

// Add round key
assign data_out = shift_data ^ key;

endmodule;