module sram_cell(input data_in, write_en, clk, rst, output data_out);
  wire d;
  and (d, data_in, write_en);
  dff d1(d, clk, rst, data_out);
endmodule
