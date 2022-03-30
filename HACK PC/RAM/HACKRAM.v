module RAM(output[15:0]Q, input[15:0]data,addresM,input writeM,clk1,clk2,rst,output ramW,scrW,kbdW);

wire [15:0] RAMQ,SCRQ1,SCRQ2,KBDQ1,KBDQ2,muxOut1;
supply1 Vcc;
supply0 GND;
supply0[3:0] GND4;
supply1[3:0] VCC4;
supply0[12:0] GND13;
supply0[15:0] GND15;
wire ramM,scrM,kbdM,k;//ramW,scrW,kbdW,

DEMUX1bit D1(ramM,k,Vcc,addresM[14]);
DEMUX1bit D2(scrM,kbdM,k,addresM[13]);

assign ramW=ramM & writeM;
assign scrW= scrM & writeM;
assign kbdW= kbdM & writeM;



RAM16K R1(addresM[13:0],data,clk1,rst,clk2,ramW,RAMQ);
SCR S1(addresM[12:0],GND13,data,GND15,clk1,rst,clk2,scrW,GND,SCRQ1,SCRQ2);
KBD K1(addresM[3:0],VCC4,data,GND15,clk1,rst,clk2,kbdW,GND,KBDQ1,KBDQ2);

Mux16bit M1(muxOut1,SCRQ1,KBDQ1,addresM[13]);
Mux16bit M2(Q,RAMQ,muxOut1,addresM[14]);

endmodule 