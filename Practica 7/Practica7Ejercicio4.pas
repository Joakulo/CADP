program Pr7Ej4;

type
	vector = array [0..42] of integer;
	embarazada = record
		nom : string;
		pesopri : vector;
		dimL : integer;
	end;
	lista = ^nodo;
	nodo = record
		dato : embarazada;
		sig : lista;
	end;

procedure crearLista(var L:lista);
begin
	new(L);
	L := nil;
end;

procedure agregarAdelante(var L:lista; e:embarazada);
var
	nue : lista;
begin
	new(nue); 
	nue^.dato := e;
	nue^.sig := L;
	L := nue;
end;

procedure cargarLista(var L:lista);
var
	e:embarazada;
	i, num : integer;
	v:vector;
begin
	i := 1;
	writeln('Ingrese nombre y apellido');
	readln(e.nom);
	while (e.nom <> 'zzz') do begin
		v[0] := 0;
		writeln('Ingrese el peso del primer dia de la semana ', i);
		readln(num);
		v[i] := num;
		while (num > v[i-1]) do begin
			v[i] := num;
			i := i + 1;
			writeln('Ingrese el peso del primer dia de la semana ', i);
			readln(num);
		end;
		e.dimL := i-1;
		e.pesopri := v;
		i := 1;
		agregarAdelante(L,e);
		writeln('Ingrese nombre y apellido');
		readln(e.nom);
	end;
end;

procedure imprimirLista(L:lista);
begin
	while (L<>nil) do begin
		writeln(L^.dato.nom);
		L := L^.sig;
	end;
end;

procedure mayorAumento (L:lista);
var
	max, maxs, i : integer;
begin
	max := -1;
	for i := 2 to L^.dato.dimL do begin
		if ((L^.dato.pesopri[i] - L^.dato.pesopri[i-1]) > (max)) then begin
			max := L^.dato.pesopri[i] - L^.dato.pesopri[i-1];
			maxs := i;
		end;
	end;
	writeln('La semana con mayor aumento de peso de ', L^.dato.nom, ' fue la semana numero ', maxs);
end;

procedure pesoTotal(L:lista);
begin
		writeln(L^.dato.pesopri[L^.dato.dimL] - L^.dato.pesopri[1]);
end;

procedure recorrerLista (L:lista);
begin
	while (L<>nil) do begin
		mayorAumento(L);
		pesoTotal(L);
		writeln('');
		L:= L^.sig;
	end;
end;

var
	pri:lista;

BEGIN
	crearLista(pri);
	cargarLista(pri);
	imprimirLista(pri);
	recorrerLista(pri);
END.
