
-- VHDL Instantiation Created from source file mux.vhd -- 14:00:01 10/09/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mux
	PORT(
		A : IN std_logic;
		B : IN std_logic;
		C : IN std_logic;
		D : IN std_logic;
		Switches : IN std_logic_vector(1 downto 0);          
		Q : OUT std_logic;
		Leds : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_mux: mux PORT MAP(
		A => ,
		B => ,
		C => ,
		D => ,
		Switches => ,
		Q => ,
		Leds => 
	);


