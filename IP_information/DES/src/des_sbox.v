
/*##########################################################################
--
--                                                                       --
--  Module      : des_sbox.v                                             --
--  Last Update : 08/01/2001
--                                                                       --
--  Description : DES S-box constants					 --
--                                                                       --
--                                                                       --
--  Designers   : Steve Trimberger & Vikram Pasham                      --
--  Company     : Xilinx & Inc.                                          --
--                                                                       --
--                                                                       --
--  Disclaimer  : THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY    --
--                WHATSOEVER AND XILINX SPECIFICALLY DISCLAIMS ANY       --
--                IMPLIED WARRANTIES OF MERCHANTABILITY & FITNESS FOR    --
--                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.         --
--                THEY ARE ONLY INTENDED TO BE USED BY XILINX            --
--                CUSTOMERS, AND WITHIN XILINX DEVICES.                  --
--                                                                       --
--                Copyright (c) 2000 Xilinx, Inc.                        --
--                All rights reserved                                    --
--                                                                       --
--                                                                       --
--                                                                       --
--#########################################################################*/


// Include Synplify Virtex-II/ Virtex-E library
// `include "virtex2.v"
//`include "virtexe.v"


module SB1(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;


always @(addr) begin
case (addr[2:5])
    0:  d0 = 14; 
    1:  d0 = 4;
    2:  d0 = 13;
    3:  d0 = 1;
    4:  d0 = 2;
    5:  d0 = 15;
    6:  d0 = 11;
    7:  d0 = 8;
    8:  d0 = 3;
    9:  d0 = 10;
    10: d0 = 6;
    11: d0 = 12;
    12: d0 = 5;
    13: d0 = 9;
    14: d0 = 0;
    15: d0 = 7;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d1 = 0;
    1:  d1 = 15;
    2:  d1 = 7;
    3:  d1 = 4;
    4:  d1 = 14;
    5:  d1 = 2;
    6:  d1 = 13;
    7:  d1 = 1;
    8:  d1 = 10;
    9:  d1 = 6;
    10: d1 = 12;
    11: d1 = 11;
    12: d1 = 9;
    13: d1 = 5;
    14: d1 = 3;
    15: d1 = 8;
    default: d1 = 0;
    endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d2 = 4;
    1:  d2 = 1;
    2:  d2 = 14;
    3:  d2 = 8;
    4:  d2 = 13;
    5:  d2 = 6;
    6:  d2 = 2;
    7:  d2 = 11;
    8:  d2 = 15;
    9:  d2 = 12;
    10: d2 = 9;
    11: d2 = 7;
    12: d2 = 3;
    13: d2 = 10;
    14: d2 = 5;
    15: d2 = 0;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d3 = 15;
    1:  d3 = 12;
    2:  d3 = 8;
    3:  d3 = 2;
    4:  d3 = 4;
    5:  d3 = 9;
    6:  d3 = 1;
    7:  d3 = 7;
    8:  d3 = 5;
    9:  d3 = 11;
    10: d3 = 3;
    11: d3 = 14;
    12: d3 = 10;
    13: d3 = 0;
    14: d3 = 6;
    15: d3 = 13;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule


/*   SBOX 2 */

module SB2(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;

always @(addr) begin
case(addr[2:5])
    0 :  d0 =  15;
    1 :  d0 =  1;
    2 :  d0 =  8;
    3 :  d0 =  14;
    4 :  d0 =  6;
    5 :  d0 =  11;
    6 :  d0 =  3;
    7 :  d0 =  4;
    8 :  d0 =  9;
    9 :  d0 =  7;
    10:  d0 =  2;
    11:  d0 =  13;
    12:  d0 =  12;
    13:  d0 =  0;
    14:  d0 =  5;
    15:  d0 =  10;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d1 =  3;
    1:  d1 =  13;
    2:  d1 =  4;
    3:  d1 =  7;
    4:  d1 =  15;
    5:  d1 =  2;
    6:  d1 =  8;
    7:  d1 =  14;
    8:  d1 =  12;
    9:  d1 =  0;
    10: d1 =  1;
    11: d1 =  10;
    12: d1 =  6;
    13: d1 =  9;
    14: d1 =  11;
    15: d1 =  5;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d2 =  0;
    1:  d2 =  14;
    2:  d2 =  7;
    3:  d2 =  11;
    4:  d2 =  10;
    5:  d2 =  4;
    6:  d2 =  13;
    7:  d2 =  1;
    8:  d2 =  5;
    9:  d2 =  8;
    10: d2 =  12;
    11: d2 =  6;
    12: d2 =  9;
    13: d2 =  3;
    14: d2 =  2;
    15: d2 =  15;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d3 =  13;
    1:  d3 =  8;
    2:  d3 =  10;
    3:  d3 =  1;
    4:  d3 =  3;
    5:  d3 =  15;
    6:  d3 =  4;
    7:  d3 =  2;
    8:  d3 =  11;
    9:  d3 =  6;
    10: d3 =  7;
    11: d3 =  12;
    12: d3 =  0;
    13: d3 =  5;
    14: d3 =  14;
    15: d3 =  9;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule


/* Sbox 3 */

module SB3(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;

always @(addr) begin
case (addr[2:5])
    0:  d0 = 10;
    1:  d0 = 0;
    2:  d0 = 9;
    3:  d0 = 14;
    4:  d0 = 6;
    5:  d0 = 3;
    6:  d0 = 15;
    7:  d0 = 5;
    8:  d0 = 1;
    9:  d0 = 13;
    10: d0 = 12;
    11: d0 = 7;
    12: d0 = 11;
    13: d0 = 4;
    14: d0 = 2;
    15: d0 = 8;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d1 = 13;
    1:  d1 = 7;
    2:  d1 = 0;
    3:  d1 = 9;
    4:  d1 = 3;
    5:  d1 = 4;
    6:  d1 = 6;
    7:  d1 = 10;
    8:  d1 = 2;
    9:  d1 = 8;
    10: d1 = 5;
    11: d1 = 14;
    12: d1 = 12;
    13: d1 = 11;
    14: d1 = 15;
    15: d1 = 1;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d2 = 13;
    1:  d2 = 6;
    2:  d2 = 4;
    3:  d2 = 9;
    4:  d2 = 8;
    5:  d2 = 15;
    6:  d2 = 3;
    7:  d2 = 0;
    8:  d2 = 11;
    9:  d2 = 1;
    10: d2 = 2;
    11: d2 = 12;
    12: d2 = 5;
    13: d2 = 10;
    14: d2 = 14;
    15: d2 = 7;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d3 = 1;
    1:  d3 = 10;
    2:  d3 = 13;
    3:  d3 = 0;
    4:  d3 = 6;
    5:  d3 = 9;
    6:  d3 = 8;
    7:  d3 = 7;
    8:  d3 = 4;
    9:  d3 = 15;
    10: d3 = 14;
    11: d3 = 3;
    12: d3 = 11;
    13: d3 = 5;
    14: d3 = 2;
    15: d3 = 12;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule


/* Sbox 4 */

module SB4(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;


always @(addr) begin
case (addr[2:5])
    0:   d0 = 7;
    1:   d0 = 13;
    2:   d0 = 14;
    3:   d0 = 3;
    4:   d0 = 0;
    5:   d0 = 6;
    6:   d0 = 9;
    7:   d0 = 10;
    8:   d0 = 1;
    9:   d0 = 2;
    10:  d0 = 8;
    11:  d0 = 5;
    12:  d0 = 11;
    13:  d0 = 12;
    14:  d0 = 4;
    15:  d0 = 15;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:   d1 = 13;
    1:   d1 = 8;
    2:   d1 = 11;
    3:   d1 = 5;
    4:   d1 = 6;
    5:   d1 = 15;
    6:   d1 = 0;
    7:   d1 = 3;
    8:   d1 = 4;
    9:   d1 = 7;
    10:  d1 = 2;
    11:  d1 = 12;
    12:  d1 = 1;
    13:  d1 = 10;
    14:  d1 = 14;
    15:  d1 = 9;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:   d2 = 10;
    1:   d2 = 6;
    2:   d2 = 9;
    3:   d2 = 0;
    4:   d2 = 12;
    5:   d2 = 11;
    6:   d2 = 7;
    7:   d2 = 13;
    8:   d2 = 15;
    9:   d2 = 1;
    10:  d2 = 3;
    11:  d2 = 14;
    12:  d2 = 5;
    13:  d2 = 2;
    14:  d2 = 8;
    15:  d2 = 4;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:   d3 = 3;
    1:   d3 = 15;
    2:   d3 = 0;
    3:   d3 = 6;
    4:   d3 = 10;
    5:   d3 = 1;
    6:   d3 = 13;
    7:   d3 = 8;
    8:   d3 = 9;
    9:   d3 = 4;
    10:  d3 = 5;
    11:  d3 = 11;
    12:  d3 = 12;
    13:  d3 = 7;
    14:  d3 = 2;
    15:  d3 = 14;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule


/* Sbox 5 */

module SB5(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;


always @(addr) begin
case (addr[2:5])
    0:  d0 = 2;
    1:  d0 = 12;
    2:  d0 = 4;
    3:  d0 = 1;
    4:  d0 = 7;
    5:  d0 = 10;
    6:  d0 = 11;
    7:  d0 = 6;
    8:  d0 = 8;
    9:  d0 = 5;
    10: d0 = 3;
    11: d0 = 15;
    12: d0 = 13;
    13: d0 = 0;
    14: d0 = 14;
    15: d0 = 9;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d1 = 14;
    1:  d1 = 11;
    2:  d1 = 2;
    3:  d1 = 12;
    4:  d1 = 4;
    5:  d1 = 7;
    6:  d1 = 13;
    7:  d1 = 1;
    8:  d1 = 5;
    9:  d1 = 0;
    10: d1 = 15;
    11: d1 = 10;
    12: d1 = 3;
    13: d1 = 9;
    14: d1 = 8;
    15: d1 = 6;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d2 = 4;
    1:  d2 = 2;
    2:  d2 = 1;
    3:  d2 = 11;
    4:  d2 = 10;
    5:  d2 = 13;
    6:  d2 = 7;
    7:  d2 = 8;
    8:  d2 = 15;
    9:  d2 = 9;
    10: d2 = 12;
    11: d2 = 5;
    12: d2 = 6;
    13: d2 = 3;
    14: d2 = 0;
    15: d2 = 14;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d3 = 11;
    1:  d3 = 8;
    2:  d3 = 12;
    3:  d3 = 7;
    4:  d3 = 1;
    5:  d3 = 14;
    6:  d3 = 2;
    7:  d3 = 13;
    8:  d3 = 6;
    9:  d3 = 15;
    10: d3 = 0;
    11: d3 = 9;
    12: d3 = 10;
    13: d3 = 4;
    14: d3 = 5;
    15: d3 = 3;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule



/* Sbox 6  */

module SB6(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;


always @(addr) begin
case (addr[2:5])
    0:  d0 = 12;
    1:  d0 = 1;
    2:  d0 = 10;
    3:  d0 = 15;
    4:  d0 = 9;
    5:  d0 = 2;
    6:  d0 = 6;
    7:  d0 = 8;
    8:  d0 = 0;
    9:  d0 = 13;
    10: d0 = 3;
    11: d0 = 4;
    12: d0 = 14;
    13: d0 = 7;
    14: d0 = 5;
    15: d0 = 11;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d1 = 10;
    1:  d1 = 15;
    2:  d1 = 4;
    3:  d1 = 2;
    4:  d1 = 7;
    5:  d1 = 12;
    6:  d1 = 9;
    7:  d1 = 5;
    8:  d1 = 6;
    9:  d1 = 1;
    10: d1 = 13;
    11: d1 = 14;
    12: d1 = 0;
    13: d1 = 11;
    14: d1 = 3;
    15: d1 = 8;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d2 = 9;
    1:  d2 = 14;
    2:  d2 = 15;
    3:  d2 = 5;
    4:  d2 = 2;
    5:  d2 = 8;
    6:  d2 = 12;
    7:  d2 = 3;
    8:  d2 = 7;
    9:  d2 = 0;
    10: d2 = 4;
    11: d2 = 10;
    12: d2 = 1;
    13: d2 = 13;
    14: d2 = 11;
    15: d2 = 6;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d3 = 4;
    1 : d3 = 3;
    2 : d3 = 2;
    3 : d3 = 12;
    4 : d3 = 9;
    5 : d3 = 5;
    6 : d3 = 15;
    7 : d3 = 10;
    8 : d3 = 11;
    9 : d3 = 14;
    10: d3 = 1;
    11: d3 = 7;
    12: d3 = 6;
    13: d3 = 0;
    14: d3 = 8;
    15: d3 = 13;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule



/* Sbox 7 */

module SB7(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;


always @(addr) begin
case (addr[2:5])
    0:  d0 = 4;
    1:  d0 = 11;
    2:  d0 = 2;
    3:  d0 = 14;
    4:  d0 = 15;
    5:  d0 = 0;
    6:  d0 = 8;
    7:  d0 = 13;
    8:  d0 = 3;
    9:  d0 = 12;
    10: d0 = 9;
    11: d0 = 7;
    12: d0 = 5;
    13: d0 = 10;
    14: d0 = 6;
    15: d0 = 1;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d1 = 13;
    1:  d1 = 0;
    2:  d1 = 11;
    3:  d1 = 7;
    4:  d1 = 4;
    5:  d1 = 9;
    6:  d1 = 1;
    7:  d1 = 10;
    8:  d1 = 14;
    9:  d1 = 3;
    10: d1 = 5;
    11: d1 = 12;
    12: d1 = 2;
    13: d1 = 15;
    14: d1 = 8;
    15: d1 = 6;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d2 = 1;
    1:  d2 = 4;
    2:  d2 = 11;
    3:  d2 = 13;
    4:  d2 = 12;
    5:  d2 = 3;
    6:  d2 = 7;
    7:  d2 = 14;
    8:  d2 = 10;
    9:  d2 = 15;
    10: d2 = 6;
    11: d2 = 8;
    12: d2 = 0;
    13: d2 = 5;
    14: d2 = 9;
    15: d2 = 2;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d3 = 6;
    1:  d3 = 11;
    2:  d3 = 13;
    3:  d3 = 8;
    4:  d3 = 1;
    5:  d3 = 4;
    6:  d3 = 10;
    7:  d3 = 7;
    8:  d3 = 9;
    9:  d3 = 5;
    10: d3 = 0;
    11: d3 = 15;
    12: d3 = 14;
    13: d3 = 2;
    14: d3 = 3;
    15: d3 = 12;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule


/* Sbox 8 */

module SB8(addr,da,db);
input [1:6] addr;
output [1:4] da;
output [1:4] db;
reg [1:4] d0;
reg [1:4] d1;
reg [1:4] d2;
reg [1:4] d3;


always @(addr) begin
case (addr[2:5])
    0:  d0 = 13;
    1:  d0 = 2;
    2:  d0 = 8;
    3:  d0 = 4;
    4:  d0 = 6;
    5:  d0 = 15;
    6:  d0 = 11;
    7:  d0 = 1;
    8:  d0 = 10;
    9:  d0 = 9;
    10: d0 = 3;
    11: d0 = 14;
    12: d0 = 5;
    13: d0 = 0;
    14: d0 = 12;
    15: d0 = 7;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d1 = 1;
    1:  d1 = 15;
    2:  d1 = 13;
    3:  d1 = 8;
    4:  d1 = 10;
    5:  d1 = 3;
    6:  d1 = 7;
    7:  d1 = 4;
    8:  d1 = 12;
    9:  d1 = 5;
    10: d1 = 6;
    11: d1 = 11;
    12: d1 = 0;
    13: d1 = 14;
    14: d1 = 9;
    15: d1 = 2;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d2 = 7;
    1:  d2 = 11;
    2:  d2 = 4;
    3:  d2 = 1;
    4:  d2 = 9;
    5:  d2 = 12;
    6:  d2 = 14;
    7:  d2 = 2;
    8:  d2 = 0;
    9:  d2 = 6;
    10: d2 = 10;
    11: d2 = 13;
    12: d2 = 15;
    13: d2 = 3;
    14: d2 = 5;
    15: d2 = 8;
endcase
end

always @(addr) begin
case (addr[2:5])
    0:  d3 = 2;
    1:  d3 = 1;
    2:  d3 = 14;
    3:  d3 = 7;
    4:  d3 = 4;
    5:  d3 = 10;
    6:  d3 = 8;
    7:  d3 = 13;
    8:  d3 = 15;
    9:  d3 = 12;
    10: d3 = 9;
    11: d3 = 0;
    12: d3 = 3;
    13: d3 = 5;
    14: d3 = 6;
    15: d3 = 11;
endcase
end

// mux the first two together in F5 muxes
MUXF5 s10 ( .I0(d0[1]), .I1(d1[1]), .S(addr[6]), .O(da[1]) );
MUXF5 s11 ( .I0(d0[2]), .I1(d1[2]), .S(addr[6]), .O(da[2]) );
MUXF5 s12 ( .I0(d0[3]), .I1(d1[3]), .S(addr[6]), .O(da[3]) );
MUXF5 s13 ( .I0(d0[4]), .I1(d1[4]), .S(addr[6]), .O(da[4]) );

// mux the second two together in F5 muxes
MUXF5 s20 ( .I0(d2[1]), .I1(d3[1]), .S(addr[6]), .O(db[1]) );
MUXF5 s21 ( .I0(d2[2]), .I1(d3[2]), .S(addr[6]), .O(db[2]) );
MUXF5 s22 ( .I0(d2[3]), .I1(d3[3]), .S(addr[6]), .O(db[3]) );
MUXF5 s23 ( .I0(d2[4]), .I1(d3[4]), .S(addr[6]), .O(db[4]) );

endmodule


/* end of Sboxes */


