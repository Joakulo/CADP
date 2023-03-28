program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

procedure armarNodo(var L, Ult: lista; v: integer);
var
	aux : lista;
begin
	new (aux); 				{Creo un nodo}
	aux^.num := v; 			{Cargo el numero}
	aux^.sig := nil; 		{Inicializo enlace en nil}
	if( L = nil) then 		{Si la lista está vacía}
		L:= aux 			{Actualizo el inicio}
	else 					{Si la lista no está vacía}
		Ult^.sig := aux; 	{Realizo enlace con el último}
	Ult := aux; 			{Actualizo el último}
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
	pri, ult : lista;
	valor, num : integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, ult, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	imprimirLista(pri);
	writeln('Ingrese un nuevo valor');
	readln(num);
	incrementar(pri,num);
	imprimirLista(pri);
end.
