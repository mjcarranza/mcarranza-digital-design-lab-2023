

// generador de reloj VGA
module clockVGA (
	input wire logic clk, // clock 50Mhz
	output logic vga_clk //pixel clock
	);
always @(posedge clk) begin
	vga_clk = !vga_clk; //se pasa por flipflop tipo D
end 
endmodule 