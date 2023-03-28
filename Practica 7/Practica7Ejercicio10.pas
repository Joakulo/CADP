program Pr7Ej10;

type
	cultivo = record
		tipo:string;
		hectareas:integer;
		meses:integer;
	end;
	vector = array [1..20] of cultivo;
	empresa = record
		codigo:integer;
		nombre:string;
		privada:boolean;
		ciudad:string;
		cultivos:vector;
		dimL:integer;
	end;
	lista=^nodo;
	nodo = record
		dato:empresa;
		sig:lista;
	end;

procedure crearLista (var L:lista);
begin
	new(L);
	L:=nil;
end;

procedure agregarAtras(var L,ult:lista;e:empresa);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=e;
	nue^.sig:=nil;
	if (L=nil) then
		L:=nue
	else
		ult^.sig:=nue^.sig;
	ult:=nue
end;

procedure cargarLista(var L,ult:lista);
var
	e:empresa;
	i:integer;
	a:string;
begin
	writeln('Ingrese el codigo');
	readln(e.codigo);
	while (e.codigo <> -1) do begin
		i:=0;
		writeln('Ingrese el nombre de la empresa');
		readln(e.nombre);
		writeln('Ingrese si es privada o no (si/no)');
		readln(a);
		if (a='si') then 
			e.privada := true 
		else
			e.privada := false;
		writeln('Ingrese la ciudad donde radica');
		readln(e.ciudad);
		writeln('Ingrese las hectareas del cultivo 1');
		readln(e.cultivos[i].hectareas);
		while ((e.cultivos[i].hectareas <> 0) and (i <= 20)) do begin
			writeln('Ingrese el tipo del cultivo ', i);
			readln(e.cultivos[i].tipo);
			writeln('Ingrese el tiempo del cultivo ', i);
			readln(e.cultivos[i].meses);
			i := i + 1;
			writeln('Ingrese las hectareas del cultivo ', i);
			readln(e.cultivos[i].hectareas);
		end;
		e.dimL := i - 1;
		agregarAtras(L,ult,e);
	end;
end;

procedure SanMiguel0 (L:lista);
var
	num, cant0:integer;
begin
	num := L^.dato.codigo;
	cant0 := 0;
	while ((num <> 0) and (cant0 < 2)) do begin
		if (num MOD 10 = 0) then
			cant0 := cant0 + 1;
		num := num DIV 10;		
	end;
	if (cant0 = 2) then
		writeln('La empresa ', L^.dato.nombre,' reside en San Miguel del Monte, cultiva trigo, y su codigo tiene dos 0´s');
end;

procedure contarHectareas(L:lista; var soja, total : integer);
var
	i:integer;
begin
	for i:=1 to L^.dato.dimL do begin
		total := total + L^.dato.cultivos[i].hectareas;
		if (L^.dato.cultivos[i].tipo = 'Soja') then
			soja := soja + L^.dato.cultivos[i].hectareas;
	end;
end;

procedure porcentajeSoja(soja,total:integer);
begin
	writeln('Cantidad total de hectareas dedicadas a la soja: ',soja);
	writeln('Esto representa un ', soja * 100 DIV total, '% del total de hectareas');
end;

procedure maxMaiz(L:lista; var max:integer; var maxN:string);
var
	i, maiz:integer;
begin
	for i:=1 to L^.dato.dimL do begin
		if L^.dato.cultivos[i].tipo = 'Maiz' then
			maiz := L^.dato.cultivos[i].hectareas;
	end;
	if maiz > max then begin
		max := maiz;
		maxN := L^.dato.nombre;
	end;
end;

procedure unoMas(L:lista);
var
	i:integer;
begin
	if (L^.dato.privada) then begin
		for i:=1 to L^.dato.dimL do begin
			if ((L^.dato.cultivos[i].tipo = 'Trigo') and (L^.dato.cultivos[i].hectareas < 5)) then
				L^.dato.cultivos[i].meses := L^.dato.cultivos[i].meses + 1;
		end;
	end;
end;

procedure recorrerLista (L:lista);
var
	hectareasSoja, hectareasTotal, maxM : integer;
	maxMnombre : string;
begin
	while (L<>nil) do begin
		SanMiguel0(L);
		contarHectareas(L,hectareasSoja,hectareasTotal);
		maxMaiz(L,maxM,maxMnombre);
		unoMas(L);
		L:=L^.sig;
	end;
	porcentajeSoja(hectareasSoja,hectareasTotal);
	writeln('La empresa que mas tiempo le dedica al maiz es ',maxMnombre);
end;

var
	pri,ult:lista;

BEGIN
	crearLista(pri);
	crearLista(ult);
	cargarLista(pri,ult);
	recorrerLista(pri);
END.
