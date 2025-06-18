// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Jun 15 04:42:55 2025
// Host        : DESKTOP-F2ANT3D running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_gcdip_0_0_sim_netlist.v
// Design      : system_gcdip_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_comparator
   (\output_reg[6] ,
    CO,
    DI,
    S,
    \FSM_sequential_nState_reg[0]_i_3 ,
    \FSM_sequential_nState_reg[0]_i_3_0 );
  output [0:0]\output_reg[6] ;
  output [0:0]CO;
  input [3:0]DI;
  input [3:0]S;
  input [3:0]\FSM_sequential_nState_reg[0]_i_3 ;
  input [3:0]\FSM_sequential_nState_reg[0]_i_3_0 ;

  wire [0:0]CO;
  wire [3:0]DI;
  wire [3:0]\FSM_sequential_nState_reg[0]_i_3 ;
  wire [3:0]\FSM_sequential_nState_reg[0]_i_3_0 ;
  wire [3:0]S;
  wire gtOp_carry_n_1;
  wire gtOp_carry_n_2;
  wire gtOp_carry_n_3;
  wire ltOp_carry_n_1;
  wire ltOp_carry_n_2;
  wire ltOp_carry_n_3;
  wire [0:0]\output_reg[6] ;
  wire [3:0]NLW_gtOp_carry_O_UNCONNECTED;
  wire [3:0]NLW_ltOp_carry_O_UNCONNECTED;

  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 gtOp_carry
       (.CI(1'b0),
        .CO({\output_reg[6] ,gtOp_carry_n_1,gtOp_carry_n_2,gtOp_carry_n_3}),
        .CYINIT(1'b0),
        .DI(DI),
        .O(NLW_gtOp_carry_O_UNCONNECTED[3:0]),
        .S(S));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 ltOp_carry
       (.CI(1'b0),
        .CO({CO,ltOp_carry_n_1,ltOp_carry_n_2,ltOp_carry_n_3}),
        .CYINIT(1'b0),
        .DI(\FSM_sequential_nState_reg[0]_i_3 ),
        .O(NLW_ltOp_carry_O_UNCONNECTED[3:0]),
        .S(\FSM_sequential_nState_reg[0]_i_3_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fsm
   (E,
    xsel,
    ysel,
    \FSM_sequential_cState_reg[0]_0 ,
    \FSM_sequential_cState_reg[2]_0 ,
    done_prev_reg,
    start_prev_reg,
    done_prev,
    start_prev,
    Q,
    reg_start_i,
    CO,
    \FSM_sequential_cState_reg[1]_0 ,
    s00_axi_aresetn,
    s00_axi_aclk,
    AR);
  output [0:0]E;
  output xsel;
  output ysel;
  output [0:0]\FSM_sequential_cState_reg[0]_0 ;
  output [0:0]\FSM_sequential_cState_reg[2]_0 ;
  output [0:0]done_prev_reg;
  output start_prev_reg;
  input done_prev;
  input start_prev;
  input [0:0]Q;
  input reg_start_i;
  input [0:0]CO;
  input [0:0]\FSM_sequential_cState_reg[1]_0 ;
  input s00_axi_aresetn;
  input s00_axi_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [0:0]CO;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_cState_reg[0]_0 ;
  wire [0:0]\FSM_sequential_cState_reg[1]_0 ;
  wire [0:0]\FSM_sequential_cState_reg[2]_0 ;
  wire \FSM_sequential_nState_reg[0]_i_2_n_0 ;
  wire \FSM_sequential_nState_reg[0]_i_3_n_0 ;
  wire \FSM_sequential_nState_reg[2]_i_2_n_0 ;
  wire [0:0]Q;
  wire [2:0]cState;
  wire done_prev;
  wire [0:0]done_prev_reg;
  wire enable_reg_i_1_n_0;
  wire enable_reg_i_2_n_0;
  wire [2:0]nState__0;
  wire [2:0]nState__1;
  wire reg_start_i;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire start_prev;
  wire start_prev_reg;
  wire xld_reg_i_1_n_0;
  wire xsel;
  wire xsel_reg_i_1_n_0;
  wire xsel_reg_i_2_n_0;
  wire yld_reg_i_1_n_0;
  wire ysel;
  wire ysel_reg_i_1_n_0;

  (* FSM_ENCODED_STATES = "s1:010,s2:011,init:000,s0:001,s3:100,s5:110,s4:101" *) 
  FDCE \FSM_sequential_cState_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(nState__0[0]),
        .Q(cState[0]));
  (* FSM_ENCODED_STATES = "s1:010,s2:011,init:000,s0:001,s3:100,s5:110,s4:101" *) 
  FDCE \FSM_sequential_cState_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(nState__0[1]),
        .Q(cState[1]));
  (* FSM_ENCODED_STATES = "s1:010,s2:011,init:000,s0:001,s3:100,s5:110,s4:101" *) 
  FDCE \FSM_sequential_cState_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(nState__0[2]),
        .Q(cState[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_nState_reg[0] 
       (.CLR(1'b0),
        .D(nState__1[0]),
        .G(\FSM_sequential_nState_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(nState__0[0]));
  MUXF7 \FSM_sequential_nState_reg[0]_i_1 
       (.I0(\FSM_sequential_nState_reg[0]_i_2_n_0 ),
        .I1(\FSM_sequential_nState_reg[0]_i_3_n_0 ),
        .O(nState__1[0]),
        .S(cState[0]));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_sequential_nState_reg[0]_i_2 
       (.I0(cState[1]),
        .I1(cState[2]),
        .I2(reg_start_i),
        .O(\FSM_sequential_nState_reg[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00FF0800)) 
    \FSM_sequential_nState_reg[0]_i_3 
       (.I0(CO),
        .I1(s00_axi_aresetn),
        .I2(\FSM_sequential_cState_reg[1]_0 ),
        .I3(cState[1]),
        .I4(cState[2]),
        .O(\FSM_sequential_nState_reg[0]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_nState_reg[1] 
       (.CLR(1'b0),
        .D(nState__1[1]),
        .G(\FSM_sequential_nState_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(nState__0[1]));
  LUT6 #(
    .INIT(64'h0000FFFF1FFFFF00)) 
    \FSM_sequential_nState_reg[1]_i_1 
       (.I0(CO),
        .I1(\FSM_sequential_cState_reg[1]_0 ),
        .I2(s00_axi_aresetn),
        .I3(cState[0]),
        .I4(cState[1]),
        .I5(cState[2]),
        .O(nState__1[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_nState_reg[2] 
       (.CLR(1'b0),
        .D(nState__1[2]),
        .G(\FSM_sequential_nState_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(nState__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \FSM_sequential_nState_reg[2]_i_1 
       (.I0(cState[2]),
        .I1(cState[1]),
        .I2(cState[0]),
        .O(nState__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h5DFF)) 
    \FSM_sequential_nState_reg[2]_i_2 
       (.I0(cState[1]),
        .I1(s00_axi_aresetn),
        .I2(cState[2]),
        .I3(cState[0]),
        .O(\FSM_sequential_nState_reg[2]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    enable_reg
       (.CLR(1'b0),
        .D(enable_reg_i_1_n_0),
        .G(enable_reg_i_2_n_0),
        .GE(1'b1),
        .Q(E));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h08)) 
    enable_reg_i_1
       (.I0(cState[1]),
        .I1(cState[2]),
        .I2(cState[0]),
        .O(enable_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h5E)) 
    enable_reg_i_2
       (.I0(cState[0]),
        .I1(cState[2]),
        .I2(cState[1]),
        .O(enable_reg_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF4FF4444)) 
    reg_start_i_i_1
       (.I0(start_prev),
        .I1(Q),
        .I2(done_prev),
        .I3(E),
        .I4(reg_start_i),
        .O(start_prev_reg));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \slv_reg3[7]_i_1 
       (.I0(E),
        .I1(done_prev),
        .O(done_prev_reg));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    xld_reg
       (.CLR(1'b0),
        .D(xld_reg_i_1_n_0),
        .G(xsel_reg_i_2_n_0),
        .GE(1'b1),
        .Q(\FSM_sequential_cState_reg[0]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    xld_reg_i_1
       (.I0(cState[0]),
        .O(xld_reg_i_1_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    xsel_reg
       (.CLR(1'b0),
        .D(xsel_reg_i_1_n_0),
        .G(xsel_reg_i_2_n_0),
        .GE(1'b1),
        .Q(xsel));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    xsel_reg_i_1
       (.I0(cState[2]),
        .I1(cState[0]),
        .O(xsel_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h7E)) 
    xsel_reg_i_2
       (.I0(cState[0]),
        .I1(cState[2]),
        .I2(cState[1]),
        .O(xsel_reg_i_2_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    yld_reg
       (.CLR(1'b0),
        .D(yld_reg_i_1_n_0),
        .G(xsel_reg_i_2_n_0),
        .GE(1'b1),
        .Q(\FSM_sequential_cState_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h38)) 
    yld_reg_i_1
       (.I0(cState[2]),
        .I1(cState[0]),
        .I2(cState[1]),
        .O(yld_reg_i_1_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    ysel_reg
       (.CLR(1'b0),
        .D(ysel_reg_i_1_n_0),
        .G(xsel_reg_i_2_n_0),
        .GE(1'b1),
        .Q(ysel));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h48)) 
    ysel_reg_i_1
       (.I0(cState[0]),
        .I1(cState[2]),
        .I2(cState[1]),
        .O(ysel_reg_i_1_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip
   (E,
    done_prev_reg,
    start_prev_reg,
    SR,
    \output_reg[7] ,
    done_prev,
    start_prev,
    Q,
    reg_start_i,
    s00_axi_aclk,
    s00_axi_aresetn,
    \output_reg[7]_0 ,
    \output_reg[7]_1 );
  output [0:0]E;
  output [0:0]done_prev_reg;
  output start_prev_reg;
  output [0:0]SR;
  output [7:0]\output_reg[7] ;
  input done_prev;
  input start_prev;
  input [0:0]Q;
  input reg_start_i;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [7:0]\output_reg[7]_0 ;
  input [7:0]\output_reg[7]_1 ;

  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SR;
  wire X_REG_n_0;
  wire X_REG_n_1;
  wire X_REG_n_10;
  wire X_REG_n_11;
  wire X_REG_n_2;
  wire X_REG_n_3;
  wire X_REG_n_4;
  wire X_REG_n_5;
  wire X_REG_n_6;
  wire X_REG_n_7;
  wire X_REG_n_8;
  wire X_REG_n_9;
  wire X_SUB_n_0;
  wire X_SUB_n_1;
  wire X_SUB_n_16;
  wire X_SUB_n_17;
  wire X_SUB_n_18;
  wire X_SUB_n_19;
  wire X_SUB_n_2;
  wire X_SUB_n_20;
  wire X_SUB_n_21;
  wire X_SUB_n_22;
  wire X_SUB_n_23;
  wire X_SUB_n_3;
  wire X_SUB_n_4;
  wire X_SUB_n_5;
  wire X_SUB_n_6;
  wire X_SUB_n_7;
  wire Y_REG_n_0;
  wire Y_REG_n_1;
  wire Y_REG_n_10;
  wire Y_REG_n_11;
  wire Y_REG_n_13;
  wire Y_REG_n_14;
  wire Y_REG_n_15;
  wire Y_REG_n_16;
  wire Y_REG_n_17;
  wire Y_REG_n_18;
  wire Y_REG_n_19;
  wire Y_REG_n_2;
  wire Y_REG_n_20;
  wire Y_REG_n_21;
  wire Y_REG_n_22;
  wire Y_REG_n_23;
  wire Y_REG_n_24;
  wire Y_REG_n_25;
  wire Y_REG_n_26;
  wire Y_REG_n_27;
  wire Y_REG_n_28;
  wire Y_REG_n_29;
  wire Y_REG_n_3;
  wire Y_REG_n_30;
  wire Y_REG_n_31;
  wire Y_REG_n_32;
  wire Y_REG_n_33;
  wire Y_REG_n_34;
  wire Y_REG_n_35;
  wire Y_REG_n_36;
  wire Y_REG_n_37;
  wire Y_REG_n_4;
  wire Y_REG_n_5;
  wire Y_REG_n_6;
  wire Y_REG_n_7;
  wire Y_REG_n_8;
  wire Y_REG_n_9;
  wire done_prev;
  wire [0:0]done_prev_reg;
  wire eqOp;
  wire gtOp;
  wire [7:0]\input ;
  wire [7:0]\output_reg[7] ;
  wire [7:0]\output_reg[7]_0 ;
  wire [7:0]\output_reg[7]_1 ;
  wire reg_start_i;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire sel;
  wire start_prev;
  wire start_prev_reg;
  wire xld;
  wire xsel;
  wire yld;
  wire ysel;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis OUT_REG
       (.AR(SR),
        .D({X_SUB_n_16,X_SUB_n_17,X_SUB_n_18,X_SUB_n_19,X_SUB_n_20,X_SUB_n_21,X_SUB_n_22,X_SUB_n_23}),
        .E(E),
        .\output_reg[7]_0 (\output_reg[7] ),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fsm TOFSM
       (.AR(SR),
        .CO(sel),
        .E(E),
        .\FSM_sequential_cState_reg[0]_0 (xld),
        .\FSM_sequential_cState_reg[1]_0 (gtOp),
        .\FSM_sequential_cState_reg[2]_0 (yld),
        .Q(Q),
        .done_prev(done_prev),
        .done_prev_reg(done_prev_reg),
        .reg_start_i(reg_start_i),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .start_prev(start_prev),
        .start_prev_reg(start_prev_reg),
        .xsel(xsel),
        .ysel(ysel));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_comparator U_COMP
       (.CO(sel),
        .DI({Y_REG_n_22,Y_REG_n_23,Y_REG_n_24,Y_REG_n_25}),
        .\FSM_sequential_nState_reg[0]_i_3 ({X_REG_n_0,X_REG_n_1,X_REG_n_2,X_REG_n_3}),
        .\FSM_sequential_nState_reg[0]_i_3_0 ({Y_REG_n_18,Y_REG_n_19,Y_REG_n_20,Y_REG_n_21}),
        .S({Y_REG_n_26,Y_REG_n_27,Y_REG_n_28,Y_REG_n_29}),
        .\output_reg[6] (gtOp));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_0 X_REG
       (.AR(SR),
        .D(\input ),
        .E(xld),
        .Q({X_REG_n_4,X_REG_n_5,X_REG_n_6,X_REG_n_7,X_REG_n_8,X_REG_n_9,X_REG_n_10,X_REG_n_11}),
        .ltOp_carry({Y_REG_n_4,Y_REG_n_5,Y_REG_n_6,Y_REG_n_7,Y_REG_n_8,Y_REG_n_9,Y_REG_n_10,Y_REG_n_11}),
        .\output_reg[6]_0 ({X_REG_n_0,X_REG_n_1,X_REG_n_2,X_REG_n_3}),
        .s00_axi_aclk(s00_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_subtractor X_SUB
       (.D({X_SUB_n_0,X_SUB_n_1,X_SUB_n_2,X_SUB_n_3,X_SUB_n_4,X_SUB_n_5,X_SUB_n_6,X_SUB_n_7}),
        .Q({Y_REG_n_5,Y_REG_n_6,Y_REG_n_7,Y_REG_n_8,Y_REG_n_9,Y_REG_n_10,Y_REG_n_11}),
        .S({Y_REG_n_30,Y_REG_n_31,Y_REG_n_32,Y_REG_n_33}),
        .eqOp(eqOp),
        .\output_reg[3] (Y_REG_n_17),
        .\output_reg[3]_0 ({Y_REG_n_34,Y_REG_n_35,Y_REG_n_36,Y_REG_n_37}),
        .\output_reg[7] ({Y_REG_n_13,Y_REG_n_14,Y_REG_n_15,Y_REG_n_16}),
        .\output_reg[7]_0 ({X_REG_n_5,X_REG_n_6,X_REG_n_7,X_REG_n_8,X_REG_n_9,X_REG_n_10,X_REG_n_11}),
        .\output_reg[7]_1 ({Y_REG_n_0,Y_REG_n_1,Y_REG_n_2,Y_REG_n_3}),
        .\output_reg[7]_2 (\output_reg[7]_0 ),
        .\output_reg[7]_3 (\output_reg[7]_1 ),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_aresetn_0(\input ),
        .s00_axi_aresetn_1({X_SUB_n_16,X_SUB_n_17,X_SUB_n_18,X_SUB_n_19,X_SUB_n_20,X_SUB_n_21,X_SUB_n_22,X_SUB_n_23}),
        .xsel(xsel),
        .ysel(ysel));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_1 Y_REG
       (.AR(SR),
        .CO(sel),
        .D({X_SUB_n_0,X_SUB_n_1,X_SUB_n_2,X_SUB_n_3,X_SUB_n_4,X_SUB_n_5,X_SUB_n_6,X_SUB_n_7}),
        .DI({Y_REG_n_22,Y_REG_n_23,Y_REG_n_24,Y_REG_n_25}),
        .E(yld),
        .Q({Y_REG_n_4,Y_REG_n_5,Y_REG_n_6,Y_REG_n_7,Y_REG_n_8,Y_REG_n_9,Y_REG_n_10,Y_REG_n_11}),
        .S({Y_REG_n_26,Y_REG_n_27,Y_REG_n_28,Y_REG_n_29}),
        .eqOp(eqOp),
        .gtOp_carry({X_REG_n_4,X_REG_n_5,X_REG_n_6,X_REG_n_7,X_REG_n_8,X_REG_n_9,X_REG_n_10,X_REG_n_11}),
        .minusOp_carry(gtOp),
        .\output_reg[3]_0 ({Y_REG_n_30,Y_REG_n_31,Y_REG_n_32,Y_REG_n_33}),
        .\output_reg[3]_1 ({Y_REG_n_34,Y_REG_n_35,Y_REG_n_36,Y_REG_n_37}),
        .\output_reg[6]_0 ({Y_REG_n_18,Y_REG_n_19,Y_REG_n_20,Y_REG_n_21}),
        .\output_reg[7]_0 ({Y_REG_n_0,Y_REG_n_1,Y_REG_n_2,Y_REG_n_3}),
        .\output_reg[7]_1 ({Y_REG_n_13,Y_REG_n_14,Y_REG_n_15,Y_REG_n_16}),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_aresetn_0(Y_REG_n_17));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_wstrb,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0_S00_AXI gcdip_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0_S00_AXI
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_wstrb,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire [3:2]axi_awaddr;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire done_i;
  wire done_prev;
  wire done_pulse;
  wire [31:0]reg_data_out;
  wire reg_start_i;
  wire [7:0]reg_x_i;
  wire [7:0]reg_y_i;
  wire rst_gcd;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire \slv_reg0_reg_n_0_[0] ;
  wire \slv_reg0_reg_n_0_[10] ;
  wire \slv_reg0_reg_n_0_[11] ;
  wire \slv_reg0_reg_n_0_[12] ;
  wire \slv_reg0_reg_n_0_[13] ;
  wire \slv_reg0_reg_n_0_[14] ;
  wire \slv_reg0_reg_n_0_[15] ;
  wire \slv_reg0_reg_n_0_[16] ;
  wire \slv_reg0_reg_n_0_[17] ;
  wire \slv_reg0_reg_n_0_[18] ;
  wire \slv_reg0_reg_n_0_[19] ;
  wire \slv_reg0_reg_n_0_[1] ;
  wire \slv_reg0_reg_n_0_[20] ;
  wire \slv_reg0_reg_n_0_[21] ;
  wire \slv_reg0_reg_n_0_[22] ;
  wire \slv_reg0_reg_n_0_[23] ;
  wire \slv_reg0_reg_n_0_[24] ;
  wire \slv_reg0_reg_n_0_[25] ;
  wire \slv_reg0_reg_n_0_[26] ;
  wire \slv_reg0_reg_n_0_[27] ;
  wire \slv_reg0_reg_n_0_[28] ;
  wire \slv_reg0_reg_n_0_[29] ;
  wire \slv_reg0_reg_n_0_[2] ;
  wire \slv_reg0_reg_n_0_[30] ;
  wire \slv_reg0_reg_n_0_[31] ;
  wire \slv_reg0_reg_n_0_[3] ;
  wire \slv_reg0_reg_n_0_[4] ;
  wire \slv_reg0_reg_n_0_[5] ;
  wire \slv_reg0_reg_n_0_[6] ;
  wire \slv_reg0_reg_n_0_[7] ;
  wire \slv_reg0_reg_n_0_[8] ;
  wire \slv_reg0_reg_n_0_[9] ;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire \slv_reg1_reg_n_0_[0] ;
  wire \slv_reg1_reg_n_0_[10] ;
  wire \slv_reg1_reg_n_0_[11] ;
  wire \slv_reg1_reg_n_0_[12] ;
  wire \slv_reg1_reg_n_0_[13] ;
  wire \slv_reg1_reg_n_0_[14] ;
  wire \slv_reg1_reg_n_0_[15] ;
  wire \slv_reg1_reg_n_0_[16] ;
  wire \slv_reg1_reg_n_0_[17] ;
  wire \slv_reg1_reg_n_0_[18] ;
  wire \slv_reg1_reg_n_0_[19] ;
  wire \slv_reg1_reg_n_0_[1] ;
  wire \slv_reg1_reg_n_0_[20] ;
  wire \slv_reg1_reg_n_0_[21] ;
  wire \slv_reg1_reg_n_0_[22] ;
  wire \slv_reg1_reg_n_0_[23] ;
  wire \slv_reg1_reg_n_0_[24] ;
  wire \slv_reg1_reg_n_0_[25] ;
  wire \slv_reg1_reg_n_0_[26] ;
  wire \slv_reg1_reg_n_0_[27] ;
  wire \slv_reg1_reg_n_0_[28] ;
  wire \slv_reg1_reg_n_0_[29] ;
  wire \slv_reg1_reg_n_0_[2] ;
  wire \slv_reg1_reg_n_0_[30] ;
  wire \slv_reg1_reg_n_0_[31] ;
  wire \slv_reg1_reg_n_0_[3] ;
  wire \slv_reg1_reg_n_0_[4] ;
  wire \slv_reg1_reg_n_0_[5] ;
  wire \slv_reg1_reg_n_0_[6] ;
  wire \slv_reg1_reg_n_0_[7] ;
  wire \slv_reg1_reg_n_0_[8] ;
  wire \slv_reg1_reg_n_0_[9] ;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire \slv_reg2_reg_n_0_[0] ;
  wire \slv_reg2_reg_n_0_[10] ;
  wire \slv_reg2_reg_n_0_[11] ;
  wire \slv_reg2_reg_n_0_[12] ;
  wire \slv_reg2_reg_n_0_[13] ;
  wire \slv_reg2_reg_n_0_[14] ;
  wire \slv_reg2_reg_n_0_[15] ;
  wire \slv_reg2_reg_n_0_[16] ;
  wire \slv_reg2_reg_n_0_[17] ;
  wire \slv_reg2_reg_n_0_[18] ;
  wire \slv_reg2_reg_n_0_[19] ;
  wire \slv_reg2_reg_n_0_[1] ;
  wire \slv_reg2_reg_n_0_[20] ;
  wire \slv_reg2_reg_n_0_[21] ;
  wire \slv_reg2_reg_n_0_[22] ;
  wire \slv_reg2_reg_n_0_[23] ;
  wire \slv_reg2_reg_n_0_[24] ;
  wire \slv_reg2_reg_n_0_[25] ;
  wire \slv_reg2_reg_n_0_[26] ;
  wire \slv_reg2_reg_n_0_[27] ;
  wire \slv_reg2_reg_n_0_[28] ;
  wire \slv_reg2_reg_n_0_[29] ;
  wire \slv_reg2_reg_n_0_[2] ;
  wire \slv_reg2_reg_n_0_[30] ;
  wire \slv_reg2_reg_n_0_[31] ;
  wire \slv_reg2_reg_n_0_[3] ;
  wire \slv_reg2_reg_n_0_[4] ;
  wire \slv_reg2_reg_n_0_[5] ;
  wire \slv_reg2_reg_n_0_[6] ;
  wire \slv_reg2_reg_n_0_[7] ;
  wire \slv_reg2_reg_n_0_[8] ;
  wire \slv_reg2_reg_n_0_[9] ;
  wire \slv_reg3_reg_n_0_[0] ;
  wire \slv_reg3_reg_n_0_[1] ;
  wire \slv_reg3_reg_n_0_[2] ;
  wire \slv_reg3_reg_n_0_[3] ;
  wire \slv_reg3_reg_n_0_[4] ;
  wire \slv_reg3_reg_n_0_[5] ;
  wire \slv_reg3_reg_n_0_[6] ;
  wire \slv_reg3_reg_n_0_[7] ;
  wire slv_reg_rden__0;
  wire slv_reg_wren__2;
  wire start_prev;
  wire u_gcd_core_n_10;
  wire u_gcd_core_n_11;
  wire u_gcd_core_n_2;
  wire u_gcd_core_n_4;
  wire u_gcd_core_n_5;
  wire u_gcd_core_n_6;
  wire u_gcd_core_n_7;
  wire u_gcd_core_n_8;
  wire u_gcd_core_n_9;

  LUT6 #(
    .INIT(64'hBFFF8CCC8CCC8CCC)) 
    aw_en_i_1
       (.I0(S_AXI_AWREADY),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(rst_gcd));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(rst_gcd));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(rst_gcd));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(rst_gcd));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(S_AXI_AWREADY),
        .I5(axi_awaddr[2]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(S_AXI_AWREADY),
        .I5(axi_awaddr[3]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(axi_awaddr[2]),
        .R(rst_gcd));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(axi_awaddr[3]),
        .R(rst_gcd));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axi_awready_i_2
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(aw_en_reg_n_0),
        .I3(S_AXI_AWREADY),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(rst_gcd));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(S_AXI_WREADY),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(rst_gcd));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[0]_i_1 
       (.I0(\slv_reg1_reg_n_0_[0] ),
        .I1(\slv_reg0_reg_n_0_[0] ),
        .I2(\slv_reg3_reg_n_0_[0] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[0] ),
        .O(reg_data_out[0]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[10]_i_1 
       (.I0(\slv_reg1_reg_n_0_[10] ),
        .I1(\slv_reg0_reg_n_0_[10] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[10] ),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[11]_i_1 
       (.I0(\slv_reg1_reg_n_0_[11] ),
        .I1(\slv_reg0_reg_n_0_[11] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[11] ),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[12]_i_1 
       (.I0(\slv_reg1_reg_n_0_[12] ),
        .I1(\slv_reg0_reg_n_0_[12] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[12] ),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[13]_i_1 
       (.I0(\slv_reg1_reg_n_0_[13] ),
        .I1(\slv_reg0_reg_n_0_[13] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[13] ),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[14]_i_1 
       (.I0(\slv_reg1_reg_n_0_[14] ),
        .I1(\slv_reg0_reg_n_0_[14] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[14] ),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[15]_i_1 
       (.I0(\slv_reg1_reg_n_0_[15] ),
        .I1(\slv_reg0_reg_n_0_[15] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[15] ),
        .O(reg_data_out[15]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[16]_i_1 
       (.I0(\slv_reg1_reg_n_0_[16] ),
        .I1(\slv_reg0_reg_n_0_[16] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[16] ),
        .O(reg_data_out[16]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[17]_i_1 
       (.I0(\slv_reg1_reg_n_0_[17] ),
        .I1(\slv_reg0_reg_n_0_[17] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[17] ),
        .O(reg_data_out[17]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[18]_i_1 
       (.I0(\slv_reg1_reg_n_0_[18] ),
        .I1(\slv_reg0_reg_n_0_[18] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[18] ),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[19]_i_1 
       (.I0(\slv_reg1_reg_n_0_[19] ),
        .I1(\slv_reg0_reg_n_0_[19] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[19] ),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[1]_i_1 
       (.I0(\slv_reg1_reg_n_0_[1] ),
        .I1(\slv_reg0_reg_n_0_[1] ),
        .I2(\slv_reg3_reg_n_0_[1] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[1] ),
        .O(reg_data_out[1]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[20]_i_1 
       (.I0(\slv_reg1_reg_n_0_[20] ),
        .I1(\slv_reg0_reg_n_0_[20] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[20] ),
        .O(reg_data_out[20]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[21]_i_1 
       (.I0(\slv_reg1_reg_n_0_[21] ),
        .I1(\slv_reg0_reg_n_0_[21] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[21] ),
        .O(reg_data_out[21]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[22]_i_1 
       (.I0(\slv_reg1_reg_n_0_[22] ),
        .I1(\slv_reg0_reg_n_0_[22] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[22] ),
        .O(reg_data_out[22]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[23]_i_1 
       (.I0(\slv_reg1_reg_n_0_[23] ),
        .I1(\slv_reg0_reg_n_0_[23] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[23] ),
        .O(reg_data_out[23]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[24]_i_1 
       (.I0(\slv_reg1_reg_n_0_[24] ),
        .I1(\slv_reg0_reg_n_0_[24] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[24] ),
        .O(reg_data_out[24]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[25]_i_1 
       (.I0(\slv_reg1_reg_n_0_[25] ),
        .I1(\slv_reg0_reg_n_0_[25] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[25] ),
        .O(reg_data_out[25]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[26]_i_1 
       (.I0(\slv_reg1_reg_n_0_[26] ),
        .I1(\slv_reg0_reg_n_0_[26] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[26] ),
        .O(reg_data_out[26]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[27]_i_1 
       (.I0(\slv_reg1_reg_n_0_[27] ),
        .I1(\slv_reg0_reg_n_0_[27] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[27] ),
        .O(reg_data_out[27]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[28]_i_1 
       (.I0(\slv_reg1_reg_n_0_[28] ),
        .I1(\slv_reg0_reg_n_0_[28] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[28] ),
        .O(reg_data_out[28]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[29]_i_1 
       (.I0(\slv_reg1_reg_n_0_[29] ),
        .I1(\slv_reg0_reg_n_0_[29] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[29] ),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[2]_i_1 
       (.I0(\slv_reg1_reg_n_0_[2] ),
        .I1(\slv_reg0_reg_n_0_[2] ),
        .I2(\slv_reg3_reg_n_0_[2] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[2] ),
        .O(reg_data_out[2]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[30]_i_1 
       (.I0(\slv_reg1_reg_n_0_[30] ),
        .I1(\slv_reg0_reg_n_0_[30] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[30] ),
        .O(reg_data_out[30]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[31]_i_1 
       (.I0(\slv_reg1_reg_n_0_[31] ),
        .I1(\slv_reg0_reg_n_0_[31] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[31] ),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[3]_i_1 
       (.I0(\slv_reg1_reg_n_0_[3] ),
        .I1(\slv_reg0_reg_n_0_[3] ),
        .I2(\slv_reg3_reg_n_0_[3] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[3] ),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[4]_i_1 
       (.I0(\slv_reg1_reg_n_0_[4] ),
        .I1(\slv_reg0_reg_n_0_[4] ),
        .I2(\slv_reg3_reg_n_0_[4] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[4] ),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[5]_i_1 
       (.I0(\slv_reg1_reg_n_0_[5] ),
        .I1(\slv_reg0_reg_n_0_[5] ),
        .I2(\slv_reg3_reg_n_0_[5] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[5] ),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[6]_i_1 
       (.I0(\slv_reg1_reg_n_0_[6] ),
        .I1(\slv_reg0_reg_n_0_[6] ),
        .I2(\slv_reg3_reg_n_0_[6] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[6] ),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[7]_i_1 
       (.I0(\slv_reg1_reg_n_0_[7] ),
        .I1(\slv_reg0_reg_n_0_[7] ),
        .I2(\slv_reg3_reg_n_0_[7] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(\slv_reg2_reg_n_0_[7] ),
        .O(reg_data_out[7]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[8]_i_1 
       (.I0(\slv_reg1_reg_n_0_[8] ),
        .I1(\slv_reg0_reg_n_0_[8] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[8] ),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[9]_i_1 
       (.I0(\slv_reg1_reg_n_0_[9] ),
        .I1(\slv_reg0_reg_n_0_[9] ),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(\slv_reg2_reg_n_0_[9] ),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(rst_gcd));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(rst_gcd));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(rst_gcd));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(aw_en_reg_n_0),
        .I3(S_AXI_WREADY),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(rst_gcd));
  FDRE done_prev_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(done_i),
        .Q(done_prev),
        .R(rst_gcd));
  FDRE reg_start_i_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(u_gcd_core_n_2),
        .Q(reg_start_i),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[0] ),
        .Q(reg_x_i[0]),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[1] ),
        .Q(reg_x_i[1]),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[2] ),
        .Q(reg_x_i[2]),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[3] ),
        .Q(reg_x_i[3]),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[4] ),
        .Q(reg_x_i[4]),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[5] ),
        .Q(reg_x_i[5]),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[6] ),
        .Q(reg_x_i[6]),
        .R(rst_gcd));
  FDRE \reg_x_i_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0_reg_n_0_[7] ),
        .Q(reg_x_i[7]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[0] ),
        .Q(reg_y_i[0]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[1] ),
        .Q(reg_y_i[1]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[2] ),
        .Q(reg_y_i[2]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[3] ),
        .Q(reg_y_i[3]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[4] ),
        .Q(reg_y_i[4]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[5] ),
        .Q(reg_y_i[5]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[6] ),
        .Q(reg_y_i[6]),
        .R(rst_gcd));
  FDRE \reg_y_i_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg1_reg_n_0_[7] ),
        .Q(reg_y_i[7]),
        .R(rst_gcd));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg0_reg_n_0_[0] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg0_reg_n_0_[10] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg0_reg_n_0_[11] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg0_reg_n_0_[12] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg0_reg_n_0_[13] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg0_reg_n_0_[14] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg0_reg_n_0_[15] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg0_reg_n_0_[16] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg0_reg_n_0_[17] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg0_reg_n_0_[18] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg0_reg_n_0_[19] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg0_reg_n_0_[1] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg0_reg_n_0_[20] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg0_reg_n_0_[21] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg0_reg_n_0_[22] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg0_reg_n_0_[23] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg0_reg_n_0_[24] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg0_reg_n_0_[25] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg0_reg_n_0_[26] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg0_reg_n_0_[27] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg0_reg_n_0_[28] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg0_reg_n_0_[29] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg0_reg_n_0_[2] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg0_reg_n_0_[30] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg0_reg_n_0_[31] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg0_reg_n_0_[3] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg0_reg_n_0_[4] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg0_reg_n_0_[5] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg0_reg_n_0_[6] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg0_reg_n_0_[7] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg0_reg_n_0_[8] ),
        .R(rst_gcd));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg0_reg_n_0_[9] ),
        .R(rst_gcd));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[1]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[2]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[3]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg1[31]_i_2 
       (.I0(s00_axi_awvalid),
        .I1(S_AXI_WREADY),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__2));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[0]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg1_reg_n_0_[0] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg1_reg_n_0_[10] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg1_reg_n_0_[11] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg1_reg_n_0_[12] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg1_reg_n_0_[13] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg1_reg_n_0_[14] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg1_reg_n_0_[15] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg1_reg_n_0_[16] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg1_reg_n_0_[17] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg1_reg_n_0_[18] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg1_reg_n_0_[19] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg1_reg_n_0_[1] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg1_reg_n_0_[20] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg1_reg_n_0_[21] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg1_reg_n_0_[22] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg1_reg_n_0_[23] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg1_reg_n_0_[24] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg1_reg_n_0_[25] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg1_reg_n_0_[26] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg1_reg_n_0_[27] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg1_reg_n_0_[28] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg1_reg_n_0_[29] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg1_reg_n_0_[2] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg1_reg_n_0_[30] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg1_reg_n_0_[31] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg1_reg_n_0_[3] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg1_reg_n_0_[4] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg1_reg_n_0_[5] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg1_reg_n_0_[6] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg1_reg_n_0_[7] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg1_reg_n_0_[8] ),
        .R(rst_gcd));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg1_reg_n_0_[9] ),
        .R(rst_gcd));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[1]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[2]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[3]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[0]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg2_reg_n_0_[0] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg2_reg_n_0_[10] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg2_reg_n_0_[11] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg2_reg_n_0_[12] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg2_reg_n_0_[13] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg2_reg_n_0_[14] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg2_reg_n_0_[15] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg2_reg_n_0_[16] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg2_reg_n_0_[17] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg2_reg_n_0_[18] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg2_reg_n_0_[19] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg2_reg_n_0_[1] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg2_reg_n_0_[20] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg2_reg_n_0_[21] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg2_reg_n_0_[22] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg2_reg_n_0_[23] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg2_reg_n_0_[24] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg2_reg_n_0_[25] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg2_reg_n_0_[26] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg2_reg_n_0_[27] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg2_reg_n_0_[28] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg2_reg_n_0_[29] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg2_reg_n_0_[2] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg2_reg_n_0_[30] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg2_reg_n_0_[31] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg2_reg_n_0_[3] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg2_reg_n_0_[4] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg2_reg_n_0_[5] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg2_reg_n_0_[6] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg2_reg_n_0_[7] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg2_reg_n_0_[8] ),
        .R(rst_gcd));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg2_reg_n_0_[9] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_11),
        .Q(\slv_reg3_reg_n_0_[0] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_10),
        .Q(\slv_reg3_reg_n_0_[1] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_9),
        .Q(\slv_reg3_reg_n_0_[2] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_8),
        .Q(\slv_reg3_reg_n_0_[3] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_7),
        .Q(\slv_reg3_reg_n_0_[4] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_6),
        .Q(\slv_reg3_reg_n_0_[5] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_5),
        .Q(\slv_reg3_reg_n_0_[6] ),
        .R(rst_gcd));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(done_pulse),
        .D(u_gcd_core_n_4),
        .Q(\slv_reg3_reg_n_0_[7] ),
        .R(rst_gcd));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(S_AXI_ARREADY),
        .O(slv_reg_rden__0));
  FDRE start_prev_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg2_reg_n_0_[0] ),
        .Q(start_prev),
        .R(rst_gcd));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip u_gcd_core
       (.E(done_i),
        .Q(\slv_reg2_reg_n_0_[0] ),
        .SR(rst_gcd),
        .done_prev(done_prev),
        .done_prev_reg(done_pulse),
        .\output_reg[7] ({u_gcd_core_n_4,u_gcd_core_n_5,u_gcd_core_n_6,u_gcd_core_n_7,u_gcd_core_n_8,u_gcd_core_n_9,u_gcd_core_n_10,u_gcd_core_n_11}),
        .\output_reg[7]_0 (reg_y_i),
        .\output_reg[7]_1 (reg_x_i),
        .reg_start_i(reg_start_i),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .start_prev(start_prev),
        .start_prev_reg(u_gcd_core_n_2));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis
   (AR,
    \output_reg[7]_0 ,
    s00_axi_aresetn,
    E,
    D,
    s00_axi_aclk);
  output [0:0]AR;
  output [7:0]\output_reg[7]_0 ;
  input s00_axi_aresetn;
  input [0:0]E;
  input [7:0]D;
  input s00_axi_aclk;

  wire [0:0]AR;
  wire [7:0]D;
  wire [0:0]E;
  wire [7:0]\output_reg[7]_0 ;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;

  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(AR));
  FDCE \output_reg[0] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(\output_reg[7]_0 [0]));
  FDCE \output_reg[1] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(\output_reg[7]_0 [1]));
  FDCE \output_reg[2] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(\output_reg[7]_0 [2]));
  FDCE \output_reg[3] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(\output_reg[7]_0 [3]));
  FDCE \output_reg[4] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(\output_reg[7]_0 [4]));
  FDCE \output_reg[5] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(\output_reg[7]_0 [5]));
  FDCE \output_reg[6] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(\output_reg[7]_0 [6]));
  FDCE \output_reg[7] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(\output_reg[7]_0 [7]));
endmodule

(* ORIG_REF_NAME = "regis" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_0
   (\output_reg[6]_0 ,
    Q,
    ltOp_carry,
    E,
    D,
    s00_axi_aclk,
    AR);
  output [3:0]\output_reg[6]_0 ;
  output [7:0]Q;
  input [7:0]ltOp_carry;
  input [0:0]E;
  input [7:0]D;
  input s00_axi_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [7:0]D;
  wire [0:0]E;
  wire [7:0]Q;
  wire [7:0]ltOp_carry;
  wire [3:0]\output_reg[6]_0 ;
  wire s00_axi_aclk;

  LUT4 #(
    .INIT(16'h40F4)) 
    ltOp_carry_i_1
       (.I0(Q[6]),
        .I1(ltOp_carry[6]),
        .I2(ltOp_carry[7]),
        .I3(Q[7]),
        .O(\output_reg[6]_0 [3]));
  LUT4 #(
    .INIT(16'h40F4)) 
    ltOp_carry_i_2
       (.I0(Q[4]),
        .I1(ltOp_carry[4]),
        .I2(ltOp_carry[5]),
        .I3(Q[5]),
        .O(\output_reg[6]_0 [2]));
  LUT4 #(
    .INIT(16'h40F4)) 
    ltOp_carry_i_3
       (.I0(Q[2]),
        .I1(ltOp_carry[2]),
        .I2(ltOp_carry[3]),
        .I3(Q[3]),
        .O(\output_reg[6]_0 [1]));
  LUT4 #(
    .INIT(16'h40F4)) 
    ltOp_carry_i_4
       (.I0(Q[0]),
        .I1(ltOp_carry[0]),
        .I2(ltOp_carry[1]),
        .I3(Q[1]),
        .O(\output_reg[6]_0 [0]));
  FDCE \output_reg[0] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE \output_reg[1] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  FDCE \output_reg[2] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(Q[2]));
  FDCE \output_reg[3] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(Q[3]));
  FDCE \output_reg[4] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(Q[4]));
  FDCE \output_reg[5] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(Q[5]));
  FDCE \output_reg[6] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(Q[6]));
  FDCE \output_reg[7] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "regis" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_1
   (\output_reg[7]_0 ,
    Q,
    eqOp,
    \output_reg[7]_1 ,
    s00_axi_aresetn_0,
    \output_reg[6]_0 ,
    DI,
    S,
    \output_reg[3]_0 ,
    \output_reg[3]_1 ,
    gtOp_carry,
    minusOp_carry,
    s00_axi_aresetn,
    CO,
    E,
    D,
    s00_axi_aclk,
    AR);
  output [3:0]\output_reg[7]_0 ;
  output [7:0]Q;
  output eqOp;
  output [3:0]\output_reg[7]_1 ;
  output s00_axi_aresetn_0;
  output [3:0]\output_reg[6]_0 ;
  output [3:0]DI;
  output [3:0]S;
  output [3:0]\output_reg[3]_0 ;
  output [3:0]\output_reg[3]_1 ;
  input [7:0]gtOp_carry;
  input [0:0]minusOp_carry;
  input s00_axi_aresetn;
  input [0:0]CO;
  input [0:0]E;
  input [7:0]D;
  input s00_axi_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [0:0]CO;
  wire [7:0]D;
  wire [3:0]DI;
  wire [0:0]E;
  wire [7:0]Q;
  wire [3:0]S;
  wire eqOp;
  wire [7:0]gtOp_carry;
  wire [0:0]minusOp_carry;
  wire [3:0]\output_reg[3]_0 ;
  wire [3:0]\output_reg[3]_1 ;
  wire [3:0]\output_reg[6]_0 ;
  wire [3:0]\output_reg[7]_0 ;
  wire [3:0]\output_reg[7]_1 ;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s00_axi_aresetn_0;

  LUT4 #(
    .INIT(16'h40F4)) 
    gtOp_carry_i_1
       (.I0(Q[6]),
        .I1(gtOp_carry[6]),
        .I2(gtOp_carry[7]),
        .I3(Q[7]),
        .O(DI[3]));
  LUT4 #(
    .INIT(16'h40F4)) 
    gtOp_carry_i_2
       (.I0(Q[4]),
        .I1(gtOp_carry[4]),
        .I2(gtOp_carry[5]),
        .I3(Q[5]),
        .O(DI[2]));
  LUT4 #(
    .INIT(16'h40F4)) 
    gtOp_carry_i_3
       (.I0(Q[2]),
        .I1(gtOp_carry[2]),
        .I2(gtOp_carry[3]),
        .I3(Q[3]),
        .O(DI[1]));
  LUT4 #(
    .INIT(16'h40F4)) 
    gtOp_carry_i_4
       (.I0(Q[0]),
        .I1(gtOp_carry[0]),
        .I2(gtOp_carry[1]),
        .I3(Q[1]),
        .O(DI[0]));
  LUT4 #(
    .INIT(16'h8241)) 
    gtOp_carry_i_5
       (.I0(Q[6]),
        .I1(gtOp_carry[7]),
        .I2(Q[7]),
        .I3(gtOp_carry[6]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h8241)) 
    gtOp_carry_i_6
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(gtOp_carry[5]),
        .I3(gtOp_carry[4]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'h8241)) 
    gtOp_carry_i_7
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(gtOp_carry[3]),
        .I3(gtOp_carry[2]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h8241)) 
    gtOp_carry_i_8
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(gtOp_carry[1]),
        .I3(gtOp_carry[0]),
        .O(S[0]));
  LUT4 #(
    .INIT(16'h9CCC)) 
    i__carry__0_i_1
       (.I0(Q[7]),
        .I1(gtOp_carry[7]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .O(\output_reg[7]_0 [3]));
  LUT4 #(
    .INIT(16'h9AAA)) 
    i__carry__0_i_2
       (.I0(gtOp_carry[6]),
        .I1(Q[6]),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .O(\output_reg[7]_0 [2]));
  LUT4 #(
    .INIT(16'h9AAA)) 
    i__carry__0_i_3
       (.I0(gtOp_carry[5]),
        .I1(Q[5]),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .O(\output_reg[7]_0 [1]));
  LUT4 #(
    .INIT(16'h9AAA)) 
    i__carry__0_i_4
       (.I0(gtOp_carry[4]),
        .I1(Q[4]),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .O(\output_reg[7]_0 [0]));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_1
       (.I0(s00_axi_aresetn),
        .I1(minusOp_carry),
        .O(eqOp));
  LUT4 #(
    .INIT(16'h9AAA)) 
    i__carry_i_2
       (.I0(gtOp_carry[3]),
        .I1(Q[3]),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .O(\output_reg[3]_1 [3]));
  LUT4 #(
    .INIT(16'h9AAA)) 
    i__carry_i_3
       (.I0(gtOp_carry[2]),
        .I1(Q[2]),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .O(\output_reg[3]_1 [2]));
  LUT4 #(
    .INIT(16'h9AAA)) 
    i__carry_i_4
       (.I0(gtOp_carry[1]),
        .I1(Q[1]),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .O(\output_reg[3]_1 [1]));
  LUT4 #(
    .INIT(16'h9AAA)) 
    i__carry_i_5
       (.I0(gtOp_carry[0]),
        .I1(Q[0]),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .O(\output_reg[3]_1 [0]));
  LUT4 #(
    .INIT(16'h8241)) 
    ltOp_carry_i_5
       (.I0(Q[6]),
        .I1(gtOp_carry[7]),
        .I2(Q[7]),
        .I3(gtOp_carry[6]),
        .O(\output_reg[6]_0 [3]));
  LUT4 #(
    .INIT(16'h8241)) 
    ltOp_carry_i_6
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(gtOp_carry[5]),
        .I3(gtOp_carry[4]),
        .O(\output_reg[6]_0 [2]));
  LUT4 #(
    .INIT(16'h8241)) 
    ltOp_carry_i_7
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(gtOp_carry[3]),
        .I3(gtOp_carry[2]),
        .O(\output_reg[6]_0 [1]));
  LUT4 #(
    .INIT(16'h8241)) 
    ltOp_carry_i_8
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(gtOp_carry[1]),
        .I3(gtOp_carry[0]),
        .O(\output_reg[6]_0 [0]));
  LUT5 #(
    .INIT(32'hAAAAAA6A)) 
    minusOp_carry__0_i_1
       (.I0(Q[7]),
        .I1(CO),
        .I2(s00_axi_aresetn),
        .I3(minusOp_carry),
        .I4(gtOp_carry[7]),
        .O(\output_reg[7]_1 [3]));
  LUT5 #(
    .INIT(32'hA9AAAAAA)) 
    minusOp_carry__0_i_2
       (.I0(Q[6]),
        .I1(gtOp_carry[6]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .I4(CO),
        .O(\output_reg[7]_1 [2]));
  LUT5 #(
    .INIT(32'hA9AAAAAA)) 
    minusOp_carry__0_i_3
       (.I0(Q[5]),
        .I1(gtOp_carry[5]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .I4(CO),
        .O(\output_reg[7]_1 [1]));
  LUT5 #(
    .INIT(32'hA9AAAAAA)) 
    minusOp_carry__0_i_4
       (.I0(Q[4]),
        .I1(gtOp_carry[4]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .I4(CO),
        .O(\output_reg[7]_1 [0]));
  LUT3 #(
    .INIT(8'h40)) 
    minusOp_carry_i_1
       (.I0(minusOp_carry),
        .I1(s00_axi_aresetn),
        .I2(CO),
        .O(s00_axi_aresetn_0));
  LUT5 #(
    .INIT(32'hA9AAAAAA)) 
    minusOp_carry_i_2
       (.I0(Q[3]),
        .I1(gtOp_carry[3]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .I4(CO),
        .O(\output_reg[3]_0 [3]));
  LUT5 #(
    .INIT(32'hA9AAAAAA)) 
    minusOp_carry_i_3
       (.I0(Q[2]),
        .I1(gtOp_carry[2]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .I4(CO),
        .O(\output_reg[3]_0 [2]));
  LUT5 #(
    .INIT(32'hA9AAAAAA)) 
    minusOp_carry_i_4
       (.I0(Q[1]),
        .I1(gtOp_carry[1]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .I4(CO),
        .O(\output_reg[3]_0 [1]));
  LUT5 #(
    .INIT(32'hA9AAAAAA)) 
    minusOp_carry_i_5
       (.I0(Q[0]),
        .I1(gtOp_carry[0]),
        .I2(minusOp_carry),
        .I3(s00_axi_aresetn),
        .I4(CO),
        .O(\output_reg[3]_0 [0]));
  FDCE \output_reg[0] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE \output_reg[1] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  FDCE \output_reg[2] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(Q[2]));
  FDCE \output_reg[3] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(Q[3]));
  FDCE \output_reg[4] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(Q[4]));
  FDCE \output_reg[5] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(Q[5]));
  FDCE \output_reg[6] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(Q[6]));
  FDCE \output_reg[7] 
       (.C(s00_axi_aclk),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(Q[7]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_subtractor
   (D,
    s00_axi_aresetn_0,
    s00_axi_aresetn_1,
    \output_reg[3] ,
    Q,
    S,
    \output_reg[7] ,
    eqOp,
    \output_reg[7]_0 ,
    \output_reg[3]_0 ,
    \output_reg[7]_1 ,
    ysel,
    s00_axi_aresetn,
    \output_reg[7]_2 ,
    xsel,
    \output_reg[7]_3 );
  output [7:0]D;
  output [7:0]s00_axi_aresetn_0;
  output [7:0]s00_axi_aresetn_1;
  input \output_reg[3] ;
  input [6:0]Q;
  input [3:0]S;
  input [3:0]\output_reg[7] ;
  input eqOp;
  input [6:0]\output_reg[7]_0 ;
  input [3:0]\output_reg[3]_0 ;
  input [3:0]\output_reg[7]_1 ;
  input ysel;
  input s00_axi_aresetn;
  input [7:0]\output_reg[7]_2 ;
  input xsel;
  input [7:0]\output_reg[7]_3 ;

  wire [7:0]D;
  wire [6:0]Q;
  wire [3:0]S;
  wire eqOp;
  wire minusOp_carry__0_n_1;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire \minusOp_inferred__0/i__carry__0_n_1 ;
  wire \minusOp_inferred__0/i__carry__0_n_2 ;
  wire \minusOp_inferred__0/i__carry__0_n_3 ;
  wire \minusOp_inferred__0/i__carry_n_0 ;
  wire \minusOp_inferred__0/i__carry_n_1 ;
  wire \minusOp_inferred__0/i__carry_n_2 ;
  wire \minusOp_inferred__0/i__carry_n_3 ;
  wire \output_reg[3] ;
  wire [3:0]\output_reg[3]_0 ;
  wire [3:0]\output_reg[7] ;
  wire [6:0]\output_reg[7]_0 ;
  wire [3:0]\output_reg[7]_1 ;
  wire [7:0]\output_reg[7]_2 ;
  wire [7:0]\output_reg[7]_3 ;
  wire s00_axi_aresetn;
  wire [7:0]s00_axi_aresetn_0;
  wire [7:0]s00_axi_aresetn_1;
  wire [7:0]xout;
  wire xsel;
  wire [7:0]yout;
  wire ysel;
  wire [3:3]NLW_minusOp_carry__0_CO_UNCONNECTED;
  wire [3:3]\NLW_minusOp_inferred__0/i__carry__0_CO_UNCONNECTED ;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(\output_reg[3] ),
        .DI(Q[3:0]),
        .O(yout[3:0]),
        .S(S));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({NLW_minusOp_carry__0_CO_UNCONNECTED[3],minusOp_carry__0_n_1,minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,Q[6:4]}),
        .O(yout[7:4]),
        .S(\output_reg[7] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \minusOp_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\minusOp_inferred__0/i__carry_n_0 ,\minusOp_inferred__0/i__carry_n_1 ,\minusOp_inferred__0/i__carry_n_2 ,\minusOp_inferred__0/i__carry_n_3 }),
        .CYINIT(eqOp),
        .DI(\output_reg[7]_0 [3:0]),
        .O(xout[3:0]),
        .S(\output_reg[3]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \minusOp_inferred__0/i__carry__0 
       (.CI(\minusOp_inferred__0/i__carry_n_0 ),
        .CO({\NLW_minusOp_inferred__0/i__carry__0_CO_UNCONNECTED [3],\minusOp_inferred__0/i__carry__0_n_1 ,\minusOp_inferred__0/i__carry__0_n_2 ,\minusOp_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\output_reg[7]_0 [6:4]}),
        .O(xout[7:4]),
        .S(\output_reg[7]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[0]_i_1 
       (.I0(yout[0]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[0]_i_1__0 
       (.I0(xout[0]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [0]),
        .O(s00_axi_aresetn_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[0]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[0]),
        .O(s00_axi_aresetn_1[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[1]_i_1 
       (.I0(yout[1]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [1]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[1]_i_1__0 
       (.I0(xout[1]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [1]),
        .O(s00_axi_aresetn_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[1]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[1]),
        .O(s00_axi_aresetn_1[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[2]_i_1 
       (.I0(yout[2]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [2]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[2]_i_1__0 
       (.I0(xout[2]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [2]),
        .O(s00_axi_aresetn_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[2]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[2]),
        .O(s00_axi_aresetn_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[3]_i_1 
       (.I0(yout[3]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [3]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[3]_i_1__0 
       (.I0(xout[3]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [3]),
        .O(s00_axi_aresetn_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[3]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[3]),
        .O(s00_axi_aresetn_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[4]_i_1 
       (.I0(yout[4]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [4]),
        .O(D[4]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[4]_i_1__0 
       (.I0(xout[4]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [4]),
        .O(s00_axi_aresetn_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[4]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[4]),
        .O(s00_axi_aresetn_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[5]_i_1 
       (.I0(yout[5]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [5]),
        .O(D[5]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[5]_i_1__0 
       (.I0(xout[5]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [5]),
        .O(s00_axi_aresetn_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[5]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[5]),
        .O(s00_axi_aresetn_1[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[6]_i_1 
       (.I0(yout[6]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [6]),
        .O(D[6]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[6]_i_1__0 
       (.I0(xout[6]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [6]),
        .O(s00_axi_aresetn_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[6]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[6]),
        .O(s00_axi_aresetn_1[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    \output[7]_i_1 
       (.I0(yout[7]),
        .I1(ysel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_2 [7]),
        .O(D[7]));
  LUT4 #(
    .INIT(16'hB080)) 
    \output[7]_i_1__0 
       (.I0(xout[7]),
        .I1(xsel),
        .I2(s00_axi_aresetn),
        .I3(\output_reg[7]_3 [7]),
        .O(s00_axi_aresetn_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \output[7]_i_1__1 
       (.I0(s00_axi_aresetn),
        .I1(xout[7]),
        .O(s00_axi_aresetn_1[7]));
endmodule

(* CHECK_LICENSE_TYPE = "system_gcdip_0_0,gcdip_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "gcdip_v1_0,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
