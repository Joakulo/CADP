program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;

procedure imprimirLista(L:lista);
var
	aux : lista;
begin
	aux := L;
	while (aux <> nil) do begin
		writeln(aux^.num);
		aux := aux^.sig;
	end;
end;

procedure incrementar(L:lista; v:integer);
var
	aux : lista;
begin
	aux := L;
	while (aux <> nil) do begin
		aux^.num := aux^.num + v;
		aux := aux^.sig;
	end;
end;

function maximo (L:lista):integer;
var
	max:integer;
begin
	max:=-9999;
	while (L <> nil) do begin
		if L^.num > max then
			max := L^.num;
		L:=L^.sig;
	end;
	maximo := max;
end;

function minimo (L:lista):integer;
var
	min:integer;
begin
	min:=9999;
	while (L <> nil) do begin
		if L^.num < min then
			min := L^.num;
		L:=L^.sig;
	end;
	minimo := min;
end;

function multiplos(L:lista; A:integer):integer;
var
	cantaux : integer;
begin
	cantaux:=0;
	while (L<>nil) do begin
		if (L^.num MOD A = 0) then
			cantaux := cantaux + 1;
		L := L^.sig;
	end;
	multiplos := cantaux;
end;

var
	pri : lista;
	valor, num, A : integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	imprimirLista(pri);
	writeln('Ingrese un nuevo valor');
	readln(num);
	incrementar(pri,num);
	imprimirLista(pri);
	writeln(' ');
	writeln(maximo(pri));
	writeln(' ');
	writeln(minimo(pri));
	writeln(' ');
	writeln('Escriba un numero');
	readln(A);
	writeln('Cantidad de multiplos de ', A, multiplos(pri,A));
end.
