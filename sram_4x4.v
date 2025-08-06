module sram_4x4(
  input [3:0] data_in,
  input [1:0] addr,
  input write_en,
  input clk,
  input rst,
  output [3:0] data_out );
  wire [3:0] mem_out[3:0];
  wire [3:0] row_sel;
  decoder_2x4 dec(addr, row_sel);
  genvar i, j;
  generate
    for (i = 0; i < 4; i = i + 1) begin: row
      for (j = 0; j < 4; j = j + 1) begin: col
        sram_cell sc (
          .data_in(data_in[j]),
          .write_en(write_en & row_sel[i]),
          .clk(clk),
          .rst(rst),
          .data_out(mem_out[i][j]) );
      end
    end
  endgenerate
  assign data_out = mem_out[addr];
endmodule
