
/*##########################################################################
--
--                                                                       --
--  Module      : DES.v                                                  --
--  Last Update : 08/01/2001
--                                                                       --
--  Description : DES Top level module                                   --
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

///////////////////////////////////////////////////////////////////////////////
// Top-level module: Single DES Pipelined encryptor/decryptor
//                   48 cycle latency on encryption/decryption
///////////////////////////////////////////////////////////////////////////////




`include "des_const.v"


module des(reset, clk, data_bus, e_data_rdy, key, decrypt, data_out, d_data_rdy);
input reset;
input [1:64] data_bus;      // input bus for carrying en/decrypted data.
input e_data_rdy;           // Signal indicates data bus is valid data
input [1:64] key;           // Encryption/decryption key
input decrypt;              // 0 = encrypt; 1 = decrypt
input clk;                  // Clock
output [1:64] data_out;     // output bus carrying en/decrypted data.
output d_data_rdy;          // 1=valid data is on data bus (==e_data delayed)

//reg d_data_rdy;             // 1=en/decrypted data is on data_out

reg [1:64] data_bus_reg;       // input data bus
reg [1:64] key_reg;
// Intermediate states in the en(de)cryption
wire [1:28] perm_key_l, perm_key_r;       // Permuted key
wire [1:32] iperm_data_l, iperm_data_r;   // initially permuted encrypted data
wire [1:64] f_out_rl;                     // Final F output
wire [1:64] reverse_perm;   // Output of reverse permutation step 

// wires between pipeline blocks -- KEYS
wire [1:28] key1_l, key1_r;
wire [1:28] key2_l, key2_r;
wire [1:28] key3_l, key3_r;
wire [1:28] key4_l, key4_r;
wire [1:28] key5_l, key5_r;
wire [1:28] key6_l, key6_r;
wire [1:28] key7_l, key7_r;
wire [1:28] key8_l, key8_r;
wire [1:28] key9_l, key9_r;
wire [1:28] key10_l, key10_r;
wire [1:28] key11_l, key11_r;
wire [1:28] key12_l, key12_r;
wire [1:28] key13_l, key13_r;
wire [1:28] key14_l, key14_r;
wire [1:28] key15_l, key15_r;
wire [1:28] key16_l, key16_r;
wire [1:48] key1, key2, key3, key4, key5, key6, key7, key8;
wire [1:48] key9, key10, key11, key12, key13, key14, key15, key16;

// wires between pipeline blocks -- DATA
wire [1:32] f1_l, f1_r;
wire [1:32] f2_l, f2_r;
wire [1:32] f3_l, f3_r;
wire [1:32] f4_l, f4_r;
wire [1:32] f5_l, f5_r;
wire [1:32] f6_l, f6_r;
wire [1:32] f7_l, f7_r;
wire [1:32] f8_l, f8_r;
wire [1:32] f9_l, f9_r;
wire [1:32] f10_l, f10_r;
wire [1:32] f11_l, f11_r;
wire [1:32] f12_l, f12_r;
wire [1:32] f13_l, f13_r;
wire [1:32] f14_l, f14_r;
wire [1:32] f15_l, f15_r;
wire [1:32] f16_l, f16_r;

// encrypt/decrypt and data_valid flags
// triple since we tripled the pipeline inside F and KEY
     
wire decrypt1;
wire decrypt2;
wire decrypt3;
wire decrypt4;
wire decrypt5;
wire decrypt6;
wire decrypt7;
wire decrypt8;
wire decrypt9;
wire decrypt10;
wire decrypt11;
wire decrypt12;
wire decrypt13;
wire decrypt14;
wire decrypt15;
wire decrypt16;

 
reg [1:3] decrypt1_reg;
reg [1:3] decrypt2_reg;
reg [1:3] decrypt3_reg;
reg [1:3] decrypt4_reg;
reg [1:3] decrypt5_reg;
reg [1:3] decrypt6_reg;
reg [1:3] decrypt7_reg;
reg [1:3] decrypt8_reg;
reg [1:3] decrypt9_reg;
reg [1:3] decrypt10_reg;
reg [1:3] decrypt11_reg;
reg [1:3] decrypt12_reg;
reg [1:3] decrypt13_reg;
reg [1:3] decrypt14_reg;
reg [1:3] decrypt15_reg;
reg [1:3] decrypt16_reg;

reg decrypt_reg;
reg e_data_rdy_reg;


integer count;


always @(posedge reset or  posedge clk )
begin
	if(reset)
	 begin
	  data_bus_reg <= 64'b0;
	  key_reg <= 64'b0;
	  e_data_rdy_reg <= 1'b0;
	  decrypt_reg <= 1'b0;
	 end
        else
	 begin
	  data_bus_reg <= data_bus;	  
	  key_reg <= key;
	  e_data_rdy_reg <= e_data_rdy;
	  decrypt_reg <= decrypt;
	 end
end


always @(posedge reset or posedge clk)
begin
	if(reset) begin
	  count <= 0;
	end
	else begin
	  if(e_data_rdy) begin
	    count <= 1;  // Start counting from 1
	  end
	  else if(count > 0 && count < 48) begin
	    count <= count + 1;
	  end
	  else if(count >= 48) begin
	    count <= 0;  // Reset after completion
	  end
	end
end

assign d_data_rdy = (count == 48);

always @ (posedge reset or posedge clk)
begin
  if(reset)
   begin 
   decrypt1_reg <= 3'b0;
   decrypt2_reg <= 3'b0;
   decrypt3_reg <= 3'b0;
   decrypt4_reg <= 3'b0;
   decrypt5_reg <= 3'b0;
   decrypt6_reg <= 3'b0;
   decrypt7_reg <= 3'b0;
   decrypt8_reg <= 3'b0;
   decrypt9_reg <= 3'b0;
   decrypt10_reg <= 3'b0;
   decrypt11_reg <= 3'b0;
   decrypt12_reg <= 3'b0;
   decrypt13_reg <= 3'b0;
   decrypt14_reg <= 3'b0;
   decrypt15_reg <= 3'b0;
   end
  else
   begin 
   decrypt1_reg <= {decrypt_reg, decrypt1_reg[1:2]};
   decrypt2_reg <= {decrypt1_reg[3], decrypt2_reg[1:2]};
   decrypt3_reg <= {decrypt2_reg[3], decrypt3_reg[1:2]};
   decrypt4_reg <= {decrypt3_reg[3], decrypt4_reg[1:2]};   
   decrypt5_reg <= {decrypt4_reg[3], decrypt5_reg[1:2]};
   decrypt6_reg <= {decrypt5_reg[3], decrypt6_reg[1:2]};
   decrypt7_reg <= {decrypt6_reg[3], decrypt7_reg[1:2]};
   decrypt8_reg <= {decrypt7_reg[3], decrypt8_reg[1:2]};
   decrypt9_reg <= {decrypt8_reg[3], decrypt9_reg[1:2]};
   decrypt10_reg <= {decrypt9_reg[3], decrypt10_reg[1:2]};
   decrypt11_reg <= {decrypt10_reg[3], decrypt1_reg[1:2]};
   decrypt12_reg <= {decrypt11_reg[3], decrypt2_reg[1:2]};
   decrypt13_reg <= {decrypt12_reg[3], decrypt3_reg[1:2]};
   decrypt14_reg <= {decrypt13_reg[3], decrypt4_reg[1:2]};   
   decrypt15_reg <= {decrypt14_reg[3], decrypt5_reg[1:2]};
   end
end 

      
   
assign  decrypt1 = decrypt1_reg[3];
assign  decrypt2 = decrypt2_reg[3];
assign  decrypt3 = decrypt3_reg[3];
assign  decrypt4 = decrypt4_reg[3];
assign  decrypt5 = decrypt5_reg[3];
assign  decrypt6 = decrypt6_reg[3];
assign  decrypt7 = decrypt7_reg[3];
assign  decrypt8 = decrypt8_reg[3];
assign  decrypt9 = decrypt9_reg[3];
assign  decrypt10 = decrypt10_reg[3];
assign  decrypt11 = decrypt11_reg[3];
assign  decrypt12 = decrypt12_reg[3];
assign  decrypt13 = decrypt13_reg[3];
assign  decrypt14 = decrypt14_reg[3];
assign  decrypt15 = decrypt15_reg[3];





//////////////////////////////////////////////////////////////
//// Perform initial permutation on key. Permuted key is 56 bits. ////
//////////////////////////////////////////////////////////////
assign perm_key_l = {
    key_reg[57], key_reg[49], key_reg[41], key_reg[33],
    key_reg[25], key_reg[17], key_reg[9],  key_reg[1],
    key_reg[58], key_reg[50], key_reg[42], key_reg[34],
    key_reg[26], key_reg[18], key_reg[10], key_reg[2],
    key_reg[59], key_reg[51], key_reg[43], key_reg[35],
    key_reg[27], key_reg[19], key_reg[11], key_reg[3],
    key_reg[60], key_reg[52], key_reg[44], key_reg[36]
};
assign perm_key_r = {
    key_reg[63], key_reg[55], key_reg[47], key_reg[39],
    key_reg[31], key_reg[23], key_reg[15], key_reg[7],
    key_reg[62], key_reg[54], key_reg[46], key_reg[38],
    key_reg[30], key_reg[22], key_reg[14], key_reg[6],
    key_reg[61], key_reg[53], key_reg[45], key_reg[37],
    key_reg[29], key_reg[21], key_reg[13], key_reg[5],
    key_reg[28], key_reg[20], key_reg[12], key_reg[4]
};

//////////////////////////////////////////////////////////////
//// Instantiate key shift modules ////
//////////////////////////////////////////////////////////////
des_key #(`S1) Ides_key01(clk, perm_key_l, perm_key_r, key1_l, key1_r, key1, decrypt_reg);
des_key #(`S2) Ides_key02(clk, key1_l, key1_r, key2_l, key2_r, key2, decrypt1);
des_key #(`S3) Ides_key03(clk, key2_l, key2_r, key3_l, key3_r, key3, decrypt2);
des_key #(`S4) Ides_key04(clk, key3_l, key3_r, key4_l, key4_r, key4, decrypt3);
des_key #(`S5) Ides_key05(clk, key4_l, key4_r, key5_l, key5_r, key5, decrypt4);
des_key #(`S6) Ides_key06(clk, key5_l, key5_r, key6_l, key6_r, key6, decrypt5);
des_key #(`S7) Ides_key07(clk, key6_l, key6_r, key7_l, key7_r, key7, decrypt6);
des_key #(`S8) Ides_key08(clk, key7_l, key7_r, key8_l, key8_r, key8, decrypt7);
des_key #(`S9) Ides_key09(clk, key8_l, key8_r, key9_l, key9_r, key9, decrypt8);
des_key #(`S10) Ides_key10(clk, key9_l, key9_r, key10_l, key10_r, key10, decrypt9);
des_key #(`S11) Ides_key11(clk, key10_l, key10_r, key11_l, key11_r, key11, decrypt10);
des_key #(`S12) Ides_key12(clk, key11_l, key11_r, key12_l, key12_r, key12, decrypt11);
des_key #(`S13) Ides_key13(clk, key12_l, key12_r, key13_l, key13_r, key13, decrypt12);
des_key #(`S14) Ides_key14(clk, key13_l, key13_r, key14_l, key14_r, key14, decrypt13);
des_key #(`S15) Ides_key15(clk, key14_l, key14_r, key15_l, key15_r, key15, decrypt14);
des_key #(`S16) Ides_key16(clk, key15_l, key15_r, key16_l, key16_r, key16, decrypt15);

//////////////////////////////////////////////////////////////
//// Perform initial permutation on encrypted data ////
//////////////////////////////////////////////////////////////
assign iperm_data_l = {
    data_bus_reg[58], data_bus_reg[50], data_bus_reg[42], data_bus_reg[34],
    data_bus_reg[26], data_bus_reg[18], data_bus_reg[10], data_bus_reg[2],
    data_bus_reg[60], data_bus_reg[52], data_bus_reg[44], data_bus_reg[36],
    data_bus_reg[28], data_bus_reg[20], data_bus_reg[12], data_bus_reg[4],
    data_bus_reg[62], data_bus_reg[54], data_bus_reg[46], data_bus_reg[38],
    data_bus_reg[30], data_bus_reg[22], data_bus_reg[14], data_bus_reg[6],
    data_bus_reg[64], data_bus_reg[56], data_bus_reg[48], data_bus_reg[40],
    data_bus_reg[32], data_bus_reg[24], data_bus_reg[16], data_bus_reg[8]
};
assign iperm_data_r = {
    data_bus_reg[57], data_bus_reg[49], data_bus_reg[41], data_bus_reg[33],
    data_bus_reg[25], data_bus_reg[17], data_bus_reg[9],  data_bus_reg[1],
    data_bus_reg[59], data_bus_reg[51], data_bus_reg[43], data_bus_reg[35],
    data_bus_reg[27], data_bus_reg[19], data_bus_reg[11], data_bus_reg[3],
    data_bus_reg[61], data_bus_reg[53], data_bus_reg[45], data_bus_reg[37],
    data_bus_reg[29], data_bus_reg[21], data_bus_reg[13], data_bus_reg[5],
    data_bus_reg[63], data_bus_reg[55], data_bus_reg[47], data_bus_reg[39],
    data_bus_reg[31], data_bus_reg[23], data_bus_reg[15], data_bus_reg[7]
};

//////////////////////////////////////////////////////////////
//// Instantiate f function modules ////
//////////////////////////////////////////////////////////////
des_f Ides_f01(reset, clk, iperm_data_l, iperm_data_r, f1_l, f1_r, key1);
des_f Ides_f02(reset, clk, f1_l, f1_r, f2_l, f2_r, key2);
des_f Ides_f03(reset, clk, f2_l, f2_r, f3_l, f3_r, key3);
des_f Ides_f04(reset, clk, f3_l, f3_r, f4_l, f4_r, key4);
des_f Ides_f05(reset, clk, f4_l, f4_r, f5_l, f5_r, key5);
des_f Ides_f06(reset, clk, f5_l, f5_r, f6_l, f6_r, key6);
des_f Ides_f07(reset, clk, f6_l, f6_r, f7_l, f7_r, key7);
des_f Ides_f08(reset, clk, f7_l, f7_r, f8_l, f8_r, key8);
des_f Ides_f09(reset, clk, f8_l, f8_r, f9_l, f9_r, key9);
des_f Ides_f10(reset, clk, f9_l, f9_r, f10_l, f10_r, key10);
des_f Ides_f11(reset, clk, f10_l, f10_r, f11_l, f11_r, key11);
des_f Ides_f12(reset, clk, f11_l, f11_r, f12_l, f12_r, key12);
des_f Ides_f13(reset, clk, f12_l, f12_r, f13_l, f13_r, key13);
des_f Ides_f14(reset, clk, f13_l, f13_r, f14_l, f14_r, key14);
des_f Ides_f15(reset, clk, f14_l, f14_r, f15_l, f15_r, key15);
des_f Ides_f16(reset, clk, f15_l, f15_r, f16_l, f16_r, key16);

//////////////////////////////////////////////////////////////
//// Swap final left and right results for reverse permutation ////
//////////////////////////////////////////////////////////////
assign f_out_rl = { f16_r, f16_l};

//////////////////////////////////////////////////////////////
//// Reverse permutaion ////
//////////////////////////////////////////////////////////////
assign reverse_perm = {
    f_out_rl[40], f_out_rl[ 8], f_out_rl[48], f_out_rl[16],
    f_out_rl[56], f_out_rl[24], f_out_rl[64], f_out_rl[32],
    f_out_rl[39], f_out_rl[ 7], f_out_rl[47], f_out_rl[15],
    f_out_rl[55], f_out_rl[23], f_out_rl[63], f_out_rl[31],
    f_out_rl[38], f_out_rl[ 6], f_out_rl[46], f_out_rl[14],
    f_out_rl[54], f_out_rl[22], f_out_rl[62], f_out_rl[30],
    f_out_rl[37], f_out_rl[ 5], f_out_rl[45], f_out_rl[13],
    f_out_rl[53], f_out_rl[21], f_out_rl[61], f_out_rl[29],
    f_out_rl[36], f_out_rl[ 4], f_out_rl[44], f_out_rl[12],
    f_out_rl[52], f_out_rl[20], f_out_rl[60], f_out_rl[28],
    f_out_rl[35], f_out_rl[ 3], f_out_rl[43], f_out_rl[11],
    f_out_rl[51], f_out_rl[19], f_out_rl[59], f_out_rl[27],
    f_out_rl[34], f_out_rl[ 2], f_out_rl[42], f_out_rl[10],
    f_out_rl[50], f_out_rl[18], f_out_rl[58], f_out_rl[26],
    f_out_rl[33], f_out_rl[ 1], f_out_rl[41], f_out_rl[ 9],
    f_out_rl[49], f_out_rl[17], f_out_rl[57], f_out_rl[25]
};


//////////////////////////////////////////////////////////////
//// Place decrypted data on data bus  ////
//////////////////////////////////////////////////////////////
assign data_out = reverse_perm;

endmodule // des //















