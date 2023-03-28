program Pr2P2Ej10;

procedure sumpares(num:integer);
var
	dig, sum : integer;
begin
	sum := 0;
	while (num <> 0) do begin
		dig := num MOD 10;
		if (dig MOD 2 = 0) then
			sum := sum + dig;
		num := num DIV 10;
	end;
	writeln(sum);
end;
	
procedure digimp(num:integer);
var
	dig, cantimp : integer;
begin
	cantimp := 0;
	while (num <> 0) do begin
		dig := num MOD 10;
		if (dig MOD 2 = 1) then
			cantimp := cantimp + 1;
		num := num DIV 10;
	end;
	writeln(cantimp);
end;

var
	num : integer;
BEGIN
	readln(num);
	while (num <> 12345) do begin
		sumpares(num);
		digimp(num);
		writeln('');
		readln(num);
	end;
END.

