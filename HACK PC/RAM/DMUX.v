module DEMUX1bit(output reg a,b ,input y,select);

always@(select)
if(select)
	begin 
	b=y;
	a=0;
	end

	 
	else
	begin
	a=y;
	b=0;
	end
endmodule 