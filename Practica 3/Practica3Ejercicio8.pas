program Pr3Ej8;

Type
	
	datos = record
		dni : integer;
		nombape : string[15];
		email: string[15];
	end;
	
	proyecto = record
		codigo : integer;
		titulo : string[15];
		docente : datos;
		cantalumnos : integer;
		nombreesc : string[15];
		localidad : string[15];
	end;

procedure leerProyecto (var p:proyecto);
begin
	writeln('Codigo');
	readln(p.codigo);
	if p.codigo <> -1 then begin
		writeln('Titulo');
		readln(p.titulo);
		writeln('DNI');
		readln(p.docente.dni);
		writeln('Nombre');
		readln(p.docente.nombape);
		writeln('Email');
		readln(p.docente.email);
		writeln('Cantidad de alumnos');
		readln(p.cantalumnos);
		writeln('Nombre de la Escuela');
		readln(p.nombreesc);
		writeln('Localidad');
		readln(p.localidad);
		writeln(' ');
	end;
end;

procedure maxEscuelas (n:string; cant:integer; var max1, max2 : integer; var maxNom1, maxNom2 : string);
begin
	if cant > max1 then begin
		max2 := max1;
		max1 := cant;
		
		maxNom2 := maxNom1;
		maxNom1 := n;
	end else if cant > max2 then begin
		max2 := cant;
		
		maxNom2 := n;
	end;
end;

procedure Daireaux (t:string; c:integer);
var
	pares, impares, dig: integer;
begin
	pares := 0;
	impares := 0;
	while c <> 0 do begin
		dig := c MOD 10;
		if (dig MOD 2 = 0) then
			pares := pares + 1
		else 
			impares := impares + 1;
		c := c DIV 10;
	end;
	if (pares = impares) then
		writeln(t);
		writeln(' ');
end;

var
	p : proyecto;
	cantEsc2020, cantEscLoc, cantAlu, max1, max2 : integer;
	maxNom1, maxNom2, localidadActual, escuelaActual : string[15];

BEGIN
	cantEsc2020 := 0;
	max1 := 0;
	max2 := 0;
	maxNom1 := 'a';
	maxNom2 := 'a';
	
	leerProyecto(p);
	while (p.codigo <> -1) do begin
		cantEscLoc := 0;
		localidadActual := p.localidad;
		while ((localidadActual = p.localidad) and (p.codigo <> -1)) do begin
			cantAlu := 0;
			escuelaActual := p.nombreesc;
			while ((localidadActual = p.localidad) and (p.codigo <> -1) and (escuelaActual = p.nombreesc)) do begin
				cantEsc2020 := cantEsc2020 + 1;
				cantEscLoc := cantEscLoc + 1;
				cantAlu := cantAlu + p.cantalumnos;
				if p.localidad = 'Daireaux' then
					Daireaux(p.titulo, p.codigo);
				leerProyecto(p);
			end;
			maxEscuelas(escuelaActual, cantAlu, max1, max2, maxNom1, maxNom2);
		end;
		writeln(cantEscLoc);
	end;
	writeln(cantEsc2020);
END.
