program sexo;

type
	lista=^nodo;
	nodo = record
		dato : integer;
		sig:lista;
	end;

procedure crearLista(var L:lista);
begin
	new(L);
	L:=nil;
end;

procedure agregarAdelante (var L:lista; num:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato := num;
	nue^.sig := L;
	L := nue;
end;

procedure cargarLista (var L:lista);
var
	num:integer;
begin
	readln(num);
	while (num <> -1) do begin
		agregarAdelante(L,num);
		readln(num);
	end;
end;

procedure Eliminar (var L:lista; num : integer);
var
	act, ant : lista;
begin
	act := L;
	while (act <> nil) do begin
		if (act^.dato <> num) then begin
			ant := act;
			act := act^.sig;
		end else
			if (act <> nil) then begin
				 if (act = L) then begin
					L := L^.sig;
					ant := L;
				end else
					ant^.sig := act^.sig;
				dispose(act);
				act := ant;
			end;
	end;
end;

procedure imprimirlista(L:lista);
begin
	while (l<>nil) do begin
		writeln(L^.dato);
		L:=L^.sig;
	end;
end;

var
	l:lista;
	num : integer;
BEGIN
	crearLista(L);
	cargarLista(L);
	imprimirlista(L);
	writeln('Ingrese un numero a eliminar 5');
	readln(num);
	Eliminar(L,num);
	imprimirlista(L);

END.

