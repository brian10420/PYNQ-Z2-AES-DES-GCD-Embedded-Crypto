----------------------------------------------------------------------
-- GCD Calculator: top level design using structural modeling
-- FSM + Datapath (mux, registers, subtracter and comparator)
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity gcdip is
    port(	rst, clk, go_i: in std_logic;
		x_i, y_i: in std_logic_vector( 7 downto 0 );
		d_o: out std_logic_vector( 7 downto 0 );
		done: out std_logic
    );
end gcdip;

--entity gcdip is
--    port(	rst, clk, go_i: in std_logic;
--		x_i, y_i: in std_logic_vector( 7 downto 0 );
--		d_o: out std_logic_vector( 7 downto 0 );
--		done	: out std_logic
--    );
--end gcdip;

architecture gcdip_arc of gcdip is

component fsm is
    port(	rst, clk, proceed: in std_logic;
		comparison: in std_logic_vector( 1 downto 0 );
		enable, xsel, ysel, xld, yld: out std_logic
    );
end component;

component mux is 
    port(	rst, sLine: in std_logic;
		load, result: in std_logic_vector( 7 downto 0 );
		output: out std_logic_vector( 7 downto 0 )
    );
end component;

component comparator is
    port(	rst: in std_logic;
		x, y: in std_logic_vector( 7 downto 0 );
		output: out std_logic_vector( 1 downto 0 )
    );
end component;

component subtractor is
    port( 	rst: in std_logic; 
		cmd: in std_logic_vector( 1 downto 0 );
		x, y: in std_logic_vector( 7 downto 0 );
		xout, yout: out std_logic_vector( 7 downto 0 )
    );
end component;

component regis is
    port(	rst, clk, load: in std_logic;
		input: in std_logic_vector( 7 downto 0 );
		output: out std_logic_vector( 7 downto 0 )
    );
end component;

signal xld, yld, xsel, ysel, enable: std_logic;
signal comparison: std_logic_vector( 1 downto 0 );
signal result: std_logic_vector( 7 downto 0 );					

signal xsub, ysub, xmux, ymux, xreg, yreg: std_logic_vector( 7 downto 0 );

begin

    -- doing structure modeling here
    
    -- FSM controller
	  TOFSM: fsm port map(
	  			rst				=>	rst,
	  			clk				=>	clk,
	  			proceed		=> 	go_i,
	  			comparison=>	comparison,
					enable		=>	enable,
					xsel			=>	xsel,
					ysel			=> 	ysel,
					xld				=>	xld,
					yld				=>	yld
					); 				 
    -- Datapath
    X_MUX: mux port map(
    			rst				=>	rst,
    			sLine			=>	xsel,
    			load			=>	x_i,
    			result		=>	xsub,
    			output		=>	xmux
    			);
    Y_MUX: mux port map(
    			rst				=>	rst,
    			sLine			=>	ysel,
    			load			=>	y_i,
    			result		=>	ysub,
    			output		=>	ymux
    			);
    X_REG: regis port map( 
    			rst				=>	rst,
    			clk				=>	clk,
    			load			=>	xld,
    			input			=>	xmux,
					output		=>	xreg
					);
    Y_REG: regis port map(
    			rst				=>	rst,
    			clk				=>	clk,
    			load			=>	yld,
    			input			=>	ymux,
					output		=>	yreg
					);
    U_COMP: comparator port map(
    			rst				=>	rst,
    			x					=>	xreg,
    			y					=>	yreg,
    			output		=>	comparison
    			);
    X_SUB: subtractor port map(
    			rst				=>	rst,
    			cmd				=>	comparison,
    			x					=>	xreg,
    			y					=>	yreg,
    			xout			=>	xsub,
    			yout			=>	ysub
          );
    OUT_REG: regis port map(
    			rst				=>	rst,
    			clk				=>	clk,
    			load			=>	enable,
    			input			=>	xsub,
					output		=>	result
					);
    
    d_o <= result;
    
    --傳出完成狀態
    done <= enable;
    
    --process(clk, enable)
    --begin
    --  if(clk'event and clk = '1') then
    --		done <= enable;
    --  end if;
    --end process;

end gcdip_arc;

---------------------------------------------------------------------------
