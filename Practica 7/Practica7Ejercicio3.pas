program Pr7Ej3;

type
	viajes = record
		numv : integer;
		codauto : integer;
		direori : string;
		direfin : string;
		kms : integer;
	end;
	lista = ^nodo;
	nodo = record
		dato : viajes;
		sig : lista;
	end;

procedure crearLista (var L:lista);
begin
	new(L);
	L := nil;
end;

procedure imprimirLista(L:lista);
begin
	while (L <> nil) do begin;
		writeln(L^.dato.codauto);
		L := L^.sig;
	end;
end;

procedure InsertarOrdenadoCodigo (var L:lista; v:viajes);
var
	nue : lista;
	act, ant:lista;
begin
	new(nue);
	nue^.dato := v;
	act := L;
	ant := L;
	while ((act <> nil) and (v.codauto > act^.dato.codauto)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = L) then
		L := nue
	else 
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure InsertarOrdenadoNumero (L:lista; var L2:lista);
var
	nue : lista;
	act, ant:lista;
begin
	new(nue);
	nue^.dato := L^.dato;
	act := L2;
	ant := L2;
	while ((act <> nil) and (L^.dato.numv > act^.dato.numv)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = L2) then
		L2 := nue
	else 
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarLista(var L:lista);
var
	v:viajes;
begin
	repeat
		writeln('Ingrese el numero de viaje');
		readln(v.numv);
		writeln('Ingrese el codigo de auto');
		readln(v.codauto);
		writeln('Ingrese la direccion de origen');
		readln(v.direori);
		writeln('Ingrese la direccion de fin');
		readln(v.direfin);
		writeln('Ingrese los kilometros recorridos');
		readln(v.kms);
		writeln('');
		InsertarOrdenadoCodigo(L,v);
	until v.codauto = -1;
end;

procedure maxkms2 (codigo, kms:integer; var max1, max2, maxC1, maxC2 : integer);
begin
	if kms > max1 then begin
		max2 := max1;
		max1 := kms;
		
		maxC2 := maxC1;
		maxC1 := codigo;
	end else if kms > max2 then begin
		max2 := kms;
		maxC2 := codigo;
	end;
end;

procedure contarkms (L:lista; var max1, max2, maxC1, maxC2 : integer);
var
	kmsxcodigo, codigoactual : integer;
begin
	kmsxcodigo := 0;
	codigoactual := L^.dato.codauto;
	while ((L <> nil) and (codigoactual = L^.dato.codauto)) do begin
		kmsxcodigo := kmsxcodigo + L^.dato.kms;
		L := L^.sig;
	end;
	maxkms2(codigoactual,kmsxcodigo, max1, max2, maxC1, maxC2);
end;

procedure recorrerLista(L:lista;var L2:lista);
var
	max1, max2, maxC1, maxC2 : integer;
begin
	max1 :=0; max2:=0; maxC1:=0; maxC2:=0;
	while (L<>nil) do begin
		contarkms(L,max1, max2, maxC1, maxC2);
		if (L^.dato.kms > 5) then
			InsertarOrdenadoNumero(L,L2);
		L := L^.sig;
	end;
	writeln(maxC1,' ',maxC2);
end;

var
	pri, pri2 : lista;
	
BEGIN
	crearLista(pri);
	cargarLista(pri);
	imprimirLista(pri);
	recorrerLista(pri, pri2);
	imprimirLista(pri2);
END.
