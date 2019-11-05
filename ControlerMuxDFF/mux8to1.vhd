----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:51:26 10/09/2019 
-- Design Name: 
-- Module Name:    mux8to1 - Behavioral 
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

entity mux8to1 is
	Port(  A : in std_logic;
           B : in  std_logic;
           C : in  std_logic;
           D : in  std_logic;
           E : in std_logic;
			  F : in std_logic;
			  G : in std_logic;
			  H : in std_logic;
           mSel : in std_logic_vector(2 downto 0);
           Q : out  std_logic);
           
	
end mux8to1;

architecture Behavioral of mux8to1 is

begin
	  logic: process (mSel(2),mSel(1),mSel(0),A,B,C,D,E,F,G,H)
	  begin
		  if  mSel(2) = '1' and mSel(1) = '1' and mSel(0) = '1' then
				  Q <= H;
             
			elsif  mSel(2) = '0' and mSel(1) = '0' and mSel(0) = '1' then
				  Q <= G;
             
			elsif  mSel(2) = '1' and mSel(1) = '0' and mSel(0) = '1' then
				  Q <= F;
             
         elsif  mSel(2) = '1' and mSel(1) = '0' and mSel(0) = '0' then
				  Q <= E;
          
         elsif  mSel(2) = '0' and mSel(1) = '1' and mSel(0) = '1' then
				  Q <= D;
				  
			elsif mSel(2) = '0' and mSel(1) = '1' and mSel(0) = '0' then
				  Q <= C;
				  
			elsif mSel(2) = '0' and mSel(1) = '0' and mSel(0) = '1' then
				  Q <= B;
				  
			else 
				  Q <= A;
				 
			 end if;
		end process;


end Behavioral;



	

