program Pr2P1Ej6;

procedure negpar;
var
	num, max : integer;
begin
	max := -9999;
	repeat 
		readln(num);
		if ((num > max) and (num MOD 2 = 0)) then
			max := num;
	until num < 0;
	writeln(max);
end;
BEGIN
	negpar;
END.

