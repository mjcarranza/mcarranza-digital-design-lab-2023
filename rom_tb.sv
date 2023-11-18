`timescale 1ns/1ps  // Adjust the timescale as needed

module rom_tb;

  // Inputs
  reg [7:0] address;
  reg clock;

  // Outputs
  wire [31:0] q;

  // Instantiate the ROM module
  rom uut (
    .address(address),
    .clock(clock),
    .q(q)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Stimulus
  initial begin
    // Apply some test values to the ROM
    address = 8'h00;
    #10 address = 8'h01;
    #10 address = 8'h02;
    // Add more test cases as needed
  end

endmodule
