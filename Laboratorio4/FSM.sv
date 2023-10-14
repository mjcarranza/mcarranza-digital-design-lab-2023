module FMS(input inicio, bomba, seleccion, aciertoBomba, completaBanderas, clk, rst, 
			 output incio, selecMinas, cambioCelda, revisoBomba, revisoGane, ponerBandera);

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
		4'b0010: if (bomba) next_state = 4'b0011; else if (seleccion) next_state = 4'b0100; else next_state = 4'b0010;
		4'b0011: next_state = 4'b0101;
		4'b0101: if (completaBanderas) next_state = 4'b0000; else next_state = 4'b0010;
		4'b0100: if (aciertoBomba) next_state = 4'b0000; else next_state = 4'b0010;
		default: next_state = 4'b0000;
	endcase
	
// output logic 
assign incio = (state == 4'b0000);
assign selecMinas = (state == 4'b0001);
assign cambioCelda = (state == 4'b0010);
assign revisoBomba = (state == 4'b0100);
assign revisoGane = (state == 4'b0101);
assign ponerBandera = (state == 4'b0011);

endmodule
