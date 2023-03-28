program Pr7Ej1;

type
	vectorB = array[1..5] of integer;
	rangoG = 1..5;
	persona = record
		DNI : integer;
		nombre : string;
		edad : integer;
		genero : rangoG;
	end;
	lista = ^nodo;
	nodo = record
		dato : persona;
		sig : lista;
	end;


procedure crearLista (var L:lista);
begin
	new(L);
	L := nil;
end;

procedure agregarAdelante (var L:lista; p:persona);
var
	nue:lista;
begin
	new(nue); 
	nue^.dato:=p;
	nue^.sig := L;
	L := nue;
end;

procedure cargarLista(var L:lista);
var
	p:persona;
begin
	repeat
		writeln('Ingrese el DNI');
		readln(p.DNI);
		writeln('Ingrese el nombre completo');
		readln(p.nombre);
		writeln('Ingrese la edad ');
		readln(p.edad);
		writeln('Ingrese el genero de actuacion (1..5)');
		readln(p.genero);
		writeln('');
		agregarAdelante(L, p);
	until p.DNI = 3355;
end;

procedure imprimirLista(L:lista);
begin
	while (L <> nil) do begin;
		writeln(L^.dato.DNI);
		L := L^.sig;
	end;
end;

procedure digParesImpares (L:lista; var cantPDNI:integer);
var
	par, impar, num : integer;
begin
	par := 0;
	impar := 0;
	num := L^.dato.DNI;
	while (num <> 0) do begin
		if (num DIV 10 MOD 2 = 0) then
			par := par + 1
		else
			impar := impar + 1;
		num := num DIV 10
	end;
	if par > impar then
		cantPDNI := cantPDNI + 1;
end;

procedure inicializarVector(var v:vectorB);
var
	i:integer;
begin
	for i:=1 to 5 do
		v[i] := 0;
end;

procedure cargarVector (L:lista;var v:vectorB);
begin
	v[L^.dato.genero] := v[L^.dato.genero] + 1; 
end;

procedure maxGeneros (v:vectorB);
var
	i, max1, max2, maxC1, maxC2 : integer;
begin
	max1 := -1;
	max2 := -1;
	maxC1 := -1;
	maxC2 := -1;
	for i:=1 to 5 do begin
		if (v[i]>max1) then begin
			max2 := max1;
			max1 := v[i];
			
			maxC2 := maxC1;
			maxC1 := i;
		end else if (v[i]>max2) then begin
			max2 := v[i];
			maxC2 := i;
		end;
	end;
	writeln(maxC1, ' ', maxC2);
end;	

procedure EliminarDNI (var L:lista; v:integer);
var
	act, ant:lista;
begin
	act:= L;
	while (act <> nil) do begin
		if (act^.dato.DNI <> v) then begin
			ant := act;
			act := act^.sig;
		end else
			if (act <> nil) then begin
				if (act = L) then
					L:= L^.sig
				else
					ant^.sig := act^.sig;
				dispose(act);
				act:=ant;
			end;
	end;
end;

procedure recorrerLista(L:lista;v:vectorB);
var
	cantDNI:integer;
begin
	while (L<>nil) do begin
		digParesImpares(L,cantDNI);
		cargarVector(L,v);
		L := L^.sig;
	end;
		maxGeneros(v);
end;


var
	pri : lista;
	v:vectorB;
	A : integer;
BEGIN
	crearLista(pri);
	cargarLista(pri);
	imprimirLista(pri);
	inicializarVector(v);
	recorrerLista(pri,v);
	writeln('Ingrese un DNI a eliminar');
	readln(A);
	EliminarDNI(pri,A);
	imprimirLista(pri);
END.
