`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2024 07:45:03 PM
// Design Name: 
// Module Name: abs_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module abs_tb;
  localparam N = 16;
  
  reg signed [N-1:0] a;
  wire signed [N-1:0] absA;
  
  integer i;
  initial
  begin
    for (i = -32768; i < 32768; i = i + 1)
      begin
        #10 assign a = i;
        if (((i < 0) && (absA != -i)) || (i >=0 && (absA != i)))
          begin
            $display("a = %d; |a| = %d", a, absA);
            $stop;
          end
      end
      
    $display($time);
    $display("No errors found!");
    $stop;
  end
  
  abs16 inst1(a, absA);
endmodule
