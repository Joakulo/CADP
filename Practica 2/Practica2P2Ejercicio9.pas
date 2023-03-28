program Pr2P2Ej9;

procedure digsum (num : integer; var cantd, sumd : integer);
var
	dig, cantdv : integer;
begin
	cantdv := 0;
	sumd := 0;
	while (num <> 0) do begin
		dig := num MOD 10;
		sumd := sumd + dig;
		num := num DIV 10;
		cantdv := cantdv + 1;
	end;
	cantd := cantd + cantdv;
end;

var
	num, cantd, sumd : integer;
BEGIN
	 repeat
	 readln(num);
	 digsum(num,cantd,sumd);
	 until sumd = 10;
 	writeln(cantd);
END.

