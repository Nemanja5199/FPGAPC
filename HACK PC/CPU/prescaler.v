module prescaler(
	input Clock,
	output reg Count
    );
reg [32:0] internal_count;
initial Count=0;
initial internal_count=0;

always @(posedge Clock) begin
	internal_count <=  internal_count+1'b1;
	if(internal_count >= 100000000)//100 miliona
	begin
		internal_count <= 0;
		Count <= ~Count;
	end
end

endmodule 