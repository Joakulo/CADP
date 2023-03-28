program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

procedure armarNodo(var L: lista; v: integer);
var
	nue : lista;
	act, ant : lista;
begin
	new(nue);
	nue^.num := v;
	act := L;
	ant := L;	 
	while ((act <> nil) and (act^.num < v)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then
		L:=nue
	else
		ant^.sig := nue;
	nue^.sig := act;
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

var
	pri : lista;
	valor, num : integer;
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
end.
