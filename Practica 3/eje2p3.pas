program eje1;
type
	fecha = record
		dia: 1..31;
		mes: 1..12;
		anio: integer; //podria poner 2019..2020
	end;
	
procedure leerFecha(var f: fecha);
begin
	writeln('Ingrese fecha (dd/mm/yy)');
	
	// forma 1
	with f do begin
		read(dia);
		read(mes);
		read(anio);
	end;
	
	{ forma 2
		read(f.dia);
		read(f.mes);
		read(f.anio);
	* }
end;
var
	f: fecha;
	cantVerano, cantPrimerosDias : integer;
begin
	cantVerano := 0;
	cantPrimerosDias := 0;
	leerFecha(f);
	while(f.anio <> 2020) do begin
		if (f.mes <=3) then
			cantVerano := cantVerano + 1;
		if (f.dia <= 10) then
			cantPrimerosDias := cantPrimerosDias + 1;
		leerFecha(f);
	end;
	writeln('Cantidad de casamientos en verano: ', cantVerano);
	writeln('Cantidad de casamientos en los primeros 10 dias de cada mes: ', cantPrimerosDias);
end.
