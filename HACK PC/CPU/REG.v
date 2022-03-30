module reg16bit(output reg[15:0] q , input[15:0] d, input clk,load,rst );
  
  
  always@(posedge(clk)) begin
    
    if(rst)
       q<=16'b000000000000000;
    else if(load)
         q<=d;
      
      else
        q<=q;
    end
      
    

  
  
  
  
endmodule 