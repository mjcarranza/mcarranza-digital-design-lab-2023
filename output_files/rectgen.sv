
// con este modulo genero un rectangulo de dimensiones width x height

module rectgen #(parameter WIDTH = 76, HEIGHT = 56) (
	input logic [9:0] x, y, // paso las posiciones de x e y en la pantalla
	output logic [WIDTH-1:0] out, // La salida es un vector de longitud WIDTH-1
	output logic [7:0] color	// salida del color asociado al vector generado
	);
						//				left		top		right		bot
	// rectgen rectgen(x, y, 10'd120, 10'd150, 10'd200, 10'd230, inrect);	
	//assign inrect = (x >= left & x < right & y >= top & y < bot);
	
	// 
	always_comb begin
		 if (x < WIDTH && y < HEIGHT) begin
			  out = 1'b1;
			  color = 8'hFF; // Gris (128 en decimal)
		 end
		 else begin
			  out = 1'b0;
			  color = 8'h00; // Sin color (negro)
		 end
	end

endmodule 