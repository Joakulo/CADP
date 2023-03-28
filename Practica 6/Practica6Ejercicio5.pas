program Pr6Ej5;

type
	producto = record
		codigo : integer;
		desc : string;
		stockA : integer;
		StockM : integer;
		precio : real;
	end;
	lista = ^nodo;
	nodo = record
		dato : producto;
		sig : lista;
	end;
	
procedure crearLista (var L:lista);
begin
	new(L);
	L := nil;
end;

procedure leerProducto(var p:producto);
begin
	writeln('Ingrese el codigo');
	readln(p.codigo);
	if (p.codigo <> -1) then begin
		writeln('Ingrese la descripcion');
		readln(p.desc);
		writeln('Ingrese el stock actual');
		readln(p.stockA);
		writeln('Ingrese el stock minimo');
		readln(p.StockM);
		writeln('Ingrese el precio');
		readln(p.precio);
		writeln(' ');
	end;
end;

procedure agregar(var L:lista; p:producto);
var
	aux:lista;
begin
	new(aux);
	aux^.dato := p;
	aux^.sig := L;
	L := aux;
end;

procedure cargarLista(var L:lista);
var
	p:producto;
begin
	leerProducto(p);
	while (p.codigo <> -1) do begin
		agregar(L,p);
		leerProducto(p);
	end;
end;

function porcentaje(L:lista):real;
var
	cantp, cantm : real;
begin
	cantp := 0;
	cantm := 0;
	while (L<>nil) do begin
		cantp := cantp + 1;
		if (L^.dato.stockA < L^.dato.stockM) then
			cantm := cantm + 1;
		L := L^.sig;
	end;
	porcentaje := cantm / cantp;
end;

procedure descCompuesto (L:lista);
var
	dig, cantd, num : integer;
begin
	cantd := 0;
	while (L <> nil) do begin
		num := L^.dato.codigo;
		while (num <>0) do begin
			dig := num DIV 10;
			if (dig MOD 2 = 0) then
				cantd := cantd + 1;
			num := num MOD 10;
		end;
		if (cantd >= 3) then
			writeln(L^.dato.desc);
			writeln(' ');
		L := L^.sig;
	end;
end;

procedure dosmin (L:lista);
var
	min1, min2 : real;
	Cmin1, Cmin2 : integer;
begin
	min1:=9999;
	min2:=9999;
	Cmin1 := -1;
	Cmin2 := -1;
	while (L<>nil) do begin
		if (L^.dato.precio<min1) then begin
			min2 := min1;
			min1 := L^.dato.precio;
			Cmin2 := Cmin1;
			Cmin1 := L^.dato.codigo;
		end else if (L^.dato.precio<min2) then begin
			min2 := L^.dato.precio;
			Cmin2 := L^.dato.codigo
		end;
		L := L^.sig;
	end;
	writeln(Cmin1,' ',Cmin2);
	writeln(' ');
end;

var
	L:lista;
BEGIN
	crearLista(L);
	cargarLista(L);
	writeln(porcentaje(L),'%');
	writeln(' ');
	descCompuesto(L);
	dosMin(L);
END.

