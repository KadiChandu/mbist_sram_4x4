module mbist_fsm(
  input clk,
  input rst,
  output reg [1:0] addr,
  output reg [3:0] data_in,
  output reg write_en,
  output reg test_done );
  reg [2:0] state;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= 0;
      addr <= 0;
      data_in <= 4'b0000;
      write_en <= 1;
      test_done <= 0;
    end
    else begin
      case(state)
        0: begin addr <= 0; data_in <= 4'b0000; write_en <= 1; state <= 1; end
        1: begin addr <= 1; state <= 2; end
        2: begin addr <= 2; state <= 3; end
        3: begin addr <= 3; state <= 4; end
        // Read 0, write 1
        4: begin data_in <= 4'b1111; write_en <= 1; state <= 5; end
        5: begin addr <= 3; state <= 6; end
        6: begin addr <= 2; state <= 7; end
        7: begin addr <= 1; state <= 8; end
        8: begin addr <= 0; state <= 9; end
        // Read 1, write 0
        9: begin data_in <= 4'b0000; write_en <= 1; state <= 10; end
        10: begin addr <= 0; state <= 11; end
        11: begin addr <= 1; state <= 12; end
        12: begin addr <= 2; state <= 13; end
        13: begin addr <= 3; state <= 14; end
        14: begin write_en <= 0; test_done <= 1; state <= 14; end
      endcase
    end
  end
endmodule
