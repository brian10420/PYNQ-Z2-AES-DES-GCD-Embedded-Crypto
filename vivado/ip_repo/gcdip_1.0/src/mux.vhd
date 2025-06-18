-- Component: MULTIPLEXOR --------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity mux is 
    port(	rst, sLine: in std_logic;
		load, result: in std_logic_vector( 7 downto 0 );
		output: out std_logic_vector( 7 downto 0 )
    );
end mux;

architecture mux_arc of mux is
begin
    process( rst, sLine, load, result )
    begin
	if( rst = '1' ) then 
	    output <= (others => '0');		-- do nothing
	elsif sLine = '0' then 
	    output <= load;		-- load inputs
	else 
	    output <= result;		-- load results
	end if;
    end process;
end mux_arc;