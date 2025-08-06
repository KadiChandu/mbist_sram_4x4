module decoder_2x4(input [1:0] in, output [3:0] out);
  wire n0, n1;
  not(n0, in[0]);
  not(n1, in[1]);
  and(out[0], n1, n0);
  and(out[1], n1, in[0]);
  and(out[2], in[1], n0);
  and(out[3], in[1], in[0]);
endmodule
