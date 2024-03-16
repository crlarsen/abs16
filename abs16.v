`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2024 07:25:47 PM
// Design Name: 
// Module Name: abs16
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

module Gij(\Pi:k , \Gi:k , \Gk-1:j , \Gi:j );
  input \Pi:k , \Gi:k , \Gk-1:j ;
  output \Gi:j ;

  assign \Gi:j = \Gi:k | (\Pi:k  & \Gk-1:j );
endmodule

module PijGij(\Pi:k , \Pk-1:j , \Gi:k , \Gk-1:j , \Pi:j , \Gi:j );
  input \Pi:k , \Pk-1:j , \Gi:k , \Gk-1:j ;
  output \Pi:j , \Gi:j ;

  assign \Pi:j = \Pi:k & \Pk-1:j ;
  assign \Gi:j = \Gi:k | (\Pi:k  & \Gk-1:j );
endmodule

module padder16(A, B, Cin, S, Cout);
  localparam N = 16;
  input [N-1:0] A, B;
  input Cin;
  output [N-1:0] S;
  output Cout;

  // P[i] is an alias for Pi:i, likewise G[i] is an alias for Gi:i
  wire [N-2:-1] P, G;

  assign P = {A[N-2:0] | B[N-2:0], 1'b0};
  assign G = {A[N-2:0] & B[N-2:0], Cin};

  assign S[0] = A[0] ^ G[-1];

  wire \G0:-1 ;

  Gij \0:-1 (P[0], G[0], G[-1], \G0:-1 );

  assign S[1] = A[1] ^ \G0:-1 ;

  wire \G1:-1 ;

  Gij \1:-1 (P[1], G[1], \G0:-1 , \G1:-1 );

  assign S[2] = A[2] ^ \G1:-1 ;

  wire \P2:1 , \G2:1 ;

  PijGij \2:1 (P[2], P[1], G[2], G[1], \P2:1 , \G2:1 );

  wire \G2:-1 ;

  Gij \2:-1 (\P2:1 , \G2:1 , \G0:-1 , \G2:-1 );

  assign S[3] = A[3] ^ \G2:-1 ;

  wire \G3:-1 ;

  Gij \3:-1 (P[3], G[3], \G2:-1 , \G3:-1 );

  assign S[4] = A[4] ^ \G3:-1 ;

  wire \P4:3 , \G4:3 ;

  PijGij \4:3 (P[4], P[3], G[4], G[3], \P4:3 , \G4:3 );

  wire \G4:-1 ;

  Gij \4:-1 (\P4:3 , \G4:3 , \G2:-1 , \G4:-1 );

  assign S[5] = A[5] ^ \G4:-1 ;

  wire \P5:3 , \G5:3 ;

  PijGij \5:3 (P[5], \P4:3 , G[5], \G4:3 , \P5:3 , \G5:3 );

  wire \G5:-1 ;

  Gij \5:-1 (\P5:3 , \G5:3 , \G2:-1 , \G5:-1 );

  assign S[6] = A[6] ^ \G5:-1 ;

  wire \P6:5 , \G6:5 ;

  PijGij \6:5 (P[6], P[5], G[6], G[5], \P6:5 , \G6:5 );

  wire \P6:3 , \G6:3 ;

  PijGij \6:3 (\P6:5 , \P4:3 , \G6:5 , \G4:3 , \P6:3 , \G6:3 );

  wire \G6:-1 ;

  Gij \6:-1 (\P6:3 , \G6:3 , \G2:-1 , \G6:-1 );

  assign S[7] = A[7] ^ \G6:-1 ;

  wire \G7:-1 ;

  Gij \7:-1 (P[7], G[7], \G6:-1 , \G7:-1 );

  assign S[8] = A[8] ^ \G7:-1 ;

  wire \P8:7 , \G8:7 ;

  PijGij \8:7 (P[8], P[7], G[8], G[7], \P8:7 , \G8:7 );

  wire \G8:-1 ;

  Gij \8:-1 (\P8:7 , \G8:7 , \G6:-1 , \G8:-1 );

  assign S[9] = A[9] ^ \G8:-1 ;

  wire \P9:7 , \G9:7 ;

  PijGij \9:7 (P[9], \P8:7 , G[9], \G8:7 , \P9:7 , \G9:7 );

  wire \G9:-1 ;

  Gij \9:-1 (\P9:7 , \G9:7 , \G6:-1 , \G9:-1 );

  assign S[10] = A[10] ^ \G9:-1 ;

  wire \P10:9 , \G10:9 ;

  PijGij \10:9 (P[10], P[9], G[10], G[9], \P10:9 , \G10:9 );

  wire \P10:7 , \G10:7 ;

  PijGij \10:7 (\P10:9 , \P8:7 , \G10:9 , \G8:7 , \P10:7 , \G10:7 );

  wire \G10:-1 ;

  Gij \10:-1 (\P10:7 , \G10:7 , \G6:-1 , \G10:-1 );

  assign S[11] = A[11] ^ \G10:-1 ;

  wire \P11:7 , \G11:7 ;

  PijGij \11:7 (P[11], \P10:7 , G[11], \G10:7 , \P11:7 , \G11:7 );

  wire \G11:-1 ;

  Gij \11:-1 (\P11:7 , \G11:7 , \G6:-1 , \G11:-1 );

  assign S[12] = A[12] ^ \G11:-1 ;

  wire \P12:11 , \G12:11 ;

  PijGij \12:11 (P[12], P[11], G[12], G[11], \P12:11 , \G12:11 );

  wire \P12:7 , \G12:7 ;

  PijGij \12:7 (\P12:11 , \P10:7 , \G12:11 , \G10:7 , \P12:7 , \G12:7 );

  wire \G12:-1 ;

  Gij \12:-1 (\P12:7 , \G12:7 , \G6:-1 , \G12:-1 );

  assign S[13] = A[13] ^ \G12:-1 ;

  wire \P13:11 , \G13:11 ;

  PijGij \13:11 (P[13], \P12:11 , G[13], \G12:11 , \P13:11 , \G13:11 );

  wire \P13:7 , \G13:7 ;

  PijGij \13:7 (\P13:11 , \P10:7 , \G13:11 , \G10:7 , \P13:7 , \G13:7 );

  wire \G13:-1 ;

  Gij \13:-1 (\P13:7 , \G13:7 , \G6:-1 , \G13:-1 );

  assign S[14] = A[14] ^ \G13:-1 ;

  wire \P14:13 , \G14:13 ;

  PijGij \14:13 (P[14], P[13], G[14], G[13], \P14:13 , \G14:13 );

  wire \P14:11 , \G14:11 ;

  PijGij \14:11 (\P14:13 , \P12:11 , \G14:13 , \G12:11 , \P14:11 , \G14:11 );

  wire \P14:7 , \G14:7 ;

  PijGij \14:7 (\P14:11 , \P10:7 , \G14:11 , \G10:7 , \P14:7 , \G14:7 );

  wire \G14:-1 ;

  Gij \14:-1 (\P14:7 , \G14:7 , \G6:-1 , \G14:-1 );

  assign S[15] = A[15] ^ \G14:-1 ;

  assign Cout = (\G14:-1 & A[15]) | (\G14:-1 & B[15]) | (A[15] & B[15]);

endmodule

module abs16(in, out);
  localparam N = 16;
  input [N-1:0] in;
  output [N-1:0] out;
  
  wire Cout;
  
  padder16 inst1(in ^ {N{in[N-1]}}, {N{1'b0}}, in[N-1], out, Cout);
endmodule
