program PR1P2Ej4b;
var
	num, min1, min2 : integer;
BEGIN
	min1 := 31000;
	min2 := 31000;
	readln(num);
	while num <> 0 do
		begin
			if num < min1 then begin
				min2 := min1;
				min1 := num;
			end
			else if num < min2 then
				min2 := num;
			readln(num);
		end;
	writeln(min1,' ', min2);
END.

