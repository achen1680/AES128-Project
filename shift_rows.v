module shift_rows(
    input clk,
    input [127:0] data_in,
    output [127:0] data_out
);
// WORK IN PROGRESS

// 4x4 state matrix is stored in order by column, top to down
// Transformation done in shift_rows:
// - first row (no change)
// - second row (left circular shift by 1)
// - third row (left circular shift by 2)
// - fourth row (left circular shift by 3)
reg [127:0] temp;

always @(posedge clk) begin
// first col
    temp[127:120] <= data_in[127:120];
    temp[119:112] <= data_in[87:80];
    temp[111:104] <= data_in[47:40];
    temp[103:96] <= data_in[7:0];

// second col
    temp[95:88] <= data_in[95:88];
    temp[87:80] <= data_in[55:48];
    temp[79:72] <= data_in[15:8];
    temp[71:64] <= data_in[103:96];

// third col
    temp[63:56] <= data_in[63:56];
    temp[55:48] <= data_in[23:16];
    temp[47:40] <= data_in[111:104];
    temp[39:32] <= data_in[71:64];

// fourth col
    temp[31:24] <= data_in[31:24];
    temp[23:16] <= data_in[119:112];
    temp[15:8] <= data_in[79:72];
    temp[7:0] <= data_in[39:32];
end

assign data_out = temp;

endmodule