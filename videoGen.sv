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
	

	// Given y position, choose a character to display
	// then look up the pixel value from the character ROM
	// and display it in red or blue.Also draw a green rectangle.
	//chargenrom chargenromb(y[8:3] + 8'd65, x[2:0], y[2:0], pixel);  	// este es el de mostrar los numeros
	//chargenrom chargenromb(y[8:3] + 8'd65, x[2:0], y[2:0], pixel);  	// este es el de mostrar los numeros
	
	//assign inrect = (x >= 10'd10 & x < 10'd50 & y >= 10'd10 & y < 10'd50);
	
					//				left		top		right		bot
	//rectgen rectgen(x, y, 10'd120, 10'd150, 10'd200, 10'd230, inrect);
	//assign r = (y[4]==0) ? {{8{pixel}},8'h00} : {8'h00,{8{pixel}}};		/// para pintar los numeros 
	//assign g = inrect1 ? 8'hFF : 8'h00;
	//assign b = inrect2 ? 8'hFF : 8'h00;
	//assign r = inrect3 ? 8'hFF : 8'h00;
	
	    // Conectar los módulos Rectangle a la matriz de pantalla y colores
	generate
	  genvar i, j;
	  for (i = 0; i < 8; i = i + 1) begin : generate_loop_i
		 for (j = 0; j < 8; j = j + 1) begin : generate_loop_j
			rectgen #(
			  .WIDTH(80), // Ancho del rectángulo // creo que jugando con esto puedo hacer que se deje un espacio de unos 
			  .HEIGHT(60) // Alto del rectángulo
			) rect (
			  .x(i * 80), // Posición X basada en la columna
			  .y(j * 80), // Posición Y basada en la fila
			  .out(screen[i][j]), // Conexión a la matriz de pantalla
			  .color(colors[i][j]) // Conexión a la matriz de colores
			);
		 end
	  end
	endgenerate
	
		// Leer el color de la matriz de colores (colors) según la posición (x, y)
	always @* begin
	 pixel_color = colors[x / 11][y / 11]; // Divide x e y para encontrar la ubicación en la matriz de colores
	end

    // Lógica para seleccionar el color basado en las coordenadas (x, y)
    always_comb begin
        r = colors[x[2:0]][y[2:0]][7:0];
        g = colors[x[2:0]][y[2:0]][7:0];
        b = colors[x[2:0]][y[2:0]][7:0];
    end
	
endmodule







