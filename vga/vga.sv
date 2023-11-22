// modulo controlador de todos los modulos.
module vga(input logic clk, rst,
			output logic vgaclk, // 25.175 MHz VGA clock
			output logic hsync, vsync,
			output logic sync_b, blank_b, // To monitor & DAC
			output logic [7:0] r, g, b); // To video DAC

	logic [9:0] x, y;
	logic [13:0] addr;
	logic [7:0]  data;
	logic [31:0] q;
	logic [15:0]  address_temp;
	
	localparam	X_BEGIN = 100; //c0
	localparam	Y_BEGIN = 100; // 70
	localparam	X_FINAL = 200; // 1c1
	localparam	Y_FINAL = 200; //171
	localparam	X_BOXSIZE = 100;
	localparam	Y_BOXSIZE = 100;
	
	logic [7:0] r_temp;
   logic [7:0] g_temp;
   logic [7:0] b_temp;
	
	//instancia del reloj a 25 MHz
	clockVGA vga_clk_inst (.clk(clk), .vga_clk(vgaclk));
		
	// instancia de contador
	Contador counter_inst(vgaclk, rst, addr);

	ram1 ram1_inst(addr,vgaclk,data,1'b0,q);

	// Generate monitor timing signals
	vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	// User-defined module to determine pixel color
	//videogen videoGen(x, y, r, g, b);
	
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