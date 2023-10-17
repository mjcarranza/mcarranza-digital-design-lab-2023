
// modulo para la configuracion de la matriz de juego
module matrix(
	input wire clk,
  output logic [6:0] board[7:0][7:0]
);

  typedef enum logic [2:0] {
    HIDDEN   = 3'b000,
    REVEALED = 3'b001,
    FLAG     = 3'b010,
    BOMB     = 3'b011
  } state_t;
  
  reg [2:0] counter = 3'b0;
  
  	always @(posedge clk) begin
		// Incrementa el contador en cada flanco de subida del reloj
		counter <= counter + 1;

		// Cuando el contador alcance 3 (0b011), lo reiniciamos a 0 (0b000)
		if (counter == 3'b011)
			counter <= 3'b000;

		// El valor del contador se convierte en el número aleatorio
		//random_3bit_number <= counter;
		
		    // estado HIDDEN por defecto
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				board[i][j][6:4] <= counter; // numero de bombas random
				board[i][j][3:1] = HIDDEN;
				board[i][j][0] = 1'b0; 
			end
		end
	end


endmodule
