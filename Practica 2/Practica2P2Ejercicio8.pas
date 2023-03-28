program Pr2P2Ej8;

procedure mins (precio, codigo : integer; var min1,min2,codigob1,codigob2 : integer); 
begin
	if (precio<min1) then begin
		min2 := min1;
		min1 := precio;
		
		codigob2 := codigob1;
		codigob1 := codigo;
	end
	else if (precio<min2) then begin
		min2 := precio;
		codigob2 := codigo;
	end;
end;

procedure maxpant (var maxp,precio : integer); 
begin
	if (precio>maxp) then
		maxp := precio;
end;

var
	min1, min2, maxp, precio, codigo, codigob1, codigob2, prom, i, ifin : integer;
	tipo : string[30];
BEGIN
	min1 := 9999;
	min2 := 9999;
	maxp := -9999;
	ifin := 5;
	prom := 0;
	
	for i:= 1 to ifin do begin
		writeln('Ingrese el codigo');
		readln(codigo);
		writeln('Ingrese el precio');
		readln(precio);
		writeln('Ingrese el tipo');
		readln(tipo);
		writeln('');
		mins(precio,codigo,min1,min2,codigob1,codigob2);
		if tipo = 'pantalon' then
			maxpant(maxp,precio);
		prom := prom + precio;
	end;
	prom := prom DIV ifin;
	writeln(codigob1,'',codigob2);
	writeln(maxp);
	writeln(prom);
END.
