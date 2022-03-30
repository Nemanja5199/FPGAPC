module mux2_1_16bit(output reg [15:0] Y, input[15:0]A,B,input sel);
  
  
  
  always@(sel)
    if(sel==1'b0)
     Y=A;
        
      
  else if (sel==1'b1)
     Y=B;
  
  
  
endmodule 