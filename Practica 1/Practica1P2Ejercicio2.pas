program Pr1P2Ej2;
var
	num, max, posmax, i : integer;
BEGIN
	max := -9999;
	for i := 1 to 10 do
		begin
			readln(num);
			if num > max then
				begin
					max := num;
					posmax := i
				end;
		end;
	writeln('El mayor numero leido fue ', max, ' en la posicion ', posmax);
END.

