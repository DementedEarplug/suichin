----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:07 10/11/2019 
-- Design Name: 
-- Module Name:    controller - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is

    port(
        arm : in              std_logic;
        doors : in            std_logic;
        windows : in          std_logic;
        frontdoor : in        std_logic;
        enddelay : in         std_logic;
        test : in             std_logic;
		  clk : in 					std_logic;
        leds : out            std_logic_vector(7 downto 0);
        sendsms : out         std_logic;
        bell : out            std_logic;
        lights : out          std_logic;
        startdelay : out      std_logic

    );
end controller;

architecture Behavioral of controller is

    signal state : std_logic_vector(2 downto 0) := "010";
	 signal startedDelay : std_logic := '0';

begin

    
	 
	 

    states : process(clk)
    begin 
        if rising_edge(clk) then 
				
            case state is
                when "000" => --state b
						  leds <= "00000010";
						  if arm = '0' then 
								state <= "010";
                    elsif startedDelay = '0' and arm = '1' then 
                        startdelay <= '1';
                        --leds <= "00000010";
								startedDelay <= '1';                                          
                    elsif enddelay = '1' and arm = '1' then 
                        state <= "001"; --go to c
								startedDelay <= '0';
								startdelay <= '0';
                    end if;

                when "001" => --state c

                    if not test = '1' and (arm = '1' and not (doors = '1' or windows = '1' or frontdoor = '1')) then 
                        leds <= "00000100";
                    elsif not test = '1' and not arm = '1' then 
								state(1) <= '1';
								state(0) <= '0';
                        --state <= "010"; --go to a
                    elsif  not test = '1' and (arm = '1' and (doors = '1' or windows = '1' or frontdoor = '1')) then 
                        state <= "111"; --go to e
                    elsif test = '1' or (not test = '1' and arm = '1' and (doors = '1' or windows = '1' or frontdoor = '1')) then
                        state <= "011";  --go to d
                    end if;
                    
                when "010" => --state a
                
                    if arm = '0'  or ((doors = '1' or windows = '1' or frontdoor = '1')) then
                        leds <= "00000001";
                    elsif arm = '1' and (doors ='0' and windows = '0' and frontdoor = '0') then 
                        state <= "000";                        
                    end if;
                    
                when "011" => --state d
                    if arm = '1' then
                        leds <= "00010000";
                        sendsms <= '1';
                        bell <= '1';
                    elsif not arm = '1' then 
                        state <= "010"; --go to a								
						  end if;
                
                when "111" => --state e
                    if startedDelay = '0' then 
                        startdelay <= '1';
                        leds <= "01000000";
								startedDelay <= '1';                    
                    elsif enddelay = '1' then
								startedDelay <= '0';
								startdelay <= '0';
                        if arm = '1' then 
                            state <= "011"; --go to d 
                        elsif not arm = '1' then 
                            state <= "010"; --go to a
                        end if;
                    end if;
                        
            
                when others =>
                    leds <= "11111111";
            end case;
        end if;
    end process;
                




end Behavioral;

