module paint_image(input logic clk, reset,
   output logic [7:0] r,
   output logic [7:0] g,
   output logic [7:0] b,
	output logic [15:0] address,
	output logic hsync, vsync, nsync, nblanc, clk_out,
	output logic [9:0] x, y
	);

	localparam	X_BEGIN = 192; //c0
	localparam	Y_BEGIN = 112; // 70
	localparam	X_FINAL = 449; // 1c1
	localparam	Y_FINAL = 369; //171
	localparam	X_BOXSIZE = 192;
	localparam	Y_BOXSIZE = 112;
	logic [7:0] q;
	logic [15:0]  address_temp;
	logic [7:0]  data;
	logic [7:0] r_temp;
   logic [7:0] g_temp;
   logic [7:0] b_temp;

	vga_sync vga_sync_inst(clk, reset, hsync, vsync, nsync, nblanc, clk_out, x, y);
	
	
	ram4 ram_inst(address,clk,data,1'b0,q);

   always @(*) begin
       if (x > X_BEGIN && x < X_FINAL  && y > Y_BEGIN && y < Y_FINAL)
		 begin
			address_temp = (x - X_BOXSIZE) + 255*(y - Y_BOXSIZE);
			r_temp = q;
			g_temp = q;
			b_temp = q;
		 end
		 else
		 begin
			address_temp = 0;
			r_temp = 255;
			g_temp = 255;
			b_temp = 255;
		 end 
   end
	
	assign address = address_temp;	
	assign r = r_temp;
	assign g = g_temp;
	assign b = b_temp;
    
endmodule