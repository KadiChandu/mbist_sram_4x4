module dff(input d, clk, rst, output q);
  wire rn;
  not(rn, rst);
  wire d1;
  and(d1, d, rst);
  wire qn;
  nor(qn, clk, rn);
  nor(q, qn, d1);
endmodule
