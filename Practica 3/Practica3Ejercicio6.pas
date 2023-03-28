program Pr3Ej6;

Type
	microprocesadores = record
		marca : string[15];
		linea : string[15];
		cantCores : integer;
		velocidad : real;
		tamanio : integer;
	end;

procedure leerProcesador (var p:microprocesadores);
begin
	writeln('Cantidad de Cores');
	readln(p.cantCores);
	if p.cantCores <> 0 then begin
		writeln('Marca');
		readln(p.marca);
		writeln('Linea');
		readln(p.linea);
		writeln('Velocidad');
		readln(p.velocidad);
		writeln('Tamanio');
		readln(p.tamanio);
		writeln(' ');
	end;
end;

procedure MarcaYLinea (p:microprocesadores);
begin
	if ((p.cantCores > 2) and (p.tamanio <= 22)) then begin
		writeln(p.marca,' ',p.linea);
		writeln(' ');
	end;
end;

procedure maxDos (p:microprocesadores; cant:integer; var maxT1, maxT2 : integer; var maxMarca1, maxMarca2 : string);
begin
	if cant > maxT1 then begin
		maxT2 := maxT1;
		maxT1 := cant;
		
		maxMarca2 := maxMarca1;
		maxMArca1 := p.marca
	end else if cant > maxT2 then begin
		maxT2 := cant;
		
		maxMarca2 := p.marca;
	end;
end;

procedure cantMulticores(p:microprocesadores; var cant : integer);
begin
	if ((p.cantCores > 1) and ((p.marca = 'intel') or (p.marca = 'amd')) and (p.velocidad >= 2)) then
		cant := cant + 1;
end;

var
	p : microprocesadores;
	cantmaxDos, maxT1, maxT2, cantMulticore : integer;
	maxMarca1, maxMarca2, marcaActual : string[15];


BEGIN
	cantMulticore := 0;
	maxT1 := -1;
	maxT2 := -1;
	maxMarca1 := 'a';
	maxMarca2 := 'a';
	
	leerProcesador(p);
	while (p.cantCores > 0) do begin
		cantmaxDos := 0;
		marcaActual := p.marca;
		while (marcaActual = p.marca) do begin
			MarcaYLinea(p);
			if (p.tamanio = 14) then
				cantmaxDos := cantmaxDos + 1;
			cantMulticores(p,cantMulticore);
			leerProcesador(p);
		end;
		maxDos(p,cantmaxDos,maxT1,maxT2,maxMarca1,maxMarca2);
	end;
	writeln(maxMarca1,' ',maxMarca2);
	writeln(cantMulticore);
END.
