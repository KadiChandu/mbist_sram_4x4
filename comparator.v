module comparator(input [3:0] expected, actual, output match);
  wire [3:0] xnor_out;
  xnor(xnor_out[0], expected[0], actual[0]);
  xnor(xnor_out[1], expected[1], actual[1]);
  xnor(xnor_out[2], expected[2], actual[2]);
  xnor(xnor_out[3], expected[3], actual[3]);
  and(match, xnor_out[0], xnor_out[1], xnor_out[2], xnor_out[3]);
endmodule
