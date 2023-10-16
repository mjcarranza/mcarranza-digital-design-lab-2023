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

	reg bandera, bomba, gana, pierde;
	reg m_inicio, m_selecMinas, m_cambioCelda, m_revisoBomba, m_revisoGane, m_ponerBandera;
	reg [3:0] cantidad_bombas;
	reg [3:0] cantidad_banderas;
	
	reg [7:0] matriz_bombas [7:0];

	reg [2:0] col_actual = 0;
	reg [2:0] fila_actual = 0;
	
	always @(clk) begin
		if (m_inicio == 1) begin
			bandera = 0;
			bomba = 0;
			gana = 0; 
			pierde = 0; 
			cantidad_banderas = 4'b0000;
		end
		
		if (m_selecMinas == 1) begin 
			cantidad_bombas = switches_bombas;
		end
		
		if (m_cambioCelda) begin
			for (int i = 0; i < 8; i++) begin
				$display("%b", matriz_bombas[i]);
			end
			$display("-");
		end
		
	end

	
	FSM maquina (
		.clk(clk), 
		.rst(rst), 
		.inicio(inicio), 
		.bandera(bandera),
		.bomba(bomba),
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
	.col(col_actual), 
	.fila(fila_actual), 
	.button_down(button_down), 
	.button_right(button_right),
	.button_bomba(button_bomba),
	.button_bandera(button_bandera), 
	.poner_bomba(bomba),
	.poner_bandera(bandera)
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
