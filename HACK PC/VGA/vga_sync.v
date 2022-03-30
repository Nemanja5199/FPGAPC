// Code your design here
//`include "vga_pll.v"
module VGA_SYNC(input pixel_clock_int, output reg horiz_sync_out, vert_sync_out, output video_on, pixel_clock, output reg [9:0] pixel_row, pixel_column);

	
  reg horiz_sync, vert_sync;
	wire  video_on_int;
	reg video_on_v, video_on_h;
	reg [9:0] h_count, v_count;
	
	parameter H_pixels_across = 640;
	parameter H_sync_low 	= 664;
	parameter H_sync_high = 760;
	parameter H_end_count = 800;
	
	parameter V_pixels_down= 480;
	parameter V_sync_low= 491;
	parameter V_sync_high= 493;
	parameter V_end_count= 525;
	
	and (video_on_int,video_on_h,video_on_v);
	assign pixel_clock=pixel_clock_int;
	assign video_on=video_on_int;
  
  initial 
    begin
      h_count<= 10'b0000000000;
      v_count<= 10'b0000000000;
      pixel_row<= 10'b0000000000;
      pixel_column<= 10'b0000000000;
    end
  
	
	always @ (posedge(pixel_clock_int))
	begin
	
      if (h_count == H_end_count) 
   		h_count <= 10'b0000000000;
	else
   		h_count <= h_count + 1;	
	

	if ((h_count <= H_sync_high) && (h_count >= H_sync_low))
 	  	horiz_sync <= 1'b0;
	else
 	  	horiz_sync <= 1'b1;

	if ((v_count >= V_end_count) && (h_count >= H_sync_low))
   		v_count <= 10'b0000000000;
      else  if  (h_count == H_sync_low) 
   		v_count <= v_count + 1;
	
	if ( (v_count <= V_sync_high) && (v_count >= V_sync_low))
   		vert_sync <= 1'b0;
	else
  		vert_sync <= 1'b1;
	
	if (h_count < H_pixels_across) 
	begin
   		video_on_h <= 1'b1;
   		pixel_column <= h_count;
	end
	else
	   	video_on_h <= 1'b0;

	if  (v_count <= V_pixels_down) 
	begin
   		video_on_v <= 1'b1;
   		pixel_row <= v_count;
	end
	else
   		video_on_v <= 1'b0;
	
   horiz_sync_out <= horiz_sync;
   vert_sync_out <= vert_sync;
	
	
	end

  	
endmodule



