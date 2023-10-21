module FSM(input inicio, bandera, bomba, pierde, gana, clk, rst, 
			 output m_inicio, m_selecMinas, m_cambioCelda, m_revisoBomba, m_revisoGane, m_ponerBandera);

logic[3:0] state, next_state;

//actual state logic 

always_ff @(posedge clk or posedge rst)
	if (rst) state = 4'b0000;
	else
		state = next_state;
		
//next state logic		
always_comb
	case(state)
		4'b0000: next_state = 4'b0001;
		4'b0001: if (inicio) next_state = 4'b0010; else next_state = 4'b0001;
		4'b0010: if (bandera) next_state = 4'b0011; else if (bomba) next_state = 4'b0100; else next_state = 4'b0010;
		4'b0011: next_state = 4'b0101;
		4'b0101: if (gana) next_state = 4'b0000; else next_state = 4'b0010;
		4'b0100: if (pierde) next_state = 4'b0000; else next_state = 4'b0010;
		default: next_state = 4'b0000;
	endcase
	
// output logic 
assign m_inicio = (state == 4'b0000);
assign m_selecMinas = (state == 4'b0001);
assign m_cambioCelda = (state == 4'b0010);
assign m_revisoBomba = (state == 4'b0100);
assign m_revisoGane = (state == 4'b0101);
assign m_ponerBandera = (state == 4'b0011);

endmodule
