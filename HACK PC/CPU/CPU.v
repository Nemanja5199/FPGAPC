module CPU(output[15:0] outM,output[15:0] addresM,pc,output writeM,input[15:0] inst , inM,input reset ,clk);
  
  
  wire instA,instC, a,zx,nx,zy,ny,f,no,dstA,dstD,jlt,jeg,jgt,ng,zr,jump;
  
  wire load,loadA;
  
  wire[15:0] outM1,outMUX1,outMUX2,outAlU,OutD;
  
  supply1 V;
  
  assign instA = ~inst[15];
  
  assign instC = inst[15] & inst[14] & inst[13];
  
  assign a= instC & inst[12];
  
  assign zx= instC & inst[11];
  
  assign nx= instC & inst[10];
  
  assign zy= instC & inst[9];
  
  assign ny= instC & inst[8];
  
  assign f= instC & inst[7];
  
  assign no= instC & inst[6];
  
  assign dstA= instC & inst[5];
  
  assign dstD= instC & inst[4];
  
  assign writeM= instC & inst[3];
  
  assign jlt= instC & inst[2] & ng;
  
  assign jeg= instC & inst[1] & zr;
  
  assign jgt= instC & inst[0] & ~ng & ~zr;
  
  assign jump= jlt | jeg | jgt ;
  
  assign loadA=  instA | dstA;
  
  
  
  mux2_1_16bit M1(outMUX1,outM,inst,instA);
  reg16bit regA(addresM,outMUX1,clk,loadA,reset);
  mux2_1_16bit M2(outMUX2,addresM,inM,a);
  ALU A1(outM,zr,ng,OutD,outMUX2,zx,nx,zy,ny,f,no);
  reg16bit regD(OutD,outM,clk,dstD,reset);
  PC P1(pc,addresM,V,jump,reset,clk);
  

  
  
  
  
endmodule 