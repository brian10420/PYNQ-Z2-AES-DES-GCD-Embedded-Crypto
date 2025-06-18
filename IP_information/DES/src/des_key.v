/*######################################################################
--    								         --
--  Module               : DES_KEY.v					 --
--  Last Update          : 08/01/2001					 --
--									 --
--  Description          : One round of DES key scheduler		 --
--								  	 --
--  Designers            : Steve Trimberger & Vikram Pasham	         --
--  Company              : Xilinx, Inc.					 --
--									 --
--  Disclaimer  : THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY    --
--                WHATSOEVER AND XILINX SPECIFICALLY DISCLAIMS ANY       --
--                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR     --
--                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.         --
--                THEY ARE ONLY INTENDED TO BE USED BY XILINX            --
--                CUSTOMERS, AND WITHIN XILINX DEVICES.                  --
--                                                                       --
--                Copyright (c) 2000 Xilinx, Inc.                        --
--                All rights reserved                                    --
--									 --
--									 --
--#######################################################################*/


`include "des_const.v"
// Include Synplify Virtex-II/ Virtex-E library
// `include "virtex2.v"
//`include "virtexe.v"



////////////////////////////////////////////////////////////////////////
//
// One round of DES key scheduler
//
////////////////////////////////////////////////////////////////////////

module des_key(clk, key_in_l, key_in_r, key_out_l_reg, key_out_r_reg, compressed_key, decrypt);
parameter cs=0;

input clk;
input [1:28] key_in_l;          // left  28-bit key input for this round
input [1:28] key_in_r;          // right 28-bit key input for this round
input decrypt;                  // shift right if decrypt=1, else left
output [1:28] key_out_l_reg;    // circularly shifted key_in_l
output [1:28] key_out_r_reg;    // circularly shifted key_in_r
output [1:48] compressed_key;   // shifted key after compression permutation

wire [1:56] key_out_lr;         // Concatenated key_out_l + key_out_r
wire [1:56] key_out_lr_reg;     // Concatenated key_out_l + key_out_r reg

wire shift_1bit;                // Shift bit
wire no_shift;

wire [1:28] key_out_l, key_out_r;
reg [1:28] key_out_l_reg,       // Register for holding intermediate key
           key_out_r_reg;       //   scheduler results
wire [1:28] key_out_l_reg1,       // Delay to accommodate deeper pipe in F
           key_out_r_reg1;       //


wire [1:4] srl_addr;

assign shift_1bit = (cs==`S1 || cs==`S2 || cs==`S9 || cs==`S16) ? 1 : 0 ;
assign no_shift = ( decrypt && cs==`S1 );

assign key_out_l =
  (no_shift) ? key_in_l :
    (decrypt) ? (shift_1bit) ? {key_in_l[28],key_in_l[1:27]} : 
     {key_in_l[27:28],key_in_l[1:26]} : 
     (shift_1bit) ? {key_in_l[2:28],key_in_l[1] } : 
     {key_in_l[3:28], key_in_l[1:2] } ;

assign key_out_r =
  (no_shift) ? key_in_r :
    (decrypt) ? (shift_1bit) ? {key_in_r[28],key_in_r[1:27]} : 
    {key_in_r[27:28],key_in_r[1:26]} :
    (shift_1bit) ? {key_in_r[2:28],key_in_r[1] } : 
    {key_in_r[3:28], key_in_r[1:2] } ;


//// Compress shifted left and right keys ////
assign key_out_lr = {key_out_l, key_out_r};


// Instantiate SRL16 for shift operations //

assign srl_addr = 4'b0001;

SRL16 shift_left1 (.CLK(clk), .D(key_out_l[1]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[1]));

SRL16 shift_left2 (.CLK(clk), .D(key_out_l[2]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[2]));

SRL16 shift_left3 (.CLK(clk), .D(key_out_l[3]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[3]));

SRL16 shift_left4 (.CLK(clk), .D(key_out_l[4]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[4]));

SRL16 shift_left5 (.CLK(clk), .D(key_out_l[5]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[5]));

SRL16 shift_left6 (.CLK(clk), .D(key_out_l[6]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[6]));

SRL16 shift_left7 (.CLK(clk), .D(key_out_l[7]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[7]));

SRL16 shift_left8 (.CLK(clk), .D(key_out_l[8]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[8]));

SRL16 shift_left9 (.CLK(clk), .D(key_out_l[9]), .A0(srl_addr[4]), 
                   .A1(srl_addr[3]), .A2(srl_addr[2]), 
                   .A3(srl_addr[1]), .Q(key_out_l_reg1[9]));

SRL16 shift_left10 (.CLK(clk), .D(key_out_l[10]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[10]));

SRL16 shift_left11 (.CLK(clk), .D(key_out_l[11]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[11]));

SRL16 shift_left12 (.CLK(clk), .D(key_out_l[12]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[12]));

SRL16 shift_left13 (.CLK(clk), .D(key_out_l[13]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[13]));

SRL16 shift_left14 (.CLK(clk), .D(key_out_l[14]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[14]));

SRL16 shift_left15 (.CLK(clk), .D(key_out_l[15]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[15]));

SRL16 shift_left16 (.CLK(clk), .D(key_out_l[16]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[16]));

SRL16 shift_left17 (.CLK(clk), .D(key_out_l[17]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[17]));

SRL16 shift_left18 (.CLK(clk), .D(key_out_l[18]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[18]));

SRL16 shift_left19 (.CLK(clk), .D(key_out_l[19]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[19]));

SRL16 shift_left20 (.CLK(clk), .D(key_out_l[20]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[20]));


SRL16 shift_left21 (.CLK(clk), .D(key_out_l[21]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[21]));

SRL16 shift_left22 (.CLK(clk), .D(key_out_l[22]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[22]));

SRL16 shift_left23 (.CLK(clk), .D(key_out_l[23]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[23]));

SRL16 shift_left24 (.CLK(clk), .D(key_out_l[24]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[24]));

SRL16 shift_left25 (.CLK(clk), .D(key_out_l[25]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[25]));

SRL16 shift_left26 (.CLK(clk), .D(key_out_l[26]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[26]));

SRL16 shift_left27 (.CLK(clk), .D(key_out_l[27]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[27]));

SRL16 shift_left28 (.CLK(clk), .D(key_out_l[28]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]),
                    .A3(srl_addr[1]), .Q(key_out_l_reg1[28]));


SRL16 shift_right1 (.CLK(clk), .D(key_out_r[1]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[1]));

SRL16 shift_right2 (.CLK(clk), .D(key_out_r[2]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[2]));

SRL16 shift_right3 (.CLK(clk), .D(key_out_r[3]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[3]));

SRL16 shift_right4 (.CLK(clk), .D(key_out_r[4]), .A0(srl_addr[4]),
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[4]));

SRL16 shift_right5 (.CLK(clk), .D(key_out_r[5]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[5]));

SRL16 shift_right6 (.CLK(clk), .D(key_out_r[6]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[6]));

SRL16 shift_right7 (.CLK(clk), .D(key_out_r[7]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[7]));

SRL16 shift_right8 (.CLK(clk), .D(key_out_r[8]), .A0(srl_addr[4]),
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[8]));

SRL16 shift_right9 (.CLK(clk), .D(key_out_r[9]), .A0(srl_addr[4]), 
                    .A1(srl_addr[3]), .A2(srl_addr[2]), 
                    .A3(srl_addr[1]), .Q(key_out_r_reg1[9]));

SRL16 shift_right10 (.CLK(clk), .D(key_out_r[10]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[10]));

SRL16 shift_right11 (.CLK(clk), .D(key_out_r[11]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[11]));

SRL16 shift_right12 (.CLK(clk), .D(key_out_r[12]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[12]));

SRL16 shift_right13 (.CLK(clk), .D(key_out_r[13]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), 	.A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[13]));

SRL16 shift_right14 (.CLK(clk), .D(key_out_r[14]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[14]));

SRL16 shift_right15 (.CLK(clk), .D(key_out_r[15]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[15]));

SRL16 shift_right16 (.CLK(clk), .D(key_out_r[16]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[16]));

SRL16 shift_right17 (.CLK(clk), .D(key_out_r[17]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[17]));

SRL16 shift_right18 (.CLK(clk), .D(key_out_r[18]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[18]));

SRL16 shift_right19 (.CLK(clk), .D(key_out_r[19]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[19]));

SRL16 shift_right20 (.CLK(clk), .D(key_out_r[20]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[20]));


SRL16 shift_right21 (.CLK(clk), .D(key_out_r[21]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[21]));

SRL16 shift_right22 (.CLK(clk), .D(key_out_r[22]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[22]));

SRL16 shift_right23 (.CLK(clk), .D(key_out_r[23]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[23]));

SRL16 shift_right24 (.CLK(clk), .D(key_out_r[24]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[24]));

SRL16 shift_right25 (.CLK(clk), .D(key_out_r[25]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[25]));

SRL16 shift_right26 (.CLK(clk), .D(key_out_r[26]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[26]));

SRL16 shift_right27 (.CLK(clk), .D(key_out_r[27]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[27]));

SRL16 shift_right28 (.CLK(clk), .D(key_out_r[28]), .A0(srl_addr[4]), 
                     .A1(srl_addr[3]), .A2(srl_addr[2]), 
                     .A3(srl_addr[1]), .Q(key_out_r_reg1[28]));



//// Register output of key scheduler ////
always @( posedge clk )
begin
    key_out_l_reg <= key_out_l_reg1;
    key_out_r_reg <= key_out_r_reg1;
end



///  new, pipelined version
assign key_out_lr_reg = {key_out_l, key_out_r};

assign compressed_key = {
    key_out_lr_reg[14], key_out_lr_reg[17], key_out_lr_reg[11], 
    key_out_lr_reg[24], key_out_lr_reg[ 1], key_out_lr_reg[ 5], 
    key_out_lr_reg[ 3], key_out_lr_reg[28], key_out_lr_reg[15], 
    key_out_lr_reg[ 6], key_out_lr_reg[21], key_out_lr_reg[10],
    key_out_lr_reg[23], key_out_lr_reg[19], key_out_lr_reg[12], 
    key_out_lr_reg[ 4], key_out_lr_reg[26], key_out_lr_reg[ 8], 
    key_out_lr_reg[16], key_out_lr_reg[ 7], key_out_lr_reg[27], 
    key_out_lr_reg[20], key_out_lr_reg[13], key_out_lr_reg[ 2],
    key_out_lr_reg[41], key_out_lr_reg[52], key_out_lr_reg[31], 
    key_out_lr_reg[37], key_out_lr_reg[47], key_out_lr_reg[55], 
    key_out_lr_reg[30], key_out_lr_reg[40], key_out_lr_reg[51], 
    key_out_lr_reg[45], key_out_lr_reg[33], key_out_lr_reg[48],
    key_out_lr_reg[44], key_out_lr_reg[49], key_out_lr_reg[39], 
    key_out_lr_reg[56], key_out_lr_reg[34], key_out_lr_reg[53], 
    key_out_lr_reg[46], key_out_lr_reg[42], key_out_lr_reg[50], 
    key_out_lr_reg[36], key_out_lr_reg[29], key_out_lr_reg[32]
};
endmodule // des_key //




