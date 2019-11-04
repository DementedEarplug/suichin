----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:13 11/04/2019 
-- Design Name: 
-- Module Name:    ControllerMuxDFF - Behavioral 
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

entity ControllerMuxDFF is
    Port ( arm : in  STD_LOGIC;
           doors : in  STD_LOGIC;
           windows : in  STD_LOGIC;
           frontdoor : in  STD_LOGIC;
           enddelay : in  STD_LOGIC;
           test : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           leds : out  STD_LOGIC_vector(7 downto 0);
           sendsms : out  STD_LOGIC;
           bell : out  STD_LOGIC;
           lights : out  STD_LOGIC;
           startdelay : out  STD_LOGIC);
end ControllerMuxDFF;

architecture Behavioral of ControllerMuxDFF is
	 
	 signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal C : std_logic := '0';
    signal Da : std_logic;
    signal An : std_logic;
    signal Db : std_logic;
    signal Bn : std_logic;
    signal Dc : std_logic;
    signal Cn : std_logic;
	 signal m1Sel : std_logic_vector(1 downto 0);
	 signal m2Sel : std_logic_vector(2 downto 0);
	 signal m3Sel : std_logic_vector(1 downto 0);
    signal f1 : std_logic;
    signal f2 : std_logic; 
    signal f3 : std_logic;
    signal f4 : std_logic;
    signal f5 : std_logic;
    signal f6 : std_logic;
	 signal nEnddelay : std_logic;
	 
	 component dflipflop
    port(
          d : in std_logic;
          clk : in std_logic;
          q : out std_logic;
          nq : out std_logic
    );
    end component;
	 
	 component mux4to1	Port(  
			  A : in std_logic;
           B : in  std_logic;
           C : in  std_logic;
           D : in  std_logic;
           Sel : in std_logic_vector(1 downto 0);
           Q : out  std_logic;
           Leds: out std_logic_vector(3 downto 0));
	
	end component;
	
	component mux5to1	Port(  
			  A : in  std_logic;
           B : in  std_logic;
           C : in  std_logic;
           D : in  std_logic;
			  E : in  std_logic;
           Sel : in std_logic_vector(2 downto 0);
           Q : out  std_logic;
           Leds: out std_logic_vector(3 downto 0));
	
	end component;

begin

	 f1 <= (arm and (doors and windows  and frontdoor)) or (arm and (doors and windows and frontdoor));
    f2 <= (test = '0' and doors = '0' and windows = '0' and arm = '1') or (test = '1') or (test = '0' and arm = '1' and (windows = '1' or doors = '1') and frontdoor = '1');
    f3 <= (test = '0' and arm = '1' and (windows = '1' or doors = '1'));
    f4 <= arm = 1 and (windows = '1' or doors = '1') and frontdoor = '0';
    f5 <= test = '0' and arm = '1' and (windows = '1' or doors = '1') and frontdoor = '0';
    f6 <= test = '0' and arm = '1' and (windows = '1' or doors = '1') and frontdoor = '1';
	 
    Da <= (An= '1' and  Bn= '1' and Cn = '1' and f1 = '1') or (B = '1' and Cn = '1' and test = '1') or (A = '1' and Bn = '1' and enddelay = '1');
    Db <= (A = '1' and enddelay = '1') or (B = '1' and Cn = '1' and f2 = '1') or (B = '1' and C = '1' and enddelay = '0') or (A = '1' and B = '1');
    Dc <= (An = '1' and C = '1' and arm = '1') or (An = '1' and B = '1' and  f3 = '1') or (B = '1' and C = '1');
	 
	 m1Sel(1) <= (B = '1' and Cn = '1') or (A = '1' and Cn = '1');
	 m1Sel(0) <= (Bn = '1' and Cn = '1');
	 m2Sel(2) <= (A = '1' and Bn = '1' and Cn = '1');
	 m2Sel(1) <= (An = '1' and B = '1');
	 m2Sel(0) <= (A = '1' and B = '1' and Cn = '1') or (An = '1' and B = '1' and C = '1');
	 m3Sel(1) <= (A = '1' and B = '1' and Cn = '1') or (An = '1' and Bn = '1' and C = '1');
	 m3Sel(0) <= (An = '1' and Bn = '1');

    startdelay <= (A = '1' and Bn = '1' and Cn = '1') or not(A = '1' and B = '1' and C = '1');
	 nEnddelay <= (not enddelay);
	 
    Inst_DA : dflipflop port map(
        d => Da,
        clk => clk,
        q => A,
        nq => An
    );
	 
	 Inst_DB : dflipflop port map(
        d => Db,
        clk => clk,
        q => B,
        nq => Bn
    );
	 
	 Inst_DC : dflipflop port map(
        d => Dc,
        clk => clk,
        q => C,
        nq => Cn
    );
	 
	 Inst_Mux1 : mux4to1 port map(
		  A 	 => '0',
		  B 	 => f1,
        C 	 => test,
        D 	 => nEnddelay,
        Sel(1)  => m1Sel(1),
		  Sel(0)  => m1Sel(0),
        Q 	 => '0',
        Leds => '0'
	 );


end Behavioral;
