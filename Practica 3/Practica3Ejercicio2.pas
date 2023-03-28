program Pr3Ej2;

type
	fecha = record
		dia : integer;
		mes : integer;
		anio : integer;
	end;

procedure leerFecha(var f:fecha);
begin
	readln(f.dia);
	readln(f.mes);
	readln(f.anio);
end;

var
	cantverano, cant10 : integer;
	fechav : fecha;

BEGIN
	cantverano:=0;
	cant10:=0;
	leerFecha(fechav);
	while (fechav.anio <> 2020) do begin
		if ((fechav.mes >= 1) and (fechav.mes <= 3)) then
			cantverano := cantverano + 1;
		if ((fechav.dia >= 1) and (fechav.dia <= 10)) then
			cant10 := cant10 + 1;
		leerFecha(fechav);
	end;
	writeln(cant10,' ' ,cantverano);
	
END.

