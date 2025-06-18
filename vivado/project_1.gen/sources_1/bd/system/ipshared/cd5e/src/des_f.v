

/*##########################################################################
--
--                                                                       --
--  Module      : DES_F.v                                          	 --
--  Last Update : 08/01/2001
--                                                                       --
--  Description : One round of DES F funciton                            --
--                                                                       --
--                                                                       --
--  Designers   : Steve Trimberger & Vikram Pasham                       --
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

/////////////////////////////////////////////////////////////////
//
// One round of DES F function
//
/////////////////////////////////////////////////////////////////

module des_f(reset, clk, f_in_l, f_in_r, f_out_l_reg, f_out_r_reg, compressed_key);
input reset;

input clk;
input  [1:32] f_in_l;           // left  32 input bits for this round
input  [1:32] f_in_r;           // right 32 input bits for this round
input  [1:48] compressed_key;   // 48-bit key for round n

output [1:32] f_out_l_reg;      // left  32 output bits from this round
output [1:32] f_out_r_reg;      // right 32 output bits from this round

wire [1:48] expanded_out;       // expanded f_in_r
wire [1:48] xor_out_prereg;     // xor'd expanded_out and compressed_key
wire [1:48] xor_out;            // registered xor_out [PIPE]
reg [1:48] xor_out_reg;
reg [1:32] sbox_out;            // output of sbox substitution
wire [1:32] pbox_out;           // output of pbox permutation
wire [1:32] f_out_l, f_out_r;
reg [1:32] f_out_l_reg, f_out_r_reg;    // Register for f result [PIPE]
reg [1:32] f_in_l_reg1, f_in_r_reg1;
reg [1:32] f_in_l_reg, f_in_r_reg;

// Outputs from individual Sboxes
wire [1:4] sb1outa, sb1outb;
wire [1:4] sb2outa, sb2outb;
wire [1:4] sb3outa, sb3outb;
wire [1:4] sb4outa, sb4outb;
wire [1:4] sb5outa, sb5outb;
wire [1:4] sb6outa, sb6outb;
wire [1:4] sb7outa, sb7outb;
wire [1:4] sb8outa, sb8outb;

reg  [1:4] sb1outa_reg, sb1outb_reg;
reg  [1:4] sb2outa_reg, sb2outb_reg;
reg  [1:4] sb3outa_reg, sb3outb_reg;
reg  [1:4] sb4outa_reg, sb4outb_reg;
reg  [1:4] sb5outa_reg, sb5outb_reg;
reg  [1:4] sb6outa_reg, sb6outb_reg;
reg  [1:4] sb7outa_reg, sb7outb_reg;
reg  [1:4] sb8outa_reg, sb8outb_reg;


//// Expand right half data from 32 to 48 bits ////
assign expanded_out = {
    f_in_r[32], f_in_r[1], f_in_r[2], f_in_r[3],
    f_in_r[4],  f_in_r[5], f_in_r[4], f_in_r[5],
    f_in_r[6],  f_in_r[7], f_in_r[8], f_in_r[9],
    f_in_r[8],  f_in_r[9], f_in_r[10],f_in_r[11],
    f_in_r[12], f_in_r[13],f_in_r[12],f_in_r[13],
    f_in_r[14], f_in_r[15],f_in_r[16],f_in_r[17],
    f_in_r[16], f_in_r[17],f_in_r[18],f_in_r[19],
    f_in_r[20], f_in_r[21],f_in_r[20],f_in_r[21],
    f_in_r[22], f_in_r[23],f_in_r[24],f_in_r[25],
    f_in_r[24], f_in_r[25],f_in_r[26],f_in_r[27],
    f_in_r[28], f_in_r[29],f_in_r[28],f_in_r[29],
    f_in_r[30], f_in_r[31],f_in_r[32],f_in_r[1]
};

//// xor expaned right half data with key ////
assign xor_out = expanded_out ^ compressed_key;


//////////////register xor_out///////////////////////
always @(posedge reset or  posedge clk )
begin
  if(reset)
  begin
	xor_out_reg <= 48'b0;
  end
  else
  begin
	xor_out_reg <= xor_out;
  end
end

//// s-box substitution ////
SB1 Isb1(xor_out[1:6],   sb1outa, sb1outb);
SB2 Isb2(xor_out[7:12],  sb2outa, sb2outb);
SB3 Isb3(xor_out[13:18], sb3outa, sb3outb);
SB4 Isb4(xor_out[19:24], sb4outa, sb4outb);
SB5 Isb5(xor_out[25:30], sb5outa, sb5outb);
SB6 Isb6(xor_out[31:36], sb6outa, sb6outb);
SB7 Isb7(xor_out[37:42], sb7outa, sb7outb);
SB8 Isb8(xor_out[43:48], sb8outa, sb8outb);

//////////////register sbxouts///////////////////////
always @(posedge reset or  posedge clk ) 
begin 
if(reset)
  begin
     		sb1outa_reg <= 4'b0; 
		sb1outb_reg <= 4'b0;

		sb2outa_reg <= 4'b0;
		sb2outb_reg <= 4'b0;

 		sb3outa_reg <= 4'b0;
		sb3outb_reg <= 4'b0;

		sb4outa_reg <= 4'b0;
		sb4outb_reg <= 4'b0;

		sb5outa_reg <= 4'b0;
		sb5outb_reg <= 4'b0;

		sb6outa_reg <= 4'b0;
		sb6outb_reg <= 4'b0;

		sb7outa_reg <= 4'b0;
		sb7outb_reg <= 4'b0;

		sb8outa_reg <= 4'b0;
		sb8outb_reg <= 4'b0;
  end
else
	begin		
		sb1outa_reg <= sb1outa;
		sb1outb_reg <= sb1outb;

		sb2outa_reg <= sb2outa;
		sb2outb_reg <= sb2outb;

 		sb3outa_reg <= sb3outa;
		sb3outb_reg <= sb3outb;

		sb4outa_reg <= sb4outa;
		sb4outb_reg <= sb4outb;

		sb5outa_reg <= sb5outa;
		sb5outb_reg <= sb5outb;

		sb6outa_reg <= sb6outa;
		sb6outb_reg <= sb6outb;

		sb7outa_reg <= sb7outa;
		sb7outb_reg <= sb7outb;

		sb8outa_reg <= sb8outa;
		sb8outb_reg <= sb8outb;
	end
end		




/* complete the SBOXes, they build 2 F5.  We combine them here (and synth
   should lump this with the xor with f_in_l into a single 4LUT) */

always @(sb1outa_reg or sb1outb_reg or xor_out_reg) begin
  if(xor_out_reg[1]) sbox_out[1:4] = sb1outb_reg; 
  else sbox_out[1:4] = sb1outa_reg;
end
always @(sb2outa_reg or sb2outb_reg or xor_out_reg) begin
  if(xor_out_reg[7]) sbox_out[5:8] = sb2outb_reg; 
  else sbox_out[5:8] = sb2outa_reg;
end
always @(sb3outa_reg or sb3outb_reg or xor_out_reg) begin
  if(xor_out_reg[13]) sbox_out[9:12] = sb3outb_reg; 
  else sbox_out[9:12] = sb3outa_reg;
end
always @(sb4outa_reg or sb4outb_reg or xor_out_reg) begin
  if(xor_out_reg[19]) sbox_out[13:16] = sb4outb_reg; 
  else sbox_out[13:16] = sb4outa_reg;
end
always @(sb5outa_reg or sb5outb_reg or xor_out_reg) begin
  if(xor_out_reg[25]) sbox_out[17:20] = sb5outb_reg; 
  else sbox_out[17:20] = sb5outa_reg;
end
always @(sb6outa_reg or sb6outb_reg or xor_out_reg) begin
  if(xor_out_reg[31]) sbox_out[21:24] = sb6outb_reg; 
  else sbox_out[21:24] = sb6outa_reg;
end
always @(sb7outa_reg or sb7outb_reg or xor_out_reg) begin
  if(xor_out_reg[37]) sbox_out[25:28] = sb7outb_reg; 
  else sbox_out[25:28] = sb7outa_reg;
end
always @(sb8outa_reg or sb8outb_reg or xor_out_reg) begin
  if(xor_out_reg[43]) sbox_out[29:32] = sb8outb_reg; 
  else sbox_out[29:32] = sb8outa_reg;
end


//// P-box permutation ////
assign pbox_out = {
    sbox_out[16], sbox_out[ 7], sbox_out[20], sbox_out[21],
    sbox_out[29], sbox_out[12], sbox_out[28], sbox_out[17],
    sbox_out[ 1], sbox_out[15], sbox_out[23], sbox_out[26],
    sbox_out[ 5], sbox_out[18], sbox_out[31], sbox_out[10],
    sbox_out[ 2], sbox_out[ 8], sbox_out[24], sbox_out[14],
    sbox_out[32], sbox_out[27], sbox_out[ 3], sbox_out[ 9],
    sbox_out[19], sbox_out[13], sbox_out[30], sbox_out[ 6],
    sbox_out[22], sbox_out[11], sbox_out[ 4], sbox_out[25]};

//// Generate outputs ////

always @(posedge reset or posedge clk)
begin
   if(reset)
     begin
	f_in_l_reg <= 32'b0;
	f_in_r_reg <= 32'b0;
	
	f_in_l_reg1 <= 32'b0;
	f_in_r_reg1 <= 32'b0;
     end
   else
     begin	
        f_in_l_reg1 <= f_in_l_reg;
        f_in_r_reg1 <= f_in_r_reg;

    	f_in_l_reg <= f_in_l;
	f_in_r_reg <= f_in_r;

     end
end

assign f_out_l = f_in_r_reg1;
assign f_out_r = pbox_out ^ f_in_l_reg1;


//// Register outputs of f function module ////
always @(posedge reset or  posedge clk )
begin

 if(reset)
   begin
       f_out_l_reg <= 32'b0;
       f_out_r_reg <=  32'b0;
   end
 else
   begin
       f_out_l_reg <= f_out_l;
       f_out_r_reg <= f_out_r;
   end
 end

endmodule // f //




