module mbist_tb;
  reg clk = 0;
  reg rst = 1;
  wire [1:0] addr;
  wire [3:0] data_in;
  wire write_en;
  wire test_done;
  wire [3:0] data_out;
  wire match;
  always #5 clk = ~clk;
  mbist_fsm fsm(clk, rst, addr, data_in, write_en, test_done);
  sram_4x4 mem(data_in, addr, write_en, clk, rst, data_out);
  comparator cmp(data_in, data_out, match);
  initial begin
    #10 rst = 0;
    #200;
    if (test_done)
      $display("MBIST Test Done. Match: %b", match);
    else
      $display("MBIST did not finish.");
    $finish;
  end
endmodule
