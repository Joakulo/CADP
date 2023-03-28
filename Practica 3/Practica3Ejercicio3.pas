program Pr3Ej3;

type
	escuela = record
		CUE : integer;
		nombre : string[30];
		cantd : integer;
		canta : integer;
		localidad : string[30];
	end;
	
procedure leerE (var e :escuela);
begin
	writeln('CUE');
	readln(e.CUE);
	writeln('Nombre');
	readln(e.nombre);
	writeln('Docentes');
	readln(e.cantd);
	writeln('Alumnos');
	readln(e.canta);
	writeln('Localidad');	
	readln(e.localidad);
end;

function relacion (alumnos, docentes : integer):integer;
begin
	relacion := alumnos DIV docentes;
end;

procedure escmaxs (var max1, max2, CUE, CUEmax1, CUEmax2, relacionp:integer; maxNombre1, maxNombre2, nombrep: string);
begin
	if relacionp > max1 then begin
		max2 := max1;
		max1 := relacionp;
		
		CUEmax2 := CUEmax1;
		CUEmax1 := CUE;
		
		maxNombre2 := maxNombre1;
		maxNombre1 := nombrep;
		
	end else if relacionp > max2 then begin
		max2 := relacionp;
		CUEmax2 := CUE;
		maxNombre2 := nombrep;
	end;
end;

var
	esc : escuela;
	relacionad, CUEmax1, CUEmax2, max1, max2, cantUNESCO, i : integer;
	maxNombre1, maxNombre2 : string[30];

BEGIN
	cantUNESCO := 0;
	max1 := -9999;
	maxNombre1 := 'a';
	maxNombre2 := 'a';
	for i:=1 to 5 do begin
		leerE(esc);
		relacionad := relacion(esc.canta,esc.cantd);
		if relacionad > 23435 then
			cantUNESCO := cantUNESCO + 1;
		escmaxs(max1, max2, esc.CUE, CUEmax1, CUEmax2, relacionad, maxNombre1, maxNombre2, esc.nombre);
	end;
	writeln(cantUNESCO);
	writeln(maxNombre1, CUEmax1);
	writeln(maxNombre2, CUEmax2);
END.

