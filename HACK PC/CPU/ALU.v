



module ALU(output[15:0] out,output zr,ng,input[15:0] x,y,input zx,nx,zy,ny,f,no);
  
  wire[15:0] s1,s2,s3,k1,k2,k3,p1,z1,f1,if1;
  wire cout;
  supply0[15:0] g1,g2;
  supply0 g3;
  
  mux2_1_16bit m1(s1,x,g1,zx);
  INV I1(s2,s1);
  mux2_1_16bit m2(s3,s1,s2,nx);
  
  
  mux2_1_16bit m3(k1,y,g2,zy);
  INV I2(k2,k1);
  mux2_1_16bit m4(k3,k1,k2,ny);
  
  
  I_Gate And1(p1,s3,k3);
  FullAdder16 Add1(cout,z1,s3,k3,g3);
  
  mux2_1_16bit m5(f1,p1,z1,f);
  INV I3(if1,f1);
  
  
  mux2_1_16bit m6(out,f1,if1,no);
  
  
 
  
  
  assign ng=out[15];
  
  
  assign zr= ~(|out);
  
  
  
  
endmodule 