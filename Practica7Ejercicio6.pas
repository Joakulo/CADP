program Pr7Ej6;

type
	rangoO = 1..7;
	vectorObj = array [rangoO] of integer;
	objeto = record
		codigo : integer;
		categoria : rangoO;
		nombre : string;
		distancia : real;
		descubridor : string;
		descubrimiento : integer;
	end;
	lista =^nodo;
	nodo = record
		dato : objeto;
		sig : lista;
	end;

procedure crearLista (var L:lista);
begin
	new(L);
	L:=nil;
end;

procedure agregarAtras (var L,ult:lista; o:objeto);
var
	nue : lista;
begin
	new(nue);
	nue^.dato := o;
	nue^.sig := nil;
	if (L = nil) then
		L := nue
	 else 
		ult^.sig := nue;
	ult := nue;
end;

procedure cargarLista(var L,ult:lista);
var
	o:objeto;
begin
	writeln('Ingrese el codigo del objeto');
	readln(o.codigo);
	while (o.codigo <> -1) do begin
		writeln('Ingrese la categoria del objeto');
		readln(o.categoria);
		writeln('Ingrese el nombre del objeto');
		readln(o.nombre);
		writeln('Ingrese la distancia a la Tierra');
		readln(o.distancia);
		writeln('Ingrese el nombre del descubridor');
		readln(o.descubridor);
		writeln('Ingrese el año de descubrimiento');
		readln(o.descubrimiento);
		writeln(' ');
		agregarAtras(L,ult,o);
		writeln('Ingrese el codigo del objeto');
		readln(o.codigo);
	end;
	writeln('');
end;

procedure imprimirLista (L:lista);
begin
	while (L <> nil) do begin
		writeln(L^.dato.codigo);
		L := L^.sig;
	end;
end;

procedure masLejanos(L:lista;var max1, max2, maxC1, maxC2 : real);
begin
	if (L^.dato.distancia > max1) then begin
		max2 := max1;
		max1 := L^.dato.distancia;
		maxC2 := maxC1;
		maxC1 := L^.dato.codigo;
	end else if (L^.dato.distancia > max2) then begin
		max2 := L^.dato.distancia;
		maxC2 := L^.dato.codigo;
	end;
end;

procedure Galileo (L:lista; var cantG:integer);
begin
	if ((L^.dato.descubridor = 'Galileo Galilei') and (L^.dato.categoria = 2) and (L^.dato.descubrimiento < 1600)) then
		cantG := cantG + 1;
end;

procedure vectorContador(L:lista; var v:vectorObj);
begin
	v[L^.dato.categoria] := v[L^.dato.categoria] + 1
end;

procedure codigosPares(L:lista);
var
	num, par, impar : integer;
begin
	num := L^.dato.codigo;
	par := 0;
	impar := 0;
	while (num <> 0) do begin
		if (num MOD 10 MOD 2 = 0) then
			par := par + 1
		else
			impar := impar + 1;
		num := num DIV 10;
	end;
	if (par > impar) then
		writeln('Estrellas pares: ',L^.dato.nombre);
end;

procedure inicializarVector(var v:vectorObj);
var
	i:integer;
begin
	for i:=1 to 7 do
		v[i] := 0;
end;

procedure recorrerLista(L:lista);
var
	v:vectorObj;
	cantG, i:integer;
	max1, max2, maxC1, maxC2 : real;
begin
	inicializarVector(v);
	cantG:=0;
	max1:=0;
	max2:=0;
	maxC1:=0;
	maxC2:=0;
	while (L<>nil) do begin
		masLejanos(L, max1, max2, maxC1, maxC2);
		Galileo(L,cantG);
		vectorContador(L,v);
		if (L^.dato.categoria = 2) then
			codigosPares(L);
		L:=L^.sig;
	end;
	writeln('Codigos maximos: ',maxC1:1:2,' ',maxC2:1:2);
	writeln('Galileo: ', cantG);
	for i:=1 to 7 do
		writeln(v[i]);
end;

var
	pri, ult : lista;

BEGIN
	crearLista(pri);
	crearLista(ult);
	cargarLista(pri,ult);
	imprimirLista(pri);
	recorrerLista(pri);
END.
