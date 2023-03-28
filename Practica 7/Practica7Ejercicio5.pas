program Pr7Ej5;

type
	rangoC = 1..100;
	camiones = record
		patente : string;
		anioF: integer;
		capacidad: real;
	end;
	vector = array [rangoC] of camiones;
	viajes = record
		codigoV:integer;
		codigoC:rangoC;
		kmsrecorridos:integer;
		destino:string;
		anio:integer;
		DNI:integer;
	end;
	lista = ^nodo;
	nodo = record
		dato:viajes;
		sig:lista;
	end;

procedure cargarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 5 do begin
		writeln('Ingrese la patente');
		readln(v[i].patente);
		writeln('Ingrese el año de fabricacion');
		readln(v[i].anioF);
		writeln('Ingrese la capacidad');
		readln(v[i].capacidad);
		writeln('');
	end;
end;

procedure crearLista(var L:lista);
begin
	new(L);
	L:=nil;
end;

procedure insertarOrdenado (var L:lista; v:viajes);
var
	nue:lista;
	ant, act:lista;
begin
	new(nue);
	nue^.dato := v;
	act:=L;
	ant:=L;
	while ((act <> nil) and (v.codigoC > act^.dato.codigoC)) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if act = L then
		L:=nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure cargarLista(var L:lista);
var
	v:viajes;
begin
	writeln('Ingrese el codigo de viaje');
	readln(v.codigoV);
	while (v.codigoV <> -1) do begin
		writeln('Ingrese el codigo de camion');
		readln(v.codigoC);
		writeln('Ingrese lops kilometros recorridos');
		readln(v.kmsrecorridos);
		writeln('Ingrese el destino');
		readln(v.destino);
		writeln('Ingrese el año en el que se realizó el viaje');
		readln(v.anio);
		writeln('Ingrese el DNI del chofer');
		readln(v.DNI);
		writeln('');
		insertarOrdenado(L,v);
		writeln('Ingrese el codigo de viaje');
		readln(v.codigoV);
	end;
end;

procedure maxKMS(L:lista;v:vector;kmsxcamion:integer;var max:integer; var maxPatente:string);
begin
	if kmsxcamion > max then begin
		max := kmsxcamion;
		maxPatente := v[L^.dato.codigoC].patente;
	end;
end;

procedure minKMS(L:lista;v:vector;kmsxcamion:integer;var min:integer; var minPatente:string);
begin
	if kmsxcamion < min then begin
		min := kmsxcamion;
		minPatente := v[L^.dato.codigoC].patente;
	end;
end;

procedure cantViajes(L:lista;v:vector;var cant:integer);
begin
	if ((v[L^.dato.codigoC].capacidad > 30.5) and (L^.dato.anio - v[L^.dato.codigoC].anioF > 5)) then
		cant := cant + 1;
end;

procedure DNISimpares(L:lista);
var
	ok:boolean;
	num:integer;
begin
	ok:=true;
	num:=L^.dato.DNI;
	while ((num <> 0) and (ok)) do begin
		if (num MOD 2 = 0) then
			ok := false;
		num := num DIV 10;
	end;
	if (ok) then writeln('Codigo de viaje con chofer DNI impar: ',L^.dato.codigoV);
end;

procedure recorrerLista(L:lista;v:vector);
var
	aux : lista;
	kms, max, min, cantv, codigoactual: integer;
	maxPatente, minPatente:string;
begin
	max:=-1;
	min:=9999;
	cantv := 0;
	while (L<>nil) do begin
		kms := 0;
		codigoactual := L^.dato.codigoC;
		while ((L<>nil) and (codigoactual = L^.dato.codigoC)) do begin
			kms := kms + L^.dato.kmsrecorridos;
			cantviajes(L,v,cantv);
			DNISimpares(L);
			aux := L;
			L := L^.sig
		end;
		if (L<>nil) then begin
			maxKMS(L,v,kms,max,maxPatente);
			minKMS(L,v,kms,min,minPatente);
			cantviajes(L,v,cantv);
			DNISimpares(L);
		end else begin		
			maxKMS(aux,v,kms,max,maxPatente);
			minKMS(aux,v,kms,min,minPatente);
			cantviajes(aux,v,cantv);
			DNISimpares(aux);
		end;
		L := L^.sig;
	end;
	writeln('Patente del camion con mayor cantidad de kilometros recorridos: ', maxPatente);
	writeln('Patente del camion con menor cantidad de kilometros recorridos: ', minPatente);
	writeln('Cantidad de viajes: ',cantv);
end;


var
	pri:lista;
	v:vector;

BEGIN
	crearLista(pri);
	cargarVector(v);
	cargarLista(pri);
	recorrerLista(pri,v);
END.

