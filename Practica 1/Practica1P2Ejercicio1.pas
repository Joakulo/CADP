program Pr1P2Ej1;
var
	num, cant, tot, i : integer;
BEGIN
	cant := 0; tot := 0;
	for i := 1 to 10 do
		begin
			read(num);
			tot := tot + num;
			if num > 5 then
				cant := cant + 1;
		end;
	writeln('Total: ',tot);
	write('Numero mayores a 5: ', cant);
END.

