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

module padder16(A, B, Cin, S);
  localparam N = 16;
  input [N-1:0] A, B;
  input Cin;
  output [N-1:0] S;
  // P[i] is an alias for Pi:i, likewise G[i] is an alias for Gi:i
  wire [N-2:-1] P, G;

  assign P = {A[N-2:0] | B[N-2:0], 1'b0};
  assign G = {A[N-2:0] & B[N-2:0], Cin};

  assign S[0] = A[0] ^ G[-1];

  wire \G0:-1 ;

  assign \G0:-1  = G[0] | (P[0]  & G[-1] );

  assign S[1] = A[1] ^ \G0:-1 ;

  wire \G1:-1 ;

  assign \G1:-1  = G[1] | (P[1]  & \G0:-1  );

  assign S[2] = A[2] ^ \G1:-1 ;

  wire \P2:1 , \G2:1 ;

  assign \P2:1  = P[2] & P[1] ;
  assign \G2:1  = G[2] | (P[2]  & G[1] );

  wire \G2:-1 ;

  assign \G2:-1  = \G2:1  | (\P2:1   & \G0:-1  );

  assign S[3] = A[3] ^ \G2:-1 ;

  wire \G3:-1 ;

  assign \G3:-1  = G[3] | (P[3]  & \G2:-1  );

  assign S[4] = A[4] ^ \G3:-1 ;

  wire \P4:3 , \G4:3 ;

  assign \P4:3  = P[4] & P[3] ;
  assign \G4:3  = G[4] | (P[4]  & G[3] );

  wire \G4:-1 ;

  assign \G4:-1  = \G4:3  | (\P4:3   & \G2:-1  );

  assign S[5] = A[5] ^ \G4:-1 ;

  wire \P5:3 , \G5:3 ;

  assign \P5:3  = P[5] & \P4:3  ;
  assign \G5:3  = G[5] | (P[5]  & \G4:3  );

  wire \G5:-1 ;

  assign \G5:-1  = \G5:3  | (\P5:3   & \G2:-1  );

  assign S[6] = A[6] ^ \G5:-1 ;

  wire \P6:5 , \G6:5 ;

  assign \P6:5  = P[6] & P[5] ;
  assign \G6:5  = G[6] | (P[6]  & G[5] );

  wire \P6:3 , \G6:3 ;

  assign \P6:3  = \P6:5  & \P4:3  ;
  assign \G6:3  = \G6:5  | (\P6:5   & \G4:3  );

  wire \G6:-1 ;

  assign \G6:-1  = \G6:3  | (\P6:3   & \G2:-1  );

  assign S[7] = A[7] ^ \G6:-1 ;

  wire \G7:-1 ;

  assign \G7:-1  = G[7] | (P[7]  & \G6:-1  );

  assign S[8] = A[8] ^ \G7:-1 ;

  wire \P8:7 , \G8:7 ;

  assign \P8:7  = P[8] & P[7] ;
  assign \G8:7  = G[8] | (P[8]  & G[7] );

  wire \G8:-1 ;

  assign \G8:-1  = \G8:7  | (\P8:7   & \G6:-1  );

  assign S[9] = A[9] ^ \G8:-1 ;

  wire \P9:7 , \G9:7 ;

  assign \P9:7  = P[9] & \P8:7  ;
  assign \G9:7  = G[9] | (P[9]  & \G8:7  );

  wire \G9:-1 ;

  assign \G9:-1  = \G9:7  | (\P9:7   & \G6:-1  );

  assign S[10] = A[10] ^ \G9:-1 ;

  wire \P10:9 , \G10:9 ;

  assign \P10:9  = P[10] & P[9] ;
  assign \G10:9  = G[10] | (P[10]  & G[9] );

  wire \P10:7 , \G10:7 ;

  assign \P10:7  = \P10:9  & \P8:7  ;
  assign \G10:7  = \G10:9  | (\P10:9   & \G8:7  );

  wire \G10:-1 ;

  assign \G10:-1  = \G10:7  | (\P10:7   & \G6:-1  );

  assign S[11] = A[11] ^ \G10:-1 ;

  wire \P11:7 , \G11:7 ;

  assign \P11:7  = P[11] & \P10:7  ;
  assign \G11:7  = G[11] | (P[11]  & \G10:7  );

  wire \G11:-1 ;

  assign \G11:-1  = \G11:7  | (\P11:7   & \G6:-1  );

  assign S[12] = A[12] ^ \G11:-1 ;

  wire \P12:11 , \G12:11 ;

  assign \P12:11  = P[12] & P[11] ;
  assign \G12:11  = G[12] | (P[12]  & G[11] );

  wire \P12:7 , \G12:7 ;

  assign \P12:7  = \P12:11  & \P10:7  ;
  assign \G12:7  = \G12:11  | (\P12:11   & \G10:7  );

  wire \G12:-1 ;

  assign \G12:-1  = \G12:7  | (\P12:7   & \G6:-1  );

  assign S[13] = A[13] ^ \G12:-1 ;

  wire \P13:11 , \G13:11 ;

  assign \P13:11  = P[13] & \P12:11  ;
  assign \G13:11  = G[13] | (P[13]  & \G12:11  );

  wire \P13:7 , \G13:7 ;

  assign \P13:7  = \P13:11  & \P10:7  ;
  assign \G13:7  = \G13:11  | (\P13:11   & \G10:7  );

  wire \G13:-1 ;

  assign \G13:-1  = \G13:7  | (\P13:7   & \G6:-1  );

  assign S[14] = A[14] ^ \G13:-1 ;

  wire \P14:13 , \G14:13 ;

  assign \P14:13  = P[14] & P[13] ;
  assign \G14:13  = G[14] | (P[14]  & G[13] );

  wire \P14:11 , \G14:11 ;

  assign \P14:11  = \P14:13  & \P12:11  ;
  assign \G14:11  = \G14:13  | (\P14:13   & \G12:11  );

  wire \P14:7 , \G14:7 ;

  assign \P14:7  = \P14:11  & \P10:7  ;
  assign \G14:7  = \G14:11  | (\P14:11   & \G10:7  );

  wire \G14:-1 ;

  assign \G14:-1  = \G14:7  | (\P14:7   & \G6:-1  );

  assign S[15] = A[15] ^ \G14:-1 ;

endmodule

module abs16(in, out);
  localparam N = 16;
  input [N-1:0] in;
  output [N-1:0] out;
  
  wire Cout;
  
  padder16 inst1(in ^ {N{in[N-1]}}, {N{1'b0}}, in[N-1], out);
endmodule
