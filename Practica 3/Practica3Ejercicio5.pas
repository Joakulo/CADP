program Pr3Ej5;

type
	autos=record
		marca : string[15];
		modelo : string[15];
		precio : real;
	end;

procedure leerAuto (var a:autos);
begin
	writeln('Marca');
	readln(a.marca);
	if (a.marca <> 'ZZZ') then begin
		writeln('Precio');
		readln(a.precio);
		writeln('Modelo');
		readln(a.modelo);
	end;
end;

procedure maxAuto(var a, am : autos; var max : real);
begin
	if a.precio > max then begin
		max := a.precio;
		am.marca := a.marca;
		am.modelo := a.modelo;
	end;
end;

var
	auto, automax : autos;
	marcaactual : string[15];
	prom, max, cantautos : real;
	
BEGIN
	prom := 0;
	max := -9999;
	leerAuto(auto);
	while auto.marca <> 'ZZZ' do begin
		marcaactual := auto.marca;
		cantautos := 0;
		while ((auto.marca = marcaactual) and (auto.marca <> 'ZZZ')) do begin
			prom := prom + auto.precio;
			maxAuto(auto,automax,max);
			writeln('');
			cantautos := cantautos + 1;
			leerAuto(auto);
		end;
	writeln(marcaactual);
	writeln(prom/cantautos:1:2);
	writeln('');
	end;
	writeln(automax.marca,' ',automax.modelo);
END.

