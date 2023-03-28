program untitled;
var
	simbolo : char;
	nums, result : integer;
BEGIN
result := 0;
nums := 1;
	writeln('Ingrese el simbolo + o -');
	readln(simbolo);
	if ((simbolo <> '+') and (simbolo <> '-')) then
		writeln('Error, el programa ha finalizado');
	if (simbolo = '+') then
		begin
		while (nums <> 0) do
			begin
			writeln('Ingrese un numero para sumar a la secuencia o el 0 para terminarla.');
			if (nums <> 0) then
				begin
				readln(nums);
				result := result + nums
				end;
			end;
		end;
	if (simbolo = '-') then
		begin
		while (nums <> 0) do
			begin
			writeln('Ingrese un numero para restar a la secuencia o el 0 para terminarla.');
			if (nums <> 0) then
				begin
				readln(nums);
				result := result - nums
				end;
			end;
		end;
	writeln(result);
END.
