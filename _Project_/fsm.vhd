entity Digital_Access_Control is
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
end Digital_Access_Control;
architecture FSM of Digital_Access_Control is
type STATE_TYPE is (S0, S1, S2, S3, S4);
signal NS, CS : STATE_TYPE;
begin
process (CS, inp, daytime, reset)
begin
if (reset='1') then
alarm <='0';
door <='0';
NS<=S0;
else
case CS is
when S0 =>
if(inp="1101" and daytime='1') then -­‐-­‐sobh w gali O
alarm <='0';
door <='1';
elsif (inp="0010") then -­‐-­‐ gali 2
alarm <='0';
door <='0';
NS<=S1;
else -­‐-­‐ ay haga tanya alarm terouh state error
alarm <='1';
door <='0';
end if ;
when S1 =>
if(inp="1101" and daytime='1') then -­‐-­‐sobh w gali O
alarm <='0';
door <='1';
NS<=S0;
elsif (inp="0110") then -­‐-­‐ gali 6
alarm <='0';
door <='0';
NS<=S2;
else -­‐-­‐ ay haga tanya alarm terouh state error
alarm <='1';
door <='0';
NS<=S0;
end if ;
when S2 =>
if(inp="1101" and daytime='1') then -­‐-­‐sobh w gali O
alarm <='0';
door <='1';
NS<=S0;
elsif (inp="1010") then -­‐-­‐ gali A
alarm <='0';
door <='0';
NS<=S3;
else -­‐-­‐ ay haga tanya alarm terouh state error
alarm <='1';
door <='0';
NS<=S0;
end if ;
when S3 =>
if(inp="1101" and daytime='1') then -­‐-­‐sobh w gali O
alarm <='0';
door <='1';
NS<=S0;
elsif (inp="0000") then -­‐-­‐ gali 0
alarm <='0';
door <='0';
NS<=S4;
else -­‐-­‐ ay haga tanya alarm terouh state error
alarm <='1';
door <='0';
NS<=S0;
end if ;
when S4 =>
if(inp="1101" and daytime='1') then -­‐-­‐sobh w gali O
alarm <='0';
door <='1';
NS<=S0;
elsif (inp="0101") then -­‐-­‐ gali 5
alarm <='0';
door <='1';
NS<=S0;
else -­‐-­‐ ay haga tanya alarm terouh state error
alarm <='1';
door <='0';
NS<=S0;
end if ;
end case;
end if;
end process;
process(ck)
begin
if(ck = '1' and ck'event)then
CS <= NS;
end if;
end process;
end FSM;
