module decodificador_modos(
    input wire [1:0] mode,
    input wire A, B, C, D,
    output wire a, b, c, d, e, f, g
);

    assign a = (mode == 2'b00) ? !((!A && !B && !C && !D) || (!A && !B && C && D)|| (!A && B && !C && D)|| (!A && B && C && !D)) : 
                                ((!A && !B && !C && D) || (!A && B && !C && !D)|| (A && !B && C && D)|| (A && B && !C && D));
    assign b = (mode == 2'b00) ? !((!A && !B && C && !D) || (!A && B && !C && D)|| (!A && B && C && !D)|| (A && !B && !C && D)) :
                                ((!A && B && !C && D) || (!A && B && C && !D)|| (A && !B && C && D)|| (A && B && !C && !D)|| (A && B && C && !D)|| (A && B && C && D));
    assign c = (mode == 2'b00) ? ((!A && !B && !C && D) || (!A && !B && C && D)|| (A && !B && !C && !D)|| (A && B && C && D)) :
                                ((!A && !B && C && !D) || (A && B && !C && !D)|| (A && B && C && !D)|| (A && B && C && D));
    assign d = (mode == 2'b00) ? !((!A && !B && !C && !D) || (!A && !B && C && D)|| (!A && B && C && !D)|| (!A && B && C && D)) :
                                ((!A && !B && !C && D) || (!A && B && !C && !D)|| (!A && B && C && D)|| (A && !B && !C && D)|| (A && !B && C && !D)|| (A && B && C && D));
    assign e = (mode == 2'b00) ? !((!A && !B && C && !D) ||(!A && B && !C && D) || (!A && B && C && !D)|| (!A && B && C && D)|| (A && !B && !C && !D)):
                                ((!A && !B && !C && D) ||(!A && !B && C && D) || (!A && B && !C && !D)|| (!A && B && !C && D)|| (!A && B && C && D)|| (A && !B && !C && D));
    assign f = (mode == 2'b00) ? ((!A && !B && !C && D) || (!A && !B && C && D)|| (!A && B && C && D)|| (A && !B && !C && D)|| (A && B && C && D)):
                                ((!A && !B && !C && D) || (!A && !B && C && !D)|| (!A && !B && C && D)|| (!A && B && C && D)|| (A && B && !C && D));
    assign g = (mode == 2'b00) ? ((!A && B && C && !D) || (A && B && C && D)) : 
										  ((!A && !B && !C && !D) || (!A && !B && !C && D)|| (!A && B && C && D)|| (A && B && !C && !D));

endmodule
