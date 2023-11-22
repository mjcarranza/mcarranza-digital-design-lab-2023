`timescale 1ns/1ps

module cpu_tb;

   // Inputs
   logic clkFPGA;
   logic rst;

   // Outputs
   logic vgaclk, hsync, vsync, sync_b, blank_b;
   logic [7:0] r, g, b;

   // Instantiate the CPU module
   cpu cpu_inst(
      .clkFPGA(clkFPGA),
      .rst(rst),
      .vgaclk(vgaclk),
      .hsync(hsync),
      .vsync(vsync),
      .sync_b(sync_b),
      .blank_b(blank_b),
      .r(r),
      .g(g),
      .b(b)
   );

   // Clock generation
   initial begin
      clkFPGA = 0;
      forever #5 clkFPGA = ~clkFPGA;
   end

   // Reset generation
   initial begin
      rst = 1;
      #10 rst = 0;
      //#1000 $finish;
   end

   // Monitor to display VGA signals
   always @(posedge vgaclk) begin
      $display("Time: %0t, HSYNC: %b, VSYNC: %b, BLANK_B: %b", $time, hsync, vsync, blank_b);
   end

   // Stimulus generation (you can add more meaningful stimuli)
   initial begin
      #20; 
   end

endmodule
