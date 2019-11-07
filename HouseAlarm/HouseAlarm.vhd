----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:50:25 11/07/2019 
-- Design Name: 
-- Module Name:    HouseAlarm - Behavioral 
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

entity HouseAlarm is
	   port ( 
			  A : in std_logic;
			  B : in std_logic;
			  C : in std_logic;
			  Da :in std_logic;
			  Qa : out std_logic;
			  Qan : out std_logic;
           switches : in std_logic_vector(7 downto 0);
			  CLK : in std_logic;
			  arm : in              std_logic;
           doors : in            std_logic;
           windows : in          std_logic;
           frontdoor : in        std_logic;
           enddelay : in         std_logic;
           test : in             std_logic;			  
           bell : out std_logic;
           lights : out std_logic;
           sendsms : out std_logic;
           startdelay : out std_logic;
           LEDs: out std_logic_vector(7 downto 0));

end HouseAlarm;

architecture Behavioral of HouseAlarm is

	component systemcontroller
        port(

            Arm : in              std_logic;
            Doors : in            std_logic;
            Windows : in          std_logic;
            Frontdoor : in        std_logic;
            
            Test : in             std_logic;
			Clk : in			  std_logic;
            Leds : out            std_logic_vector(7 downto 0);
            Sendsms : out         std_logic;
            Bell : out            std_logic;
            Lights : out          std_logic
        );
    end component;

begin

	 Inst_controller: systemcontroller port map(
			  Arm => switches(7),
			  Doors => switches(2),
			  Windows => switches(1),
			  Frontdoor => switches(6),       
			  Test => switches(0),
			  Clk => CLK,
			  Leds => LEDs,
			  Sendsms => sendsms,
			  Bell => bell,
			  Lights => lights       
		 );



end Behavioral;

