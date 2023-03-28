program Pr7Ej11;

const
	canteventos = 100;

type
	eventos = record
		nombre:string;
		tipo:1..5;
		lugar:string;
		maxpersonas:integer;
		costo:integer;
	end;
	vector = array [1..canteventos] of eventos;
	vectorContador = array [1..canteventos] of integer;
	
	ventas = record
		codigo:integer;
		numevento:1..canteventos;
		DNI:integer;
		cantentradas:integer;
	end;
	lista =^nodo;
	nodo=record
		dato:ventas;
		sig:lista;
	end;

procedure crearLista(var L:lista);
begin
	new(L);
	L:=nil;
end;

procedure agregarAdelante(var L:lista; v:ventas);
var
	nue:lista;
begin
	new(nue);
	nue^.dato := v;
	nue^.sig:=L;
	L:=nue;
end;

procedure cargarLista(var L:lista);
var
	v:ventas;
begin
	writeln('Ingrese el codigo');
	readln(v.codigo);
	while (v.codigo <> -1) do begin
		writeln('Ingrese el numero de evento (1..100');
		readln(v.numevento);
		writeln('Ingrese el DNI del comprador');
		readln(v.DNI);
		writeln('Ingrese la cantidad de entradas');
		readln(v.cantentradas);
		agregarAdelante(L,v);
		writeln('Ingrese el codigo');
		readln(v.codigo);
	end;
end;

procedure inicializarVector (var v:vectorContador);
var
	i:integer;
begin
	for i:=1 to canteventos do begin
		v[i]:=0;
	end;
end;

procedure inicializarVector (var v:vector);
var
	i:integer;
begin
	for i:=1 to canteventos do begin
		v[i].nombre:='null';
		v[i].tipo:=1;
		v[i].lugar:='null';
		v[i].maxpersonas:=0;
		v[i].costo:=0;
	end;
end;

procedure cantEntradasEventosPobres (L:lista; var vc:vectorContador);
begin
	vc[L^.dato.numevento] := vc[L^.dato.numevento] + L^.dato.cantentradas;
end;

procedure EventosPobres (ve:vector; vc:vectorContador);
var
	i, min1, min2:integer;
	minN1, minN2, minL1, minL2 : string;
begin
	min1 := 9999;
	min2 := 9999;
	minN1 := 'null';
	minN2 := 'null';
	minL1 := 'null';
	minL2 := 'null';
	for i:=1 to canteventos do begin
		vc[i] := vc[i] * ve[i].costo;
		if vc[i] < min1 then begin
			min2 := min1;
			min1 := vc[i];
			minN2 := minN1;
			minN1 := ve[i].nombre;
			minL2 := minL1;
			minL1 := ve[i].lugar;
		end else if vc[i] < min2 then begin
			min2 := vc[i];
			minN2 := ve[i].nombre;
			minL2 := ve[i].lugar;
		end;
	end;
	writeln('EL evento con menor recaudacion fue ', minN1, ' ', minL1);
	writeln('EL 2do evento con menor recaudacion fue ', minN2, ' ', minL2);
end;

procedure entradasPares (L:lista; ve:vector; var cant:integer);
var
	num, par, impar:integer;
begin
	if (ve[L^.dato.numevento].tipo = 3) then begin
		par:=0;
		impar:=0;
		num := L^.dato.DNI;
		while (num <> 0) do begin
			if (num MOD 10 MOD 2 = 0) then
				par := par + 1
			else
				impar := impar + 1;
			num := num DIV 10;
		end;
		if (par > impar) then 
			cant := cant + L^.dato.cantentradas;
	end;
end;

procedure evento50 (L:lista; var cant:integer);
begin
	if (L^.dato.numevento = 50) then
		cant := cant + L^.dato.cantentradas;
end;

procedure recorrerLista(L:lista; ve:vector);
var
	vc : vectorContador;
	cantEntradasPares, cant50:integer;
begin
	inicializarVector(vc);
	cantEntradasPares := 0;
	cant50 := 0;
	while (L <> nil) do begin
		cantEntradasEventosPobres(L, vc);
		entradasPares(L,ve,cantEntradasPares);
		evento50(L,cant50);
	end;
	EventosPobres(ve,vc);
	writeln('La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares y que sean para el evento de tipo “obra de teatro” es de ', cantEntradasPares);
	if (cant50 = ve[50].maxpersonas) then
		writeln('El evento 50 se lleno')
	else
		writeln('El evento 50 no se lleno');
end;




var
	pri:lista;
	ve:vector;

BEGIN
	crearLista(pri);
	cargarLista(pri);
	inicializarVector(ve);
	recorrerLista(pri,ve);
	
END.

