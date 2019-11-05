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
           leds : out  STD_LOGIC_vector(2 downto 0);
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
	 signal m1Out :std_logic;
	 signal m2Out :std_logic;
	 signal m3Out :std_logic;
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
           mSel : in std_logic_vector(1 downto 0);
           Q : out  std_logic
          );	
	end component;
	
	component mux8to1	Port(  
			  A : in  std_logic;
           B : in  std_logic;
           C : in  std_logic;
           D : in  std_logic;
			  E : in  std_logic;
			  F : in  std_logic;
			  G : in  std_logic;
			  H : in  std_logic;
           mSel : in std_logic_vector(2 downto 0);
           Q : out  std_logic
          );
	
	end component;

begin

	 f1 <= (arm and (doors and windows  and frontdoor)) or (arm and (doors and windows and frontdoor));
    f2 <= (test  and doors  and windows  and arm ) or (test ) or (test  and arm  and (windows  or doors ) and frontdoor );
    f3 <= (test  and arm  and (windows  or doors ));
    f4 <= arm  and (windows  or doors ) and frontdoor ;
    f5 <= test  and arm  and (windows  or doors ) and frontdoor ;
    f6 <= test  and arm  and (windows  or doors ) and frontdoor ;
	 
    Da <= (An and  Bn and Cn  and f1 ) or (B  and Cn  and test ) or (A  and Bn  and enddelay );
    Db <= (A  and enddelay ) or (B  and Cn  and f2 ) or (B  and C  and enddelay ) or (A  and B );
    Dc <= (An  and C  and arm ) or (An  and B  and  f3 ) or (B  and C );
	 
	 m1Sel(1) <= (B  and Cn ) or (A  and Cn );
	 m1Sel(0) <= (Bn  and Cn );
	 m2Sel(2) <= (A  and Bn  and Cn );
	 m2Sel(1) <= (An  and B );
	 m2Sel(0) <= (A  and B  and Cn ) or (An  and B  and C );
	 m3Sel(1) <= (A  and B  and Cn ) or (An  and Bn  and C );
	 m3Sel(0) <= (An  and Bn );

    startdelay <= (A  and Bn  and Cn ) or not(A  and B  and C );
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
        mSel(1)  => m1Sel(1),
		  mSel(0)  => m1Sel(0),
        Q 	 => m1Out
        
	 );
	 
	 Inst_Mux2 : mux8to1 port map(
		  A 	 => '0',
		  B 	 => '1',
        C 	 => f2,
        D 	 => arm,
		  E	 => nEnddelay,
		  F	 => '0',
		  G 	 => '0',
		  H	 => '0',
		  mSel(2)  => m2Sel(2),
        mSel(1)  => m2Sel(1),
		  mSel(0)  => m2Sel(0),
        Q 	 => m2out
        
	 );
	 
	 Inst_Mux3 : mux4to1 port map(
		  A 	 => '0',
		  B 	 => '1',
        C 	 => arm,
        D 	 => f3,
        mSel(1)  => m3Sel(1),
		  mSel(0)  => m3Sel(0),
        Q 	 => m3out
        
	 );

	 
	 

end Behavioral;
