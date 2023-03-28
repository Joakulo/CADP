

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
	while (aux <> nil) do begin;
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

//Punto A
function EstaOrdenada(L:lista):boolean;
var
	ant, act : lista;
	ok : boolean;
begin
	ant := L;
	act := L^.sig;
	ok := true;
	while ((act <> nil) and (ok)) do begin
		if (ant^.num >= act^.num) then
			ok := false;
		ant := act;
		act := act^.sig;
	end;
	EstaOrdenada := ok;
end;

//Punto B
procedure Eliminar(var L:lista; A:integer);
var
	ant, act : lista;
begin
	act := L;
	while (act <> nil) do begin
		if (act^.num <> A) then begin
			ant:=act;
			act:=act^.sig;
		end else 
			if (act <> nil) then begin
				if (act = L) then
					L := L^.sig
				else
					ant^.sig := act^.sig;
				dispose(act);
				act := ant;
			end;
	end;
end;

//Punto C
procedure Sublista(L:lista; B,C : integer; var S:lista);
begin
	while (L <> nil) do begin
		if ((L^.num > B) and (L^.num < C)) then
			armarNodo(S,L^.num);
		L := L^.sig;
	end;
end;

//Punto D
procedure SublistaD(L:lista; B,C : integer; var S:lista);
var
	ok : boolean;
begin
	ok := false;
	while ((L <> nil) and (ok)) do begin
		if ((L^.num > B) and (L^.num < C)) then
			armarNodo(S,L^.num);
		if (L^.num > C) then
			ok := false;
		L := L^.sig;
	end;
end;

//Punto E
procedure SublistaE(L:lista; B,C : integer; var S:lista);
var
	ok : boolean;
begin
	ok := false;
	while ((L <> nil) and (ok)) do begin
		if ((L^.num > B) and (L^.num < C)) then
			armarNodo(S,L^.num);
		if (L^.num < B) then
			ok := false;
		L := L^.sig;
	end;
end;

var
	pri, S : lista;
	valor, A, B, C : integer;
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
	if (EstaOrdenada(pri)) then
		writeln('True')
	else
		writeln('False');
	writeln(' ');
	writeln('Ingrese un valor a eliminar');
	readln(A);
	Eliminar(pri,A);
	imprimirLista(pri);
	writeln('Ingrese dos valores');
	readln(B);
	readln(C);
	Sublista(pri,B,C,S);
	imprimirLista(S);
end.
