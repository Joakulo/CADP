program Pr7Ej7;
const
	mats = 5;

type
	vector = array [1..mats] of integer;
	alumno = record
		numero:integer;
		nom:string;
		correo : string;
		anioi : integer;
		anioe : integer;
		notas : vector;
	end;
	lista = ^nodo;
	nodo = record
		dato : alumno;
		sig : lista;
	end;


procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to mats do
		v[i] := 0;
end;

procedure cargarNotas(var v:vector);
var
	i:integer;
begin
	for i:=1 to mats do
		readln(v[i]);
end;

procedure ordenarVector(var v:vector);
var
	i,j,p,item: integer;
begin
	for i:=1 to mats-1 do begin
		p:=i;
		for j:=i+1 to mats do
			if (v[j] > v[p]) then p:=j;
		item := v[p];
		v[p] := v[i];
		v[i] := item;
	end;
end;

procedure crearLista(var L:lista);
begin
	new(L);
	L := nil;
end;

procedure agregarAtras (var L,ult:lista; a:alumno);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=a;
	nue^.sig:=nil;
	if (L = nil) then
		L:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure cargarLista(var L,ult:lista);
var
	a:alumno;
begin
	writeln('Ingrese el numero de alumno');
	readln(a.numero);
	while (a.numero <> 0) do begin
		writeln('Ingrese nombre y apellido');
		readln(a.nom);
		writeln('Ingrese el correo');
		readln(a.correo);
		writeln('Ingrese el anio de ingreso');
		readln(a.anioi);
		writeln('Ingrese el anio de egreso');
		readln(a.anioe);
		writeln('Ingrese las ',mats,' notas');
		cargarNotas(a.notas);
		ordenarVector(a.notas);
		agregarAtras(L,ult,a);
		writeln(' ');
		writeln('Ingrese el numero de alumno');
		readln(a.numero);
	end;
end;

procedure promedio (l:lista);
var
	i,prom:integer;
begin
	prom:= 0;
	for i:=1 to mats do
		prom:= prom + L^.dato.notas[i];
	writeln('El promedio de ', L^.dato.nom,' es ', (prom DIV mats));
end;

procedure impares2012 (L:lista; var cant:integer);
var
	num:integer;
	ok:boolean;
begin
	ok := true;
	num := L^.dato.numero;
	while ((num <> 0) and (ok)) do begin
		if (num MOD 10 MOD 2 = 0) then
			ok := false;
		num := num DIV 10;
	end;
	if (not ok) then cant := cant + 1;
end;

procedure dosrapidos(L:lista;var min1, min2 : integer; var minN1, minN2, minc1, minC2:string);
var
	duracion:integer;
begin
	duracion := L^.dato.anioe - L^.dato.anioi;
	if duracion < min1 then begin
		min2 := min1;
		min1 := duracion;
		
		minN2 := minN1;
		minN1 := L^.dato.nom;
		
		minC2 := minC1;
		minC1 := L^.dato.correo;
	end else if duracion < min2 then begin
		min2 := duracion;
		
		minN2 := L^.dato.nom;
		
		minC2 := L^.dato.correo;
	end;
end;

procedure recorrerLista(L:lista);
var
	cantimp, min1, min2 : integer;
	minN1, minN2, minc1, minC2 : string;
begin
	cantimp := 0;
	min1 := 9999;
	min2 := 9999;
	minN1 := 'null';
	minN2 := 'null';
	minc1 := 'null';
	minC2 := 'null';
	while L<>nil do begin
		promedio(L);
		if (L^.dato.anioi=2012) then
			impares2012(L,cantimp);
		dosrapidos(L, min1, min2, minN1, minN2, minc1, minC2);
		L := L^.sig;
	end;
	writeln('La cantidad de ingresantes impares del 2012 es ',cantimp);
	writeln('1er alumno en terminar la carrera: ',minN1,' ',minC1);
	writeln('2do alumno en terminar la carrera: ',minN2,' ',minC2);
end;

procedure imprimirLista(l:lista);
begin
	writeln('');
	while (L<>nil) do begin
		writeln(L^.dato.numero);
		writeln(L^.dato.notas[1]);
		writeln(L^.dato.notas[2]);
		writeln(L^.dato.notas[3]);
		writeln(L^.dato.notas[4]);
		writeln(L^.dato.notas[5]);
		writeln('');
		L:= L^.sig;
	end;
end;


var
	pri,ULT : lista;

BEGIN
	crearLista(pri);
	crearLista(ULT);
	cargarLista(pri,ULT);
	imprimirLista(pri);
	recorrerLista(pri);
END.

