module BuscaMinas(
	input clk, rst,
	input logic inicio, 
	input logic [3:0] switches_bombas,
	input wire button_down,
	input wire button_right, 
	input wire button_bomba, 
	input wire button_bandera,
	output logic [6:0] display_0,
	output logic [6:0] display_6
	
);

	reg poner_bandera, poner_bomba, gana, pierde;
	reg poner_bandera_aux, poner_bomba_aux;
	reg m_inicio, m_selecMinas, m_cambioCelda, m_revisoBomba, m_revisoGane, m_ponerBandera;
	reg [3:0] cantidad_bombas;
	reg [3:0] cantidad_banderas;
	reg [3:0] cantidad_banderas_aux;
	
	reg [7:0] matriz_bombas [7:0];
	reg [7:0] matriz_banderas [7:0];
	reg [7:0] matriz_banderas_aux [7:0];
	
	
	reg [7:0] matriz_seleccion [7:0];
	reg [7:0] matriz_seleccion_aux [7:0];

	reg [2:0] col_actual = 0;
	reg [2:0] fila_actual = 0;
	
	reg [2:0] col_actual_aux = 0;
	reg [2:0] fila_actual_aux = 0;
	
	

	
	always @(clk) begin
	
		if (rst) begin 
			for (int i = 0; i < 8; i++) begin
				matriz_banderas[i] = 8'b00000000;
			end
		end
		if (m_inicio == 1) begin
			cantidad_banderas = 4'b0000;
			col_actual = 0;
			fila_actual = 0;
			for (int i = 0; i < 8; i++) begin
				matriz_banderas[i] = 8'b00000000;
			end
		end
		
		if (m_selecMinas == 1) begin 
			cantidad_bombas = switches_bombas;
		end
		
		if (m_cambioCelda == 1) begin
			poner_bandera = poner_bandera_aux;
			poner_bomba = poner_bomba_aux;
			col_actual = col_actual_aux;
			fila_actual = fila_actual_aux;
		end
		
		if (m_revisoBomba == 1) begin 
			poner_bomba = 0;
			$display("col: %d fila: %d, v:%b", col_actual, fila_actual, matriz_bombas[col_actual][fila_actual]);
			$display("entro a reviso pierde con %b", pierde);
			if (pierde) begin 
				$display("Perdio");
			end
		end
		
		if (m_ponerBandera == 1) begin 
			cantidad_banderas = cantidad_banderas_aux;
			
			$display("banderas: ");
			for (int i = 0; i < 8; i++) begin
				$display("%b", matriz_banderas_aux[i]);
				matriz_banderas[i] = matriz_banderas_aux[i];
			end
			
			$display("bombas: ");
			for (int i = 0; i < 8; i++) begin
				$display("%b", matriz_bombas[i]);
			end
			
			$display("cantidad b: %d a:%d", cantidad_banderas, cantidad_banderas_aux);
		end
		
		if (m_revisoGane == 1) begin 
			poner_bandera = 0;
			$display("entro a reviso gane con %b", gana);
			if (gana) begin 
				$display("Gano");
			end
			
		end
		
		
		
		
	end

	
	FSM maquina (
		.clk(clk), 
		.rst(rst), 
		.inicio(inicio), 
		.bandera(poner_bandera),
		.bomba(poner_bomba),
		.pierde(pierde),
		.gana(gana),
		.m_inicio(m_inicio),
		.m_selecMinas(m_selecMinas), 
		.m_cambioCelda(m_cambioCelda), 
		.m_revisoBomba(m_revisoBomba), 
		.m_revisoGane(m_revisoGane), 
		.m_ponerBandera(m_ponerBandera)
	);
	
	selecMinas uut (
		.switch_data(switches_bombas),
		.switch_inicio(inicio),
		.matriz(matriz_bombas)
	);
	
	moverse mov (
		.col(col_actual_aux), 
		.fila(fila_actual_aux), 
		.button_down(button_down), 
		.button_right(button_right), 
		.button_bomba(button_bomba),
		.button_bandera(button_bandera), 
		.poner_bomba(poner_bomba_aux),
		.poner_bandera(poner_bandera_aux)
	);
	  
	colocarBandera uutcol (
		.col(col_actual), 
		.fila(fila_actual), 
		.banderas_matriz(matriz_banderas),
		.button_bandera(button_bandera), 
		.matriz_salida(matriz_banderas_aux),
		.cantidad_banderas(cantidad_banderas_aux)
	);
	
	revisoGane ganeuut (
    .banderas_matriz(matriz_banderas),
    .bombas_matriz(matriz_bombas),
    .gane(gana)
	);
	
	revisoBomba bombauut (
		.col(col_actual), 
		.fila(fila_actual), 
		.bombas_matriz(matriz_bombas), 
		.pierde(pierde)
	);
  
  
	
	decodificador d1(
		.A(cantidad_bombas[3]),
		.B(cantidad_bombas[2]),
		.C(cantidad_bombas[1]),
		.D(cantidad_bombas[0]),
		.a(display_0[6]),
		.b(display_0[5]),
		.c(display_0[4]),
		.d(display_0[3]),
		.e(display_0[2]),
		.f(display_0[1]),
		.g(display_0[0])
	);
	
	decodificador d6(
		.A(cantidad_banderas[3]),
		.B(cantidad_banderas[2]),
		.C(cantidad_banderas[1]),
		.D(cantidad_banderas[0]),
		.a(display_6[6]),
		.b(display_6[5]),
		.c(display_6[4]),
		.d(display_6[3]),
		.e(display_6[2]),
		.f(display_6[1]),
		.g(display_6[0])
	);
	
	
	



endmodule
