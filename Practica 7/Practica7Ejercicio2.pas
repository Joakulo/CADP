program Pr7Ej2;

type
	poliza = 1..6;
	clientes = record
		codigo : integer;
		DNI : integer;
		nombre : string;
		cpoliza : poliza;
		montoB : integer;
	end;
	lista = ^nodo;
	nodo = record
		dato : clientes;
		sig : lista;
	end;

procedure crearLista(var L:lista);
begin
	new(L);
	L := nil;
end;

procedure agregarAdelante (var L:lista; c:clientes);
var
	nue : lista;
begin
	new(nue);
	nue^.dato := c;
	nue^.sig := L;
	L := nue;
end;

procedure cargarLista(var L:lista);
var
	c:clientes;
begin
	repeat
		writeln('Ingrese el codigo de cliente');
		readln(c.codigo);
		writeln('Ingrese el DNI');
		readln(c.DNI);
		writeln('Ingrese el nombre completo');
		readln(c.nombre);
		writeln('Ingrese el codigo');
		readln(c.cpoliza);
		writeln('Ingrese el monto basico');
		readln(c.montoB);
		agregarAdelante(L,c);
	until c.codigo = 1122;
end;

procedure imprimirLista(L:lista);
begin
	while (L<>nil) do begin
		writeln(L^.dato.DNI);
		L := L^.sig
	end;
	writeln('');
end;

procedure imprimirListaA(L:lista);
begin
	while (L <> nil) do begin
		writeln(L^.dato.codigo);
		writeln(L^.dato.DNI);
		writeln(L^.dato.nombre);
		writeln(L^.dato.cpoliza);
		writeln(L^.dato.montoB + L^.dato.cpoliza * 1000);
		L := L^.sig;
	end;
end;

procedure DNI9 (L:lista);
var
	cant9, num : integer;
	ok : boolean;
begin
	cant9 := 0;
	ok := true;
	num := L^.dato.DNI;
	while ((num <> 0) and (ok)) do begin
		if (num MOD 10 = 0) then
			cant9 := cant9 + 1;
		if cant9 >= 2 then
			ok := false;
	end;
	if not ok then begin
		writeln(L^.dato.nombre);
		writeln('');
	end;
end;

procedure EliminarCodigo(var L:lista; c:integer);
var
	act, ant : lista;
begin
	act := L;
	while (act <> nil) do begin
		if (act^.dato.codigo <> c) then begin
			ant := act;
			act := act^.sig;
		end else
			if (act <> nil) then begin
				if (act = L) then
					L := L^.sig
				else
					ant^.sig := act^.sig;
				dispose(act);
				act:=ant;
			end;
	end;
end;

var
	pri:lista;
	c:integer;
BEGIN
	crearLista(pri);
	cargarLista(pri);
	imprimirLista(pri);
	imprimirListaA(pri);
	DNI9(pri);
	writeln('Ingrese un codigo a eliminar');
	readln(c);
	EliminarCodigo(pri,c);
END.
