----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:51:26 10/09/2019 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
	Port(  A : in std_logic;
           B : in  std_logic;
           C : in  std_logic;
           D : in  std_logic;
           Switches : in std_logic_vector(1 downto 0);
           Q : out  std_logic;
           Leds: out std_logic_vector(7 downto 0));
	
end mux;

architecture Behavioral of mux is

begin
	  logic: process (Switches(1),Switches(0),A,B,C,D)
	  begin
		  if Switches(1) = '1' and Switches(0) = '1' then
				  Q <= D;
				  Leds(3) <= '1';
				  Leds(2) <= '0';
				  Leds(1) <= '0';
				  Leds(0) <= '0';
			 elsif Switches(1) = '1' and Switches(0) = '0' then
				  Q <= C;
				  Leds(3) <= '0';
				  Leds(2) <= '1';
				  Leds(1) <= '0';
				  Leds(0) <= '0';
			 elsif Switches(1) = '0' and Switches(0) = '1' then
				  Q <= B;
				  Leds(3) <= '0';
				  Leds(2) <= '0';
				  Leds(1) <= '1';
				  Leds(0) <= '0';
			 else 
				  Q <= A;
				  Leds(3) <= '0';
				  Leds(2) <= '0';
				  Leds(1) <= '0';
				  Leds(0) <= '1';
			 end if;
		end process;


end Behavioral;



	

