-- component: FSM controller --------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity fsm is
    port(	rst, clk, proceed: in std_logic;
		comparison: in std_logic_vector( 1 downto 0 );
		enable, xsel, ysel, xld, yld: out std_logic
    );
end fsm;

architecture fsm_arc of fsm is

    type states is ( init, s0, s1, s2, s3, s4, s5 );
    signal nState, cState: states;

begin
    process( rst, clk )
    begin
	if( rst = '1' ) then 
	    cState <= init;
	elsif( clk'event and clk = '1' ) then 
	    cState <= nState;
	end if;
    end process;

    process( proceed, comparison, cState )
    begin
	case cState is 
		
	when init =>	if( proceed = '0' ) then 
			    nState <= init;
			else 
			    nState <= s0;
			end if;
			
	when s0 =>	enable <= '0';
			xsel <= '0';
			ysel <= '0';
			xld <= '0';
			yld <= '0';
			nState <= s1;
	
	when s1 =>	enable <= '0';
			xsel <= '0';
			ysel <= '0';
			xld <= '1';
			yld <= '1';
			nState <= s2;
		
	when s2 =>	xld <= '0';
            xsel <= '0';
            ysel <= '0';
            xld <= '0';
            yld <= '0';
			if( comparison = "10" ) then 
			    nState <= s3;
			elsif( comparison = "01" ) then 
			    nState <= s4; 	
			elsif( comparison = "11" ) then 
			    nState <= s5;   	
			end if;
		
	when s3 =>	enable <= '0';
			xsel <= '1';
			ysel <= '0';
			xld <= '1';
			yld <= '0';
			nState <= s2;
	
	when s4 =>	enable <= '0';
			xsel <= '0';
			ysel <= '1';
			xld <= '0';
			yld <= '1';
			nState <= s2;

	when s5 =>	enable <= '1';
			xsel <= '1';
			ysel <= '1';
			xld <= '1';
			yld <= '1';
			nState <= s0;
			
	when others =>	nState <= s0;
			
        end case;
	
    end process;
	
end fsm_arc;