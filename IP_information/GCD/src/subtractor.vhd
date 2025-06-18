-- Component: SUBTRACTOR ----------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity subtractor is
    port(	rst: in std_logic;
		cmd: in std_logic_vector( 1 downto 0 );
		x, y: in std_logic_vector( 7 downto 0 );
		xout, yout: out std_logic_vector( 7 downto 0 )
    );
end subtractor;

architecture subtractor_arc of subtractor is
begin
    process( rst, cmd, x, y )
    begin
	if( rst = '1' or cmd = "00" ) then 	-- not active.
	    xout <= (others=>'0');	
	    yout <= (others=>'0');
	elsif( cmd = "10" ) then 		-- x is greater
	    xout <= ( x - y );
	    yout <= y;
	elsif( cmd = "01" ) then 		-- y is greater
	    xout <= x;	
	    yout <= ( y - x );
	else 
	    xout <= x;  			-- x and y are equal
	    yout <= y; 		
	end if;
    end process;
end subtractor_arc;