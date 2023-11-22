`timescale 1ns/1ps  // Adjust the timescale as needed

module ram_tb;

  // Inputs
  reg [15:0] address;
  reg clock;
  reg [31:0] data;
  reg wren;

  // Outputs
  wire [31:0] q;

  // Instantiate the RAM module
  ram1 uut (
    .address(address),
    .clock(clock),
    .data(data),
    .wren(wren),
    .q(q)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Stimulus
  initial begin
    // Apply some test values to the RAM
    address = 16'h0000;
    data = 32'h12345678;
    wren = 1;
    #10 wren = 0;

    address = 16'h0001;
    data = 32'hABCDEF01;
    wren = 1;
    #10 wren = 0;

  end

  // Display output
  always @(posedge clock) begin
    $display("Address = %h, Write Enable = %b, Data = %h, Output = %h", address, wren, data, q);
  end

endmodule
