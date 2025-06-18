
/*##########################################################################
--
--                                                                       --
--  Module      : DES_CONST.v                                            --
--  Last Update : 08/01/2001
--                                                                       --
--  Description : Key Schedule constants for 16 rounds                   --
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
--########################################################################*/



///////////////////////////////////////////////////////////////////////////
// Decryptor round definitions.
///////////////////////////////////////////////////////////////////////////
`define S1		5'b00001	// 1st  round of DES of nth pass
`define S2		5'b00010	// 2nd  round of DES
`define S3		5'b00011	// 3rd  round of DES
`define S4		5'b00100	// 4th  round of DES
`define S5		5'b00101	// 5th  round of DES
`define S6		5'b00110	// 6th  round of DES
`define S7		5'b00111	// 7th  round of DES
`define S8		5'b01000	// 8th  round of DES
`define S9		5'b01001	// 9th  round of DES
`define S10		5'b01010	// 10th round of DES
`define S11		5'b01011	// 11th round of DES
`define S12		5'b01100	// 12th round of DES
`define S13		5'b01101	// 13th round of DES
`define S14		5'b01110	// 14th round of DES
`define S15		5'b01111	// 15th round of DES
`define S16		5'b10000	// 16th round of DES

