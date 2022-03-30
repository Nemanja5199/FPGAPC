



module PC(output[15:0] Q , input[15:0] A, input inc,load,reset,clk);
  
  wire[15:0]s1,s2,s3,s4;
  wire cout;
  supply1 v1;
  supply0[15:0] g1;
  
  
  FullAdder16 F1(cout,s1,Q,g1,v1);
  mux2_1_16bit M1(s2,Q,s1,inc);
  mux2_1_16bit M2(s3,s2,A,load);
  mux2_1_16bit M3(s4,s3,g1,reset);
  reg16bit R1 (Q,s4,clk,v1,reset);
  

  
  
  
  
  
  
  
  
endmodule 