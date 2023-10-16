module videoGen(
  input logic [9:0] x, y,
  output logic [7:0] r, g, b
);
	//logic pixel, inrect;
	// Declarar la matriz de rectángulos y colores
	logic [7:0] screen [0:7][0:7];
    // Matriz de colores 8x8 (puedes personalizar estos valores)
    logic [7:0] colors [7:0][7:0] = '{'{8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00},
                                       '{8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF},
                                       '{8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00},
                                       '{8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00},
                                       '{8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF},
                                       '{8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00},
                                       '{8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00},
                                       '{8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'h00, 8'h00, 8'hFF}};

	logic [7:0] pixel_color; // Color del píxel basado en la matriz de colores
	
	
	    // Conectar los módulos Rectangle a la matriz de pantalla y colores
	generate
	  genvar i, j;
	  for (i = 0; i < 8; i = i + 1) begin : generate_loop_i
		 for (j = 0; j < 8; j = j + 1) begin : generate_loop_j
			rectgen #(
			  .WIDTH(60), // Ancho del rectángulo // creo que jugando con esto puedo hacer que se deje un espacio de unos 
			  .HEIGHT(60) // Alto del rectángulo
			) rect (
			  .x(i * 10), // Posición X basada en la columna
			  .y(j * 10), // Posición Y basada en la fila
			  .out(screen[i][j]), // Conexión a la matriz de pantalla
			  .color(colors[i][j]) // Conexión a la matriz de colores
			);
		 end
	  end
	endgenerate
	
		// Leer el color de la matriz de colores (colors) según la posición (x, y)
	always @* begin
		integer k,m;
		for (k = 0; k < 8; k = k + 1) begin
			for (m = 0; m < 8; m = m + 1) begin
				if ((x >= 0) && (x <= 510) && (y >= 0) && (y <= 440)) begin
					pixel_color = colors[x / 8][y / 7]; // Divide x e y para encontrar la ubicación en la matriz de colores
				end else begin
					pixel_color = 8'h00; // Divide x e y para encontrar la ubicación en la matriz de colores
				end
			end
		end
	end

    // Lógica para seleccionar el color basado en las coordenadas (x, y)
    always_comb begin
        r = pixel_color;
        g = pixel_color;
        b = pixel_color;
    end
	
endmodule