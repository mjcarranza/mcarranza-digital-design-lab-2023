module vga (
   input logic clk, rst,
   output logic vgaclk, // 25.175 MHz VGA clock
   output logic hsync, vsync,
   output logic sync_b, blank_b, // To monitor & DAC
   output logic [7:0] r, g, b // To video DAC
);

   logic [9:0] x, y;
   logic [13:0] addr;
   logic [31:0] q;

   localparam X_BEGIN = 50;
   localparam Y_BEGIN = 50;
   localparam X_FINAL = 150;
   localparam Y_FINAL = 150;
	
	localparam X_1 = 170;
   localparam Y_1 = 50;
   localparam X_2 = 270;
   localparam Y_2 = 150;

   logic [31:0] r_temp;
   logic [31:0] g_temp;
   logic [31:0] b_temp;

   // Instancia del reloj a 25 MHz
   clockVGA vga_clk_inst (.clk(clk), .vga_clk(vgaclk));

   // Instancia de contador
   Contador counter_inst(vgaclk, rst, addr);

   // Instancia de memoria RAM
   ram1 ram1_inst(addr, vgaclk, 8'd0, 1'b0, q);

   // Generate monitor timing signals
   vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);

   always_comb begin
      if (x >= X_BEGIN && x < X_FINAL && y >= Y_BEGIN && y < Y_FINAL) begin
         // Obtener valores de la RAM y asignar a los canales de color
         r_temp = q;
         g_temp = q;
         b_temp = q;
      end 
		else if (x >= X_1 && x < X_2 && y >= Y_1 && y < Y_2) begin
         // Obtener valores de la RAM y asignar a los canales de color
         r_temp = q;
         g_temp = q;
         b_temp = q;
      end 
		else begin
         // Asignar blanco cuando no estamos en la región de visualización
         r_temp = 255;
         g_temp = 255;
         b_temp = 255;
      end 
   end

   // Asignar solo los bits más bajos a las salidas de color
   assign r = r_temp[7:0];
   assign g = g_temp[7:0];
   assign b = b_temp[7:0];

endmodule
