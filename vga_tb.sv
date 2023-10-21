module vga_tb;

  // Definir las señales de entrada y salida del módulo vga
  logic clk;
  logic vgaclk, hsync, vsync;
  logic [7:0] r, g, b;

  // Instanciar el módulo vga
  vga vga_inst (
    .clk(clk),
    .vgaclk(vgaclk),
    .hsync(hsync),
    .vsync(vsync),
    .r(r),
    .g(g),
    .b(b)
  );

  // Generar una señal de reloj de prueba
  reg tb_clk = 0;
  always #5 tb_clk = ~tb_clk;

  // Simular el comportamiento de la entrada del reloj
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // Simular una secuencia de operaciones
  initial begin
    // Esperar unos ciclos antes de comenzar la prueba
    //#10;

    // Establecer el comportamiento de las entradas
    // Asignar un valor específico a la señal de entrada 'clk' en el tiempo 10
    clk = 0;
	 r = 8'h00;
	 g = 8'hAA;
	 b = 8'hFF;

	 // Cambiar la señal 'r' cada 20 unidades de tiempo
	 #20 r = 8'hFF;
	 #20 g = 8'h00;
	 #20 b = 8'hAA;
	 
	 #20 r = 8'hAA;
	 #20 g = 8'hFF;
	 #20 b = 8'h00;
	 
	 #20 r = 8'h00;
	 #20 g = 8'hAA;
	 #20 b = 8'hFF;


    // Esperar un tiempo para observar las salidas 8'h00
    #20;


  end

endmodule
