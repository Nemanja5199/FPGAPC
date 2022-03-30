// Code your design here
module ImageGenerator(output reg[9:0]red,green,blue,output [12:0]address,output UBout,LBout,WEout,OEout,CEout,input [9:0] row,columen,input [15:0] data);
  
  wire  [3:0]sel;
  wire[15:0]dT;
  reg X;
  
  
  
  assign UBout=0;
  assign LBout=0;
  assign WEout=1;
  assign OEout=0;
  assign CEout=0;
  
  assign address[12:5]=row[7:0];
  assign  address[4:0]=columen[8:4];
  
  assign sel=columen[3:0];
  
  always @(sel or row or columen)begin
  
  if (row[8]==1'b0 && row[9]==1'b0 && columen[9]==1'b0 )

    begin   
   
      case(sel)
        4'b0000 : X=data[0];
        4'b0001 : X=data[1];
        4'b0010 : X=data[2];
        4'b0011 : X=data[3];
        4'b0100 : X=data[4];
        4'b0101 : X=data[5];
        4'b0110 : X=data[6];
        4'b0111 : X=data[7];
        4'b1000 : X=data[8];
        4'b1001 : X=data[9];
        4'b1010 : X=data[10];
        4'b1011 : X=data[11];
        4'b1100 : X=data[12];
        4'b1101 : X=data[13];
        4'b1110 : X=data[14];
        4'b1111 : X=data[15];
        default: X=0;

      endcase
		if (X==1'b0)
        begin
          
          red=1023;
          green=0;
          blue=0;
          
        end
      
      else if(X==1'b1)
        begin
          red=1023;
          green=1023;
          blue=1023;
          
        end

		
    end
	 
	 else
        begin
          
          red=0;
          green=0;
          blue=0;
        end
  end
    
          
     
    
  
  
endmodule
