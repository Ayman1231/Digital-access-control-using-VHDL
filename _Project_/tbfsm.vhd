ENTITY testbench_Digital_Access_Control IS
END ENTITY testbench_Digital_Access_Control;
ARCHITECTURE test_Digital_Access_Control OF testbench_Digital_Access_Control IS
Component Digital_Access_Control is
port (
ck : in bit;
vdd : in bit;
vss : in bit;
inp : in bit_vector (3 downto 0);
daytime : in bit;
reset : in bit;
alarm : out bit;
door : out bit
);
end Component Digital_Access_Control;
FOR dut: Digital_Access_Control USE ENTITY WORK.Digital_Access_Control (FSM);
SIGNAL ck : bit := '0';
SIGNAL vdd : bit := '1';
SIGNAL vss : bit := '0';
SIGNAL inp : bit_vector (3 downto 0);
SIGNAL daytime : bit;
SIGNAL reset : bit ;
SIGNAL door : bit := '0';
SIGNAL alarm : bit := '0';
-­‐-­‐constant clk_period : time := 50 ns;
BEGIN
dut: Digital_Access_Control PORT MAP (ck, vdd, vss, inp, daytime, reset, alarm, door);
clk_process :process
begin
ck <= '1';
wait for 25 ns;
ck <= '0';
wait for 25 ns;
end process;
p1: process
begin
-­‐-­‐ test 0 ( i use the reset button )
reset<='1';
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 0 at state 0"
severity error;
-­‐-­‐test 1 (we use 'O' at the begin )
reset<='0';
daytime<='1';
inp<="1101";
wait for 50 ns ;
Assert (door='1') and (alarm='0')
report "ERROR in test 1 at state 0"
severity error;
-­‐-­‐test 2 (a wrong input )
-­‐-­‐correct input '2':
inp<="0010";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 2 at state 0"
severity error;
inp<="0000";
wait for 50 ns ;
Assert (door='0') and (alarm='1')
report "ERROR in test 2 at state 1"
severity error;
-­‐-­‐test 3 (the daytime at morining and the normal sequence "26A05" )
-­‐-­‐correct input '2' :
reset<='0';
daytime<='1';
inp<="0010";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 3 at state 0" severity error;
-­‐-­‐correct input '6':
inp<="0110";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 3 at state 1" severity error;
-­‐-­‐correct input'A':
inp<="1010";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 3 at state 2" severity error;
-­‐-­‐correct input'0':
inp<="0000";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 3 at state 3 " severity error;
-­‐-­‐correct input '5':
inp<="0101";
wait for 50 ns ;
Assert (door='1') and (alarm='0')
report "ERROR in test 3 at state 4 " severity error;
-­‐-­‐test 4 (we use button 'O' at night)
daytime<='0';
inp<="1101";
wait for 50 ns ;
Assert (door='0') and (alarm='1')
report "ERROR in test 4 at state 1" severity error;
-­‐-­‐test 5 (the daytime at night and the normal sequence "26A05" )
-­‐-­‐correct input '2' :
daytime<='0';
inp<="0010";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 5 at state 0" severity error;
-­‐-­‐correct input '6':
inp<="0110";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 5 at state 1" severity error;
-­‐-­‐correct input'A':
inp<="1010";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 5 at state 2" severity error;
-­‐-­‐correct input'0':
inp<="0000";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 5 at state 3 " severity error;
-­‐-­‐correct input '5':
inp<="0101";
wait for 50 ns ;
Assert (door='1') and (alarm='0')
report "ERROR in test 5 at state 4 " severity error;
-­‐-­‐ test 6 (a wrong input at night )
-­‐-­‐correct input '2':
daytime<='0';
inp<="0010";
wait for 50 ns ;
Assert (door='0') and (alarm='0')
report "ERROR in test 6 at state 0" severity error;
-­‐-­‐wrong input '3'
inp<="0011";
wait for 50 ns ;
Assert (door='0') and (alarm='1')
report "ERROR in test 6 at state 0" severity error;
WAIT;
END PROCESS p1;
END ARCHITECTURE test_Digital_Access_Control;
