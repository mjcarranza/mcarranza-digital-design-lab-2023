module vgaController #( 
  parameter HACTIVE = 10'd640, 	// horizontal active
  parameter HFP = 10'd16,			// horizontal front porch
  parameter HSYN = 10'd96,			// horizontal sync
  parameter HBP = 10'd48,			// horizontal back porch
  parameter HMAX = HACTIVE + HFP + HSYN + HBP, 		// horizontal max
  parameter VBP = 10'd33,			// vertical back porch
  parameter VACTIVE = 10'd480,	// vertical active
  parameter VFP = 10'd10,			// vertical front porch
  parameter VSYN = 10'd2,			// vertical sync
  parameter VMAX = VACTIVE + VFP + VSYN + VBP 		// vertical max
)(
  input logic vgaclk,			// entrada reloj a 25 MHz
  output logic hsync, vsync, sync_b, blank_b,	// salidas de sicronizacion horizxontal y vertical
  output logic [9:0] x, y 		// posicion en x e y
);
	// contadores para horizontal y vertical posciones
	always @(posedge vgaclk) begin // cada flanco positivo
	 x++;									// sumo x en 1 unidad
	 if (x == HMAX) begin			// cuando x sea igual a la cantidad maxima de pixeles horizontales
		x = 0;							// set x=0
		y++;								// sumo y en 1 unidad
		if (y == VMAX) y = 0;		// cuando y sea igual al valor maximo en vertical setear a cero y pasar a la siguiente fila
	 end
	end

	// Compute sync signals (active low)
	// Asignacion de las senales de sincronizacion vertical y horizontal
	assign hsync = ~(x >= HACTIVE + HFP & x < HACTIVE + HFP + HSYN);
	assign vsync = ~(y >= VACTIVE + VFP & y < VACTIVE + VFP + VSYN);
	assign sync_b = hsync & vsync;
	
	// Force outputs to black when outside the legal display area
	assign blank_b = (x < HACTIVE) & (y < VACTIVE);
endmodule 