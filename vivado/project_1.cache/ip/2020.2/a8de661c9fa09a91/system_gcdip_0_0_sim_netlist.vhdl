-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sun Jun 15 04:42:55 2025
-- Host        : DESKTOP-F2ANT3D running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_gcdip_0_0_sim_netlist.vhdl
-- Design      : system_gcdip_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_comparator is
  port (
    \output_reg[6]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_nState_reg[0]_i_3\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_nState_reg[0]_i_3_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_comparator;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_comparator is
  signal gtOp_carry_n_1 : STD_LOGIC;
  signal gtOp_carry_n_2 : STD_LOGIC;
  signal gtOp_carry_n_3 : STD_LOGIC;
  signal ltOp_carry_n_1 : STD_LOGIC;
  signal ltOp_carry_n_2 : STD_LOGIC;
  signal ltOp_carry_n_3 : STD_LOGIC;
  signal NLW_gtOp_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ltOp_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of gtOp_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of ltOp_carry : label is 11;
begin
gtOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \output_reg[6]\(0),
      CO(2) => gtOp_carry_n_1,
      CO(1) => gtOp_carry_n_2,
      CO(0) => gtOp_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => DI(3 downto 0),
      O(3 downto 0) => NLW_gtOp_carry_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => S(3 downto 0)
    );
ltOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => CO(0),
      CO(2) => ltOp_carry_n_1,
      CO(1) => ltOp_carry_n_2,
      CO(0) => ltOp_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => \FSM_sequential_nState_reg[0]_i_3\(3 downto 0),
      O(3 downto 0) => NLW_ltOp_carry_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => \FSM_sequential_nState_reg[0]_i_3_0\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fsm is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    xsel : out STD_LOGIC;
    ysel : out STD_LOGIC;
    \FSM_sequential_cState_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_cState_reg[2]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    done_prev_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    start_prev_reg : out STD_LOGIC;
    done_prev : in STD_LOGIC;
    start_prev : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    reg_start_i : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_cState_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fsm;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fsm is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_sequential_nState_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_nState_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_nState_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal cState : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal enable_reg_i_1_n_0 : STD_LOGIC;
  signal enable_reg_i_2_n_0 : STD_LOGIC;
  signal \nState__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \nState__1\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xld_reg_i_1_n_0 : STD_LOGIC;
  signal xsel_reg_i_1_n_0 : STD_LOGIC;
  signal xsel_reg_i_2_n_0 : STD_LOGIC;
  signal yld_reg_i_1_n_0 : STD_LOGIC;
  signal ysel_reg_i_1_n_0 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_cState_reg[0]\ : label is "s1:010,s2:011,init:000,s0:001,s3:100,s5:110,s4:101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_cState_reg[1]\ : label is "s1:010,s2:011,init:000,s0:001,s3:100,s5:110,s4:101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_cState_reg[2]\ : label is "s1:010,s2:011,init:000,s0:001,s3:100,s5:110,s4:101";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \FSM_sequential_nState_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \FSM_sequential_nState_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \FSM_sequential_nState_reg[2]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_nState_reg[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_sequential_nState_reg[2]_i_2\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of enable_reg : label is "LD";
  attribute SOFT_HLUTNM of enable_reg_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of enable_reg_i_2 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of reg_start_i_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \slv_reg3[7]_i_1\ : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of xld_reg : label is "LD";
  attribute XILINX_LEGACY_PRIM of xsel_reg : label is "LD";
  attribute SOFT_HLUTNM of xsel_reg_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of xsel_reg_i_2 : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of yld_reg : label is "LD";
  attribute SOFT_HLUTNM of yld_reg_i_1 : label is "soft_lutpair3";
  attribute XILINX_LEGACY_PRIM of ysel_reg : label is "LD";
  attribute SOFT_HLUTNM of ysel_reg_i_1 : label is "soft_lutpair2";
begin
  E(0) <= \^e\(0);
\FSM_sequential_cState_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \nState__0\(0),
      Q => cState(0)
    );
\FSM_sequential_cState_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \nState__0\(1),
      Q => cState(1)
    );
\FSM_sequential_cState_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => AR(0),
      D => \nState__0\(2),
      Q => cState(2)
    );
\FSM_sequential_nState_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \nState__1\(0),
      G => \FSM_sequential_nState_reg[2]_i_2_n_0\,
      GE => '1',
      Q => \nState__0\(0)
    );
\FSM_sequential_nState_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \FSM_sequential_nState_reg[0]_i_2_n_0\,
      I1 => \FSM_sequential_nState_reg[0]_i_3_n_0\,
      O => \nState__1\(0),
      S => cState(0)
    );
\FSM_sequential_nState_reg[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => cState(1),
      I1 => cState(2),
      I2 => reg_start_i,
      O => \FSM_sequential_nState_reg[0]_i_2_n_0\
    );
\FSM_sequential_nState_reg[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF0800"
    )
        port map (
      I0 => CO(0),
      I1 => s00_axi_aresetn,
      I2 => \FSM_sequential_cState_reg[1]_0\(0),
      I3 => cState(1),
      I4 => cState(2),
      O => \FSM_sequential_nState_reg[0]_i_3_n_0\
    );
\FSM_sequential_nState_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \nState__1\(1),
      G => \FSM_sequential_nState_reg[2]_i_2_n_0\,
      GE => '1',
      Q => \nState__0\(1)
    );
\FSM_sequential_nState_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF1FFFFF00"
    )
        port map (
      I0 => CO(0),
      I1 => \FSM_sequential_cState_reg[1]_0\(0),
      I2 => s00_axi_aresetn,
      I3 => cState(0),
      I4 => cState(1),
      I5 => cState(2),
      O => \nState__1\(1)
    );
\FSM_sequential_nState_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \nState__1\(2),
      G => \FSM_sequential_nState_reg[2]_i_2_n_0\,
      GE => '1',
      Q => \nState__0\(2)
    );
\FSM_sequential_nState_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => cState(2),
      I1 => cState(1),
      I2 => cState(0),
      O => \nState__1\(2)
    );
\FSM_sequential_nState_reg[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5DFF"
    )
        port map (
      I0 => cState(1),
      I1 => s00_axi_aresetn,
      I2 => cState(2),
      I3 => cState(0),
      O => \FSM_sequential_nState_reg[2]_i_2_n_0\
    );
enable_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => enable_reg_i_1_n_0,
      G => enable_reg_i_2_n_0,
      GE => '1',
      Q => \^e\(0)
    );
enable_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => cState(1),
      I1 => cState(2),
      I2 => cState(0),
      O => enable_reg_i_1_n_0
    );
enable_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5E"
    )
        port map (
      I0 => cState(0),
      I1 => cState(2),
      I2 => cState(1),
      O => enable_reg_i_2_n_0
    );
reg_start_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4FF4444"
    )
        port map (
      I0 => start_prev,
      I1 => Q(0),
      I2 => done_prev,
      I3 => \^e\(0),
      I4 => reg_start_i,
      O => start_prev_reg
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^e\(0),
      I1 => done_prev,
      O => done_prev_reg(0)
    );
xld_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => xld_reg_i_1_n_0,
      G => xsel_reg_i_2_n_0,
      GE => '1',
      Q => \FSM_sequential_cState_reg[0]_0\(0)
    );
xld_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cState(0),
      O => xld_reg_i_1_n_0
    );
xsel_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => xsel_reg_i_1_n_0,
      G => xsel_reg_i_2_n_0,
      GE => '1',
      Q => xsel
    );
xsel_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cState(2),
      I1 => cState(0),
      O => xsel_reg_i_1_n_0
    );
xsel_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7E"
    )
        port map (
      I0 => cState(0),
      I1 => cState(2),
      I2 => cState(1),
      O => xsel_reg_i_2_n_0
    );
yld_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => yld_reg_i_1_n_0,
      G => xsel_reg_i_2_n_0,
      GE => '1',
      Q => \FSM_sequential_cState_reg[2]_0\(0)
    );
yld_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => cState(2),
      I1 => cState(0),
      I2 => cState(1),
      O => yld_reg_i_1_n_0
    );
ysel_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ysel_reg_i_1_n_0,
      G => xsel_reg_i_2_n_0,
      GE => '1',
      Q => ysel
    );
ysel_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => cState(0),
      I1 => cState(2),
      I2 => cState(1),
      O => ysel_reg_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis is
  port (
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \output_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis is
  signal \^ar\ : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  AR(0) <= \^ar\(0);
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^ar\(0)
    );
\output_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(0),
      Q => \output_reg[7]_0\(0)
    );
\output_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(1),
      Q => \output_reg[7]_0\(1)
    );
\output_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(2),
      Q => \output_reg[7]_0\(2)
    );
\output_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(3),
      Q => \output_reg[7]_0\(3)
    );
\output_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(4),
      Q => \output_reg[7]_0\(4)
    );
\output_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(5),
      Q => \output_reg[7]_0\(5)
    );
\output_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(6),
      Q => \output_reg[7]_0\(6)
    );
\output_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => \^ar\(0),
      D => D(7),
      Q => \output_reg[7]_0\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_0 is
  port (
    \output_reg[6]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ltOp_carry : in STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_0 : entity is "regis";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_0 is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
ltOp_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(6),
      I1 => ltOp_carry(6),
      I2 => ltOp_carry(7),
      I3 => \^q\(7),
      O => \output_reg[6]_0\(3)
    );
ltOp_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(4),
      I1 => ltOp_carry(4),
      I2 => ltOp_carry(5),
      I3 => \^q\(5),
      O => \output_reg[6]_0\(2)
    );
ltOp_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(2),
      I1 => ltOp_carry(2),
      I2 => ltOp_carry(3),
      I3 => \^q\(3),
      O => \output_reg[6]_0\(1)
    );
ltOp_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(0),
      I1 => ltOp_carry(0),
      I2 => ltOp_carry(1),
      I3 => \^q\(1),
      O => \output_reg[6]_0\(0)
    );
\output_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(0),
      Q => \^q\(0)
    );
\output_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(1),
      Q => \^q\(1)
    );
\output_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(2),
      Q => \^q\(2)
    );
\output_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(3),
      Q => \^q\(3)
    );
\output_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(4),
      Q => \^q\(4)
    );
\output_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(5),
      Q => \^q\(5)
    );
\output_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(6),
      Q => \^q\(6)
    );
\output_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(7),
      Q => \^q\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_1 is
  port (
    \output_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    eqOp : out STD_LOGIC;
    \output_reg[7]_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn_0 : out STD_LOGIC;
    \output_reg[6]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \output_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \output_reg[3]_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtOp_carry : in STD_LOGIC_VECTOR ( 7 downto 0 );
    minusOp_carry : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aresetn : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_1 : entity is "regis";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_1 is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
gtOp_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(6),
      I1 => gtOp_carry(6),
      I2 => gtOp_carry(7),
      I3 => \^q\(7),
      O => DI(3)
    );
gtOp_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(4),
      I1 => gtOp_carry(4),
      I2 => gtOp_carry(5),
      I3 => \^q\(5),
      O => DI(2)
    );
gtOp_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(2),
      I1 => gtOp_carry(2),
      I2 => gtOp_carry(3),
      I3 => \^q\(3),
      O => DI(1)
    );
gtOp_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F4"
    )
        port map (
      I0 => \^q\(0),
      I1 => gtOp_carry(0),
      I2 => gtOp_carry(1),
      I3 => \^q\(1),
      O => DI(0)
    );
gtOp_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(6),
      I1 => gtOp_carry(7),
      I2 => \^q\(7),
      I3 => gtOp_carry(6),
      O => S(3)
    );
gtOp_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      I2 => gtOp_carry(5),
      I3 => gtOp_carry(4),
      O => S(2)
    );
gtOp_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => gtOp_carry(3),
      I3 => gtOp_carry(2),
      O => S(1)
    );
gtOp_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => gtOp_carry(1),
      I3 => gtOp_carry(0),
      O => S(0)
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9CCC"
    )
        port map (
      I0 => \^q\(7),
      I1 => gtOp_carry(7),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      O => \output_reg[7]_0\(3)
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => gtOp_carry(6),
      I1 => \^q\(6),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      O => \output_reg[7]_0\(2)
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => gtOp_carry(5),
      I1 => \^q\(5),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      O => \output_reg[7]_0\(1)
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => gtOp_carry(4),
      I1 => \^q\(4),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      O => \output_reg[7]_0\(0)
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => minusOp_carry(0),
      O => eqOp
    );
\i__carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => gtOp_carry(3),
      I1 => \^q\(3),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      O => \output_reg[3]_1\(3)
    );
\i__carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => gtOp_carry(2),
      I1 => \^q\(2),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      O => \output_reg[3]_1\(2)
    );
\i__carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => gtOp_carry(1),
      I1 => \^q\(1),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      O => \output_reg[3]_1\(1)
    );
\i__carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => gtOp_carry(0),
      I1 => \^q\(0),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      O => \output_reg[3]_1\(0)
    );
ltOp_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(6),
      I1 => gtOp_carry(7),
      I2 => \^q\(7),
      I3 => gtOp_carry(6),
      O => \output_reg[6]_0\(3)
    );
ltOp_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      I2 => gtOp_carry(5),
      I3 => gtOp_carry(4),
      O => \output_reg[6]_0\(2)
    );
ltOp_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => gtOp_carry(3),
      I3 => gtOp_carry(2),
      O => \output_reg[6]_0\(1)
    );
ltOp_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => gtOp_carry(1),
      I3 => gtOp_carry(0),
      O => \output_reg[6]_0\(0)
    );
\minusOp_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAA6A"
    )
        port map (
      I0 => \^q\(7),
      I1 => CO(0),
      I2 => s00_axi_aresetn,
      I3 => minusOp_carry(0),
      I4 => gtOp_carry(7),
      O => \output_reg[7]_1\(3)
    );
\minusOp_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9AAAAAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => gtOp_carry(6),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      I4 => CO(0),
      O => \output_reg[7]_1\(2)
    );
\minusOp_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9AAAAAA"
    )
        port map (
      I0 => \^q\(5),
      I1 => gtOp_carry(5),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      I4 => CO(0),
      O => \output_reg[7]_1\(1)
    );
\minusOp_carry__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9AAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => gtOp_carry(4),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      I4 => CO(0),
      O => \output_reg[7]_1\(0)
    );
minusOp_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => minusOp_carry(0),
      I1 => s00_axi_aresetn,
      I2 => CO(0),
      O => s00_axi_aresetn_0
    );
minusOp_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9AAAAAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => gtOp_carry(3),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      I4 => CO(0),
      O => \output_reg[3]_0\(3)
    );
minusOp_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9AAAAAA"
    )
        port map (
      I0 => \^q\(2),
      I1 => gtOp_carry(2),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      I4 => CO(0),
      O => \output_reg[3]_0\(2)
    );
minusOp_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9AAAAAA"
    )
        port map (
      I0 => \^q\(1),
      I1 => gtOp_carry(1),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      I4 => CO(0),
      O => \output_reg[3]_0\(1)
    );
minusOp_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9AAAAAA"
    )
        port map (
      I0 => \^q\(0),
      I1 => gtOp_carry(0),
      I2 => minusOp_carry(0),
      I3 => s00_axi_aresetn,
      I4 => CO(0),
      O => \output_reg[3]_0\(0)
    );
\output_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(0),
      Q => \^q\(0)
    );
\output_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(1),
      Q => \^q\(1)
    );
\output_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(2),
      Q => \^q\(2)
    );
\output_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(3),
      Q => \^q\(3)
    );
\output_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(4),
      Q => \^q\(4)
    );
\output_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(5),
      Q => \^q\(5)
    );
\output_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(6),
      Q => \^q\(6)
    );
\output_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => E(0),
      CLR => AR(0),
      D => D(7),
      Q => \^q\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_subtractor is
  port (
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aresetn_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_aresetn_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \output_reg[3]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \output_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    eqOp : in STD_LOGIC;
    \output_reg[7]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \output_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \output_reg[7]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ysel : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    \output_reg[7]_2\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    xsel : in STD_LOGIC;
    \output_reg[7]_3\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_subtractor;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_subtractor is
  signal \minusOp_carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_carry__0_n_3\ : STD_LOGIC;
  signal minusOp_carry_n_0 : STD_LOGIC;
  signal minusOp_carry_n_1 : STD_LOGIC;
  signal minusOp_carry_n_2 : STD_LOGIC;
  signal minusOp_carry_n_3 : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal xout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal yout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_minusOp_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_minusOp_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of minusOp_carry : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_inferred__0/i__carry__0\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \output[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \output[0]_i_1__1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \output[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \output[1]_i_1__1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \output[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \output[2]_i_1__1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \output[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \output[3]_i_1__1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \output[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \output[4]_i_1__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \output[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \output[5]_i_1__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \output[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \output[6]_i_1__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \output[7]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \output[7]_i_1__1\ : label is "soft_lutpair5";
begin
minusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => minusOp_carry_n_0,
      CO(2) => minusOp_carry_n_1,
      CO(1) => minusOp_carry_n_2,
      CO(0) => minusOp_carry_n_3,
      CYINIT => \output_reg[3]\,
      DI(3 downto 0) => Q(3 downto 0),
      O(3 downto 0) => yout(3 downto 0),
      S(3 downto 0) => S(3 downto 0)
    );
\minusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => minusOp_carry_n_0,
      CO(3) => \NLW_minusOp_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \minusOp_carry__0_n_1\,
      CO(1) => \minusOp_carry__0_n_2\,
      CO(0) => \minusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => Q(6 downto 4),
      O(3 downto 0) => yout(7 downto 4),
      S(3 downto 0) => \output_reg[7]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \minusOp_inferred__0/i__carry_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry_n_3\,
      CYINIT => eqOp,
      DI(3 downto 0) => \output_reg[7]_0\(3 downto 0),
      O(3 downto 0) => xout(3 downto 0),
      S(3 downto 0) => \output_reg[3]_0\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry_n_0\,
      CO(3) => \NLW_minusOp_inferred__0/i__carry__0_CO_UNCONNECTED\(3),
      CO(2) => \minusOp_inferred__0/i__carry__0_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__0_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \output_reg[7]_0\(6 downto 4),
      O(3 downto 0) => xout(7 downto 4),
      S(3 downto 0) => \output_reg[7]_1\(3 downto 0)
    );
\output[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(0),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(0),
      O => D(0)
    );
\output[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(0),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(0),
      O => s00_axi_aresetn_0(0)
    );
\output[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(0),
      O => s00_axi_aresetn_1(0)
    );
\output[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(1),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(1),
      O => D(1)
    );
\output[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(1),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(1),
      O => s00_axi_aresetn_0(1)
    );
\output[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(1),
      O => s00_axi_aresetn_1(1)
    );
\output[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(2),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(2),
      O => D(2)
    );
\output[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(2),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(2),
      O => s00_axi_aresetn_0(2)
    );
\output[2]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(2),
      O => s00_axi_aresetn_1(2)
    );
\output[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(3),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(3),
      O => D(3)
    );
\output[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(3),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(3),
      O => s00_axi_aresetn_0(3)
    );
\output[3]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(3),
      O => s00_axi_aresetn_1(3)
    );
\output[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(4),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(4),
      O => D(4)
    );
\output[4]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(4),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(4),
      O => s00_axi_aresetn_0(4)
    );
\output[4]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(4),
      O => s00_axi_aresetn_1(4)
    );
\output[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(5),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(5),
      O => D(5)
    );
\output[5]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(5),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(5),
      O => s00_axi_aresetn_0(5)
    );
\output[5]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(5),
      O => s00_axi_aresetn_1(5)
    );
\output[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(6),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(6),
      O => D(6)
    );
\output[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(6),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(6),
      O => s00_axi_aresetn_0(6)
    );
\output[6]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(6),
      O => s00_axi_aresetn_1(6)
    );
\output[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => yout(7),
      I1 => ysel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_2\(7),
      O => D(7)
    );
\output[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => xout(7),
      I1 => xsel,
      I2 => s00_axi_aresetn,
      I3 => \output_reg[7]_3\(7),
      O => s00_axi_aresetn_0(7)
    );
\output[7]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => xout(7),
      O => s00_axi_aresetn_1(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    done_prev_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    start_prev_reg : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \output_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    done_prev : in STD_LOGIC;
    start_prev : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    reg_start_i : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    \output_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \output_reg[7]_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal X_REG_n_0 : STD_LOGIC;
  signal X_REG_n_1 : STD_LOGIC;
  signal X_REG_n_10 : STD_LOGIC;
  signal X_REG_n_11 : STD_LOGIC;
  signal X_REG_n_2 : STD_LOGIC;
  signal X_REG_n_3 : STD_LOGIC;
  signal X_REG_n_4 : STD_LOGIC;
  signal X_REG_n_5 : STD_LOGIC;
  signal X_REG_n_6 : STD_LOGIC;
  signal X_REG_n_7 : STD_LOGIC;
  signal X_REG_n_8 : STD_LOGIC;
  signal X_REG_n_9 : STD_LOGIC;
  signal X_SUB_n_0 : STD_LOGIC;
  signal X_SUB_n_1 : STD_LOGIC;
  signal X_SUB_n_16 : STD_LOGIC;
  signal X_SUB_n_17 : STD_LOGIC;
  signal X_SUB_n_18 : STD_LOGIC;
  signal X_SUB_n_19 : STD_LOGIC;
  signal X_SUB_n_2 : STD_LOGIC;
  signal X_SUB_n_20 : STD_LOGIC;
  signal X_SUB_n_21 : STD_LOGIC;
  signal X_SUB_n_22 : STD_LOGIC;
  signal X_SUB_n_23 : STD_LOGIC;
  signal X_SUB_n_3 : STD_LOGIC;
  signal X_SUB_n_4 : STD_LOGIC;
  signal X_SUB_n_5 : STD_LOGIC;
  signal X_SUB_n_6 : STD_LOGIC;
  signal X_SUB_n_7 : STD_LOGIC;
  signal Y_REG_n_0 : STD_LOGIC;
  signal Y_REG_n_1 : STD_LOGIC;
  signal Y_REG_n_10 : STD_LOGIC;
  signal Y_REG_n_11 : STD_LOGIC;
  signal Y_REG_n_13 : STD_LOGIC;
  signal Y_REG_n_14 : STD_LOGIC;
  signal Y_REG_n_15 : STD_LOGIC;
  signal Y_REG_n_16 : STD_LOGIC;
  signal Y_REG_n_17 : STD_LOGIC;
  signal Y_REG_n_18 : STD_LOGIC;
  signal Y_REG_n_19 : STD_LOGIC;
  signal Y_REG_n_2 : STD_LOGIC;
  signal Y_REG_n_20 : STD_LOGIC;
  signal Y_REG_n_21 : STD_LOGIC;
  signal Y_REG_n_22 : STD_LOGIC;
  signal Y_REG_n_23 : STD_LOGIC;
  signal Y_REG_n_24 : STD_LOGIC;
  signal Y_REG_n_25 : STD_LOGIC;
  signal Y_REG_n_26 : STD_LOGIC;
  signal Y_REG_n_27 : STD_LOGIC;
  signal Y_REG_n_28 : STD_LOGIC;
  signal Y_REG_n_29 : STD_LOGIC;
  signal Y_REG_n_3 : STD_LOGIC;
  signal Y_REG_n_30 : STD_LOGIC;
  signal Y_REG_n_31 : STD_LOGIC;
  signal Y_REG_n_32 : STD_LOGIC;
  signal Y_REG_n_33 : STD_LOGIC;
  signal Y_REG_n_34 : STD_LOGIC;
  signal Y_REG_n_35 : STD_LOGIC;
  signal Y_REG_n_36 : STD_LOGIC;
  signal Y_REG_n_37 : STD_LOGIC;
  signal Y_REG_n_4 : STD_LOGIC;
  signal Y_REG_n_5 : STD_LOGIC;
  signal Y_REG_n_6 : STD_LOGIC;
  signal Y_REG_n_7 : STD_LOGIC;
  signal Y_REG_n_8 : STD_LOGIC;
  signal Y_REG_n_9 : STD_LOGIC;
  signal eqOp : STD_LOGIC;
  signal gtOp : STD_LOGIC;
  signal input : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sel : STD_LOGIC;
  signal xld : STD_LOGIC;
  signal xsel : STD_LOGIC;
  signal yld : STD_LOGIC;
  signal ysel : STD_LOGIC;
begin
  E(0) <= \^e\(0);
  SR(0) <= \^sr\(0);
OUT_REG: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis
     port map (
      AR(0) => \^sr\(0),
      D(7) => X_SUB_n_16,
      D(6) => X_SUB_n_17,
      D(5) => X_SUB_n_18,
      D(4) => X_SUB_n_19,
      D(3) => X_SUB_n_20,
      D(2) => X_SUB_n_21,
      D(1) => X_SUB_n_22,
      D(0) => X_SUB_n_23,
      E(0) => \^e\(0),
      \output_reg[7]_0\(7 downto 0) => \output_reg[7]\(7 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn
    );
TOFSM: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fsm
     port map (
      AR(0) => \^sr\(0),
      CO(0) => sel,
      E(0) => \^e\(0),
      \FSM_sequential_cState_reg[0]_0\(0) => xld,
      \FSM_sequential_cState_reg[1]_0\(0) => gtOp,
      \FSM_sequential_cState_reg[2]_0\(0) => yld,
      Q(0) => Q(0),
      done_prev => done_prev,
      done_prev_reg(0) => done_prev_reg(0),
      reg_start_i => reg_start_i,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      start_prev => start_prev,
      start_prev_reg => start_prev_reg,
      xsel => xsel,
      ysel => ysel
    );
U_COMP: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_comparator
     port map (
      CO(0) => sel,
      DI(3) => Y_REG_n_22,
      DI(2) => Y_REG_n_23,
      DI(1) => Y_REG_n_24,
      DI(0) => Y_REG_n_25,
      \FSM_sequential_nState_reg[0]_i_3\(3) => X_REG_n_0,
      \FSM_sequential_nState_reg[0]_i_3\(2) => X_REG_n_1,
      \FSM_sequential_nState_reg[0]_i_3\(1) => X_REG_n_2,
      \FSM_sequential_nState_reg[0]_i_3\(0) => X_REG_n_3,
      \FSM_sequential_nState_reg[0]_i_3_0\(3) => Y_REG_n_18,
      \FSM_sequential_nState_reg[0]_i_3_0\(2) => Y_REG_n_19,
      \FSM_sequential_nState_reg[0]_i_3_0\(1) => Y_REG_n_20,
      \FSM_sequential_nState_reg[0]_i_3_0\(0) => Y_REG_n_21,
      S(3) => Y_REG_n_26,
      S(2) => Y_REG_n_27,
      S(1) => Y_REG_n_28,
      S(0) => Y_REG_n_29,
      \output_reg[6]\(0) => gtOp
    );
X_REG: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_0
     port map (
      AR(0) => \^sr\(0),
      D(7 downto 0) => input(7 downto 0),
      E(0) => xld,
      Q(7) => X_REG_n_4,
      Q(6) => X_REG_n_5,
      Q(5) => X_REG_n_6,
      Q(4) => X_REG_n_7,
      Q(3) => X_REG_n_8,
      Q(2) => X_REG_n_9,
      Q(1) => X_REG_n_10,
      Q(0) => X_REG_n_11,
      ltOp_carry(7) => Y_REG_n_4,
      ltOp_carry(6) => Y_REG_n_5,
      ltOp_carry(5) => Y_REG_n_6,
      ltOp_carry(4) => Y_REG_n_7,
      ltOp_carry(3) => Y_REG_n_8,
      ltOp_carry(2) => Y_REG_n_9,
      ltOp_carry(1) => Y_REG_n_10,
      ltOp_carry(0) => Y_REG_n_11,
      \output_reg[6]_0\(3) => X_REG_n_0,
      \output_reg[6]_0\(2) => X_REG_n_1,
      \output_reg[6]_0\(1) => X_REG_n_2,
      \output_reg[6]_0\(0) => X_REG_n_3,
      s00_axi_aclk => s00_axi_aclk
    );
X_SUB: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_subtractor
     port map (
      D(7) => X_SUB_n_0,
      D(6) => X_SUB_n_1,
      D(5) => X_SUB_n_2,
      D(4) => X_SUB_n_3,
      D(3) => X_SUB_n_4,
      D(2) => X_SUB_n_5,
      D(1) => X_SUB_n_6,
      D(0) => X_SUB_n_7,
      Q(6) => Y_REG_n_5,
      Q(5) => Y_REG_n_6,
      Q(4) => Y_REG_n_7,
      Q(3) => Y_REG_n_8,
      Q(2) => Y_REG_n_9,
      Q(1) => Y_REG_n_10,
      Q(0) => Y_REG_n_11,
      S(3) => Y_REG_n_30,
      S(2) => Y_REG_n_31,
      S(1) => Y_REG_n_32,
      S(0) => Y_REG_n_33,
      eqOp => eqOp,
      \output_reg[3]\ => Y_REG_n_17,
      \output_reg[3]_0\(3) => Y_REG_n_34,
      \output_reg[3]_0\(2) => Y_REG_n_35,
      \output_reg[3]_0\(1) => Y_REG_n_36,
      \output_reg[3]_0\(0) => Y_REG_n_37,
      \output_reg[7]\(3) => Y_REG_n_13,
      \output_reg[7]\(2) => Y_REG_n_14,
      \output_reg[7]\(1) => Y_REG_n_15,
      \output_reg[7]\(0) => Y_REG_n_16,
      \output_reg[7]_0\(6) => X_REG_n_5,
      \output_reg[7]_0\(5) => X_REG_n_6,
      \output_reg[7]_0\(4) => X_REG_n_7,
      \output_reg[7]_0\(3) => X_REG_n_8,
      \output_reg[7]_0\(2) => X_REG_n_9,
      \output_reg[7]_0\(1) => X_REG_n_10,
      \output_reg[7]_0\(0) => X_REG_n_11,
      \output_reg[7]_1\(3) => Y_REG_n_0,
      \output_reg[7]_1\(2) => Y_REG_n_1,
      \output_reg[7]_1\(1) => Y_REG_n_2,
      \output_reg[7]_1\(0) => Y_REG_n_3,
      \output_reg[7]_2\(7 downto 0) => \output_reg[7]_0\(7 downto 0),
      \output_reg[7]_3\(7 downto 0) => \output_reg[7]_1\(7 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0(7 downto 0) => input(7 downto 0),
      s00_axi_aresetn_1(7) => X_SUB_n_16,
      s00_axi_aresetn_1(6) => X_SUB_n_17,
      s00_axi_aresetn_1(5) => X_SUB_n_18,
      s00_axi_aresetn_1(4) => X_SUB_n_19,
      s00_axi_aresetn_1(3) => X_SUB_n_20,
      s00_axi_aresetn_1(2) => X_SUB_n_21,
      s00_axi_aresetn_1(1) => X_SUB_n_22,
      s00_axi_aresetn_1(0) => X_SUB_n_23,
      xsel => xsel,
      ysel => ysel
    );
Y_REG: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_regis_1
     port map (
      AR(0) => \^sr\(0),
      CO(0) => sel,
      D(7) => X_SUB_n_0,
      D(6) => X_SUB_n_1,
      D(5) => X_SUB_n_2,
      D(4) => X_SUB_n_3,
      D(3) => X_SUB_n_4,
      D(2) => X_SUB_n_5,
      D(1) => X_SUB_n_6,
      D(0) => X_SUB_n_7,
      DI(3) => Y_REG_n_22,
      DI(2) => Y_REG_n_23,
      DI(1) => Y_REG_n_24,
      DI(0) => Y_REG_n_25,
      E(0) => yld,
      Q(7) => Y_REG_n_4,
      Q(6) => Y_REG_n_5,
      Q(5) => Y_REG_n_6,
      Q(4) => Y_REG_n_7,
      Q(3) => Y_REG_n_8,
      Q(2) => Y_REG_n_9,
      Q(1) => Y_REG_n_10,
      Q(0) => Y_REG_n_11,
      S(3) => Y_REG_n_26,
      S(2) => Y_REG_n_27,
      S(1) => Y_REG_n_28,
      S(0) => Y_REG_n_29,
      eqOp => eqOp,
      gtOp_carry(7) => X_REG_n_4,
      gtOp_carry(6) => X_REG_n_5,
      gtOp_carry(5) => X_REG_n_6,
      gtOp_carry(4) => X_REG_n_7,
      gtOp_carry(3) => X_REG_n_8,
      gtOp_carry(2) => X_REG_n_9,
      gtOp_carry(1) => X_REG_n_10,
      gtOp_carry(0) => X_REG_n_11,
      minusOp_carry(0) => gtOp,
      \output_reg[3]_0\(3) => Y_REG_n_30,
      \output_reg[3]_0\(2) => Y_REG_n_31,
      \output_reg[3]_0\(1) => Y_REG_n_32,
      \output_reg[3]_0\(0) => Y_REG_n_33,
      \output_reg[3]_1\(3) => Y_REG_n_34,
      \output_reg[3]_1\(2) => Y_REG_n_35,
      \output_reg[3]_1\(1) => Y_REG_n_36,
      \output_reg[3]_1\(0) => Y_REG_n_37,
      \output_reg[6]_0\(3) => Y_REG_n_18,
      \output_reg[6]_0\(2) => Y_REG_n_19,
      \output_reg[6]_0\(1) => Y_REG_n_20,
      \output_reg[6]_0\(0) => Y_REG_n_21,
      \output_reg[7]_0\(3) => Y_REG_n_0,
      \output_reg[7]_0\(2) => Y_REG_n_1,
      \output_reg[7]_0\(1) => Y_REG_n_2,
      \output_reg[7]_0\(0) => Y_REG_n_3,
      \output_reg[7]_1\(3) => Y_REG_n_13,
      \output_reg[7]_1\(2) => Y_REG_n_14,
      \output_reg[7]_1\(1) => Y_REG_n_15,
      \output_reg[7]_1\(0) => Y_REG_n_16,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => Y_REG_n_17
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0_S00_AXI is
  port (
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0_S00_AXI is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal done_i : STD_LOGIC;
  signal done_prev : STD_LOGIC;
  signal done_pulse : STD_LOGIC;
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg_start_i : STD_LOGIC;
  signal reg_x_i : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal reg_y_i : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rst_gcd : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \slv_reg0[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[0]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[9]\ : STD_LOGIC;
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[0]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[9]\ : STD_LOGIC;
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[0]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[9]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[0]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg3_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__2\ : STD_LOGIC;
  signal start_prev : STD_LOGIC;
  signal u_gcd_core_n_10 : STD_LOGIC;
  signal u_gcd_core_n_11 : STD_LOGIC;
  signal u_gcd_core_n_2 : STD_LOGIC;
  signal u_gcd_core_n_4 : STD_LOGIC;
  signal u_gcd_core_n_5 : STD_LOGIC;
  signal u_gcd_core_n_6 : STD_LOGIC;
  signal u_gcd_core_n_7 : STD_LOGIC;
  signal u_gcd_core_n_8 : STD_LOGIC;
  signal u_gcd_core_n_9 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair14";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF8CCC8CCC8CCC"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => aw_en_reg_n_0,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => rst_gcd
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => rst_gcd
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => rst_gcd
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => rst_gcd
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_awvalid,
      I2 => s00_axi_wvalid,
      I3 => aw_en_reg_n_0,
      I4 => \^s_axi_awready\,
      I5 => axi_awaddr(2),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_awvalid,
      I2 => s00_axi_wvalid,
      I3 => aw_en_reg_n_0,
      I4 => \^s_axi_awready\,
      I5 => axi_awaddr(3),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => axi_awaddr(2),
      R => rst_gcd
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => axi_awaddr(3),
      R => rst_gcd
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => aw_en_reg_n_0,
      I3 => \^s_axi_awready\,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => rst_gcd
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^s_axi_wready\,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => rst_gcd
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[0]\,
      I1 => \slv_reg0_reg_n_0_[0]\,
      I2 => \slv_reg3_reg_n_0_[0]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[0]\,
      O => reg_data_out(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[10]\,
      I1 => \slv_reg0_reg_n_0_[10]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[10]\,
      O => reg_data_out(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[11]\,
      I1 => \slv_reg0_reg_n_0_[11]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[11]\,
      O => reg_data_out(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[12]\,
      I1 => \slv_reg0_reg_n_0_[12]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[12]\,
      O => reg_data_out(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[13]\,
      I1 => \slv_reg0_reg_n_0_[13]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[13]\,
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[14]\,
      I1 => \slv_reg0_reg_n_0_[14]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[14]\,
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[15]\,
      I1 => \slv_reg0_reg_n_0_[15]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[15]\,
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[16]\,
      I1 => \slv_reg0_reg_n_0_[16]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[16]\,
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[17]\,
      I1 => \slv_reg0_reg_n_0_[17]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[17]\,
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[18]\,
      I1 => \slv_reg0_reg_n_0_[18]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[18]\,
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[19]\,
      I1 => \slv_reg0_reg_n_0_[19]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[19]\,
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[1]\,
      I1 => \slv_reg0_reg_n_0_[1]\,
      I2 => \slv_reg3_reg_n_0_[1]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[1]\,
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[20]\,
      I1 => \slv_reg0_reg_n_0_[20]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[20]\,
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[21]\,
      I1 => \slv_reg0_reg_n_0_[21]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[21]\,
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[22]\,
      I1 => \slv_reg0_reg_n_0_[22]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[22]\,
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[23]\,
      I1 => \slv_reg0_reg_n_0_[23]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[23]\,
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[24]\,
      I1 => \slv_reg0_reg_n_0_[24]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[24]\,
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[25]\,
      I1 => \slv_reg0_reg_n_0_[25]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[25]\,
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[26]\,
      I1 => \slv_reg0_reg_n_0_[26]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[26]\,
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[27]\,
      I1 => \slv_reg0_reg_n_0_[27]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[27]\,
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[28]\,
      I1 => \slv_reg0_reg_n_0_[28]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[28]\,
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[29]\,
      I1 => \slv_reg0_reg_n_0_[29]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[29]\,
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[2]\,
      I1 => \slv_reg0_reg_n_0_[2]\,
      I2 => \slv_reg3_reg_n_0_[2]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[2]\,
      O => reg_data_out(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[30]\,
      I1 => \slv_reg0_reg_n_0_[30]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[30]\,
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[31]\,
      I1 => \slv_reg0_reg_n_0_[31]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[31]\,
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[3]\,
      I1 => \slv_reg0_reg_n_0_[3]\,
      I2 => \slv_reg3_reg_n_0_[3]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[3]\,
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[4]\,
      I1 => \slv_reg0_reg_n_0_[4]\,
      I2 => \slv_reg3_reg_n_0_[4]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[4]\,
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[5]\,
      I1 => \slv_reg0_reg_n_0_[5]\,
      I2 => \slv_reg3_reg_n_0_[5]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[5]\,
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[6]\,
      I1 => \slv_reg0_reg_n_0_[6]\,
      I2 => \slv_reg3_reg_n_0_[6]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[6]\,
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[7]\,
      I1 => \slv_reg0_reg_n_0_[7]\,
      I2 => \slv_reg3_reg_n_0_[7]\,
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \slv_reg2_reg_n_0_[7]\,
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[8]\,
      I1 => \slv_reg0_reg_n_0_[8]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[8]\,
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[9]\,
      I1 => \slv_reg0_reg_n_0_[9]\,
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => \slv_reg2_reg_n_0_[9]\,
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => rst_gcd
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => rst_gcd
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => rst_gcd
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => rst_gcd
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => rst_gcd
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => rst_gcd
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => rst_gcd
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => rst_gcd
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => rst_gcd
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => rst_gcd
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => rst_gcd
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => rst_gcd
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => rst_gcd
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => rst_gcd
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => rst_gcd
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => rst_gcd
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => rst_gcd
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => rst_gcd
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => rst_gcd
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => rst_gcd
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => rst_gcd
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => rst_gcd
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => rst_gcd
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => rst_gcd
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => rst_gcd
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => rst_gcd
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => rst_gcd
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => rst_gcd
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => rst_gcd
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => rst_gcd
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => rst_gcd
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => rst_gcd
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => rst_gcd
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => aw_en_reg_n_0,
      I3 => \^s_axi_wready\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => rst_gcd
    );
done_prev_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => done_i,
      Q => done_prev,
      R => rst_gcd
    );
reg_start_i_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => u_gcd_core_n_2,
      Q => reg_start_i,
      R => rst_gcd
    );
\reg_x_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[0]\,
      Q => reg_x_i(0),
      R => rst_gcd
    );
\reg_x_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[1]\,
      Q => reg_x_i(1),
      R => rst_gcd
    );
\reg_x_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[2]\,
      Q => reg_x_i(2),
      R => rst_gcd
    );
\reg_x_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[3]\,
      Q => reg_x_i(3),
      R => rst_gcd
    );
\reg_x_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[4]\,
      Q => reg_x_i(4),
      R => rst_gcd
    );
\reg_x_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[5]\,
      Q => reg_x_i(5),
      R => rst_gcd
    );
\reg_x_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[6]\,
      Q => reg_x_i(6),
      R => rst_gcd
    );
\reg_x_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0_reg_n_0_[7]\,
      Q => reg_x_i(7),
      R => rst_gcd
    );
\reg_y_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[0]\,
      Q => reg_y_i(0),
      R => rst_gcd
    );
\reg_y_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[1]\,
      Q => reg_y_i(1),
      R => rst_gcd
    );
\reg_y_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[2]\,
      Q => reg_y_i(2),
      R => rst_gcd
    );
\reg_y_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[3]\,
      Q => reg_y_i(3),
      R => rst_gcd
    );
\reg_y_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[4]\,
      Q => reg_y_i(4),
      R => rst_gcd
    );
\reg_y_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[5]\,
      Q => reg_y_i(5),
      R => rst_gcd
    );
\reg_y_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[6]\,
      Q => reg_y_i(6),
      R => rst_gcd
    );
\reg_y_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg1_reg_n_0_[7]\,
      Q => reg_y_i(7),
      R => rst_gcd
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(1),
      O => \slv_reg0[15]_i_1_n_0\
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(2),
      O => \slv_reg0[23]_i_1_n_0\
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(3),
      O => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(0),
      O => \slv_reg0[7]_i_1_n_0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg0_reg_n_0_[0]\,
      R => rst_gcd
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg0_reg_n_0_[10]\,
      R => rst_gcd
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg0_reg_n_0_[11]\,
      R => rst_gcd
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg0_reg_n_0_[12]\,
      R => rst_gcd
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg0_reg_n_0_[13]\,
      R => rst_gcd
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg0_reg_n_0_[14]\,
      R => rst_gcd
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg0_reg_n_0_[15]\,
      R => rst_gcd
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg0_reg_n_0_[16]\,
      R => rst_gcd
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg0_reg_n_0_[17]\,
      R => rst_gcd
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg0_reg_n_0_[18]\,
      R => rst_gcd
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg0_reg_n_0_[19]\,
      R => rst_gcd
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg0_reg_n_0_[1]\,
      R => rst_gcd
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg0_reg_n_0_[20]\,
      R => rst_gcd
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg0_reg_n_0_[21]\,
      R => rst_gcd
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg0_reg_n_0_[22]\,
      R => rst_gcd
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg0_reg_n_0_[23]\,
      R => rst_gcd
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg0_reg_n_0_[24]\,
      R => rst_gcd
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg0_reg_n_0_[25]\,
      R => rst_gcd
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg0_reg_n_0_[26]\,
      R => rst_gcd
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg0_reg_n_0_[27]\,
      R => rst_gcd
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg0_reg_n_0_[28]\,
      R => rst_gcd
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg0_reg_n_0_[29]\,
      R => rst_gcd
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg0_reg_n_0_[2]\,
      R => rst_gcd
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg0_reg_n_0_[30]\,
      R => rst_gcd
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg0_reg_n_0_[31]\,
      R => rst_gcd
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg0_reg_n_0_[3]\,
      R => rst_gcd
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg0_reg_n_0_[4]\,
      R => rst_gcd
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg0_reg_n_0_[5]\,
      R => rst_gcd
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg0_reg_n_0_[6]\,
      R => rst_gcd
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg0_reg_n_0_[7]\,
      R => rst_gcd
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg0_reg_n_0_[8]\,
      R => rst_gcd
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg0_reg_n_0_[9]\,
      R => rst_gcd
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(1),
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(2),
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(3),
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^s_axi_wready\,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__2\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(0),
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg1_reg_n_0_[0]\,
      R => rst_gcd
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg1_reg_n_0_[10]\,
      R => rst_gcd
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg1_reg_n_0_[11]\,
      R => rst_gcd
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg1_reg_n_0_[12]\,
      R => rst_gcd
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg1_reg_n_0_[13]\,
      R => rst_gcd
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg1_reg_n_0_[14]\,
      R => rst_gcd
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg1_reg_n_0_[15]\,
      R => rst_gcd
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg1_reg_n_0_[16]\,
      R => rst_gcd
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg1_reg_n_0_[17]\,
      R => rst_gcd
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg1_reg_n_0_[18]\,
      R => rst_gcd
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg1_reg_n_0_[19]\,
      R => rst_gcd
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg1_reg_n_0_[1]\,
      R => rst_gcd
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg1_reg_n_0_[20]\,
      R => rst_gcd
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg1_reg_n_0_[21]\,
      R => rst_gcd
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg1_reg_n_0_[22]\,
      R => rst_gcd
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg1_reg_n_0_[23]\,
      R => rst_gcd
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg1_reg_n_0_[24]\,
      R => rst_gcd
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg1_reg_n_0_[25]\,
      R => rst_gcd
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg1_reg_n_0_[26]\,
      R => rst_gcd
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg1_reg_n_0_[27]\,
      R => rst_gcd
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg1_reg_n_0_[28]\,
      R => rst_gcd
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg1_reg_n_0_[29]\,
      R => rst_gcd
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg1_reg_n_0_[2]\,
      R => rst_gcd
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg1_reg_n_0_[30]\,
      R => rst_gcd
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg1_reg_n_0_[31]\,
      R => rst_gcd
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg1_reg_n_0_[3]\,
      R => rst_gcd
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg1_reg_n_0_[4]\,
      R => rst_gcd
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg1_reg_n_0_[5]\,
      R => rst_gcd
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg1_reg_n_0_[6]\,
      R => rst_gcd
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg1_reg_n_0_[7]\,
      R => rst_gcd
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg1_reg_n_0_[8]\,
      R => rst_gcd
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg1_reg_n_0_[9]\,
      R => rst_gcd
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(1),
      I3 => axi_awaddr(2),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(2),
      I3 => axi_awaddr(2),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(3),
      I3 => axi_awaddr(2),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(0),
      I3 => axi_awaddr(2),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg2_reg_n_0_[0]\,
      R => rst_gcd
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg2_reg_n_0_[10]\,
      R => rst_gcd
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg2_reg_n_0_[11]\,
      R => rst_gcd
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg2_reg_n_0_[12]\,
      R => rst_gcd
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg2_reg_n_0_[13]\,
      R => rst_gcd
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg2_reg_n_0_[14]\,
      R => rst_gcd
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg2_reg_n_0_[15]\,
      R => rst_gcd
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg2_reg_n_0_[16]\,
      R => rst_gcd
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg2_reg_n_0_[17]\,
      R => rst_gcd
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg2_reg_n_0_[18]\,
      R => rst_gcd
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg2_reg_n_0_[19]\,
      R => rst_gcd
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg2_reg_n_0_[1]\,
      R => rst_gcd
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg2_reg_n_0_[20]\,
      R => rst_gcd
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg2_reg_n_0_[21]\,
      R => rst_gcd
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg2_reg_n_0_[22]\,
      R => rst_gcd
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg2_reg_n_0_[23]\,
      R => rst_gcd
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg2_reg_n_0_[24]\,
      R => rst_gcd
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg2_reg_n_0_[25]\,
      R => rst_gcd
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg2_reg_n_0_[26]\,
      R => rst_gcd
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg2_reg_n_0_[27]\,
      R => rst_gcd
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg2_reg_n_0_[28]\,
      R => rst_gcd
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg2_reg_n_0_[29]\,
      R => rst_gcd
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg2_reg_n_0_[2]\,
      R => rst_gcd
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg2_reg_n_0_[30]\,
      R => rst_gcd
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg2_reg_n_0_[31]\,
      R => rst_gcd
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg2_reg_n_0_[3]\,
      R => rst_gcd
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg2_reg_n_0_[4]\,
      R => rst_gcd
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg2_reg_n_0_[5]\,
      R => rst_gcd
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg2_reg_n_0_[6]\,
      R => rst_gcd
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg2_reg_n_0_[7]\,
      R => rst_gcd
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg2_reg_n_0_[8]\,
      R => rst_gcd
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg2_reg_n_0_[9]\,
      R => rst_gcd
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_11,
      Q => \slv_reg3_reg_n_0_[0]\,
      R => rst_gcd
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_10,
      Q => \slv_reg3_reg_n_0_[1]\,
      R => rst_gcd
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_9,
      Q => \slv_reg3_reg_n_0_[2]\,
      R => rst_gcd
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_8,
      Q => \slv_reg3_reg_n_0_[3]\,
      R => rst_gcd
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_7,
      Q => \slv_reg3_reg_n_0_[4]\,
      R => rst_gcd
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_6,
      Q => \slv_reg3_reg_n_0_[5]\,
      R => rst_gcd
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_5,
      Q => \slv_reg3_reg_n_0_[6]\,
      R => rst_gcd
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => done_pulse,
      D => u_gcd_core_n_4,
      Q => \slv_reg3_reg_n_0_[7]\,
      R => rst_gcd
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s_axi_arready\,
      O => \slv_reg_rden__0\
    );
start_prev_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg2_reg_n_0_[0]\,
      Q => start_prev,
      R => rst_gcd
    );
u_gcd_core: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip
     port map (
      E(0) => done_i,
      Q(0) => \slv_reg2_reg_n_0_[0]\,
      SR(0) => rst_gcd,
      done_prev => done_prev,
      done_prev_reg(0) => done_pulse,
      \output_reg[7]\(7) => u_gcd_core_n_4,
      \output_reg[7]\(6) => u_gcd_core_n_5,
      \output_reg[7]\(5) => u_gcd_core_n_6,
      \output_reg[7]\(4) => u_gcd_core_n_7,
      \output_reg[7]\(3) => u_gcd_core_n_8,
      \output_reg[7]\(2) => u_gcd_core_n_9,
      \output_reg[7]\(1) => u_gcd_core_n_10,
      \output_reg[7]\(0) => u_gcd_core_n_11,
      \output_reg[7]_0\(7 downto 0) => reg_y_i(7 downto 0),
      \output_reg[7]_1\(7 downto 0) => reg_x_i(7 downto 0),
      reg_start_i => reg_start_i,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      start_prev => start_prev,
      start_prev_reg => u_gcd_core_n_2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0 is
  port (
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0 is
begin
gcdip_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0_S00_AXI
     port map (
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WREADY => S_AXI_WREADY,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "system_gcdip_0_0,gcdip_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "gcdip_v1_0,Vivado 2020.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_gcdip_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      S_AXI_WREADY => s00_axi_wready,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
