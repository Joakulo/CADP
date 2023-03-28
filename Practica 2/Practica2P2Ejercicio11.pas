program Pr2P2Ej11;

procedure dosmaxs (numi:integer; var numimax1, numimax2 : integer; nombre : string; var nommax1, nommax2:string);
begin
	if (numi > numimax1) then begin
		numimax2 := numimax1;
		numimax1 := numi;
		
		nommax2 := nommax1;
		nommax1 := nombre;
	end
	else if (numi > numimax2) then begin
		numimax2 := numi;
		nommax2 := nombre;
	end;
end;


procedure dosmins (numi : integer; var numimin1, numimin2 : integer; ape : string; var apemin1, apemin2 : string);
begin
	if (numi < numimin1) then begin
		numimin2 := numimin1;
		numimin1 := numi;
		
		apemin2 := apemin1;
		apemin1 := ape;
	end
	else if (numi < numimin2) then begin
		numimin2 := numi;
		apemin2 := ape;
	end;
end;

function numipar (numi : integer) : boolean;
begin
	numipar := (dig MOD 2 = 0)
end;

var
	nombre, nommax1, nommax2, ape, apemin1, apemin2 : string[50];
	numi, numimin1, numimin2, numimax1, numimax2 : integer;
	cantalumn, cantalumnpar, porcentajepar : real;
BEGIN
	numimax1 := -9999;
	numimax2 := -9999;
		
	numimin1 := 9999;
	numimin2 := 9999;
	
	cantalumn := 0;
	cantalumnpar := 0;
	
	repeat
	writeln('Ingrese su nombre');
	readln(nombre);
	writeln('Ingrese su apellido');
	readln(ape);
	writeln('Ingrese su numero de ingresante');
	readln(numi);
	dosmaxs(numi, numimax1, numimax2, nombre, nommax1, nommax2);
	dosmins(numi, numimin1, numimin2, ape, apemin1, apemin2);
	if (numipar (numi)) then
		cantalumnpar := cantalumnpar + 1;
	cantalumn := cantalumn + 1;
	until (numi = 1200);
	
	porcentajepar := cantalumnpar * 100 / cantalumn;
	
	writeln(apemin1, ' ', apemin2);
	writeln(nommax1, ' ', nommax2);
	writeln(porcentajepar:2:2);
	
END.
