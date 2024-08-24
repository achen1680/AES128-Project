module round (
    input clk,
    input [127:0] data_in,
    input [127:0] key,
    output reg [127:0] data_out
);

wire [127:0] sub_data, shift_data, mix_data;

sub_byte sub(.data_in(data_in), .data_out(sub_data));
shift_rows shift(.data_in(sub_data), .data_out(shift_data));
mix_columns mix(.data_in(shift_data), .data_out(mix_data));

// Add round key
always @(posedge clk) data_out = mix_data ^ key;

endmodule