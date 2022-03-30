
module Mux16bit(output reg [15:0] Y, input [15:0]A,B,input sel);
  
  
  
  always@(sel)
    if(sel==1'b0)
     Y=A;
        
      
  else 
  Y=B;
  
  
  
endmodule 