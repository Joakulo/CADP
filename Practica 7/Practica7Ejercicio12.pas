program Pr7Ej12;

type
	vector = array [1..4] of integer;
	clientes = record
		nombre : string;
		DNI : integer;
		edad : integer;
		suscripcion : 1..4;
	end;
	lista =^nodo;
	nodo = record
		dato:clientes;
		sig:lista;
	end;

	clientesDNI = record
		nombre:string;
		DNI:integer;
	end;
	listaDNI =^nodoDNI;
	nodoDNI = record
		dato:clientesDNI;
		sig:listaDNI;
	end;


procedure crearLista(var L:lista);
begin
	new(L);
	L:=nil;
end;

procedure crearListaDNI(var L:listaDNI);
begin
	new(L);
	L:=nil;
end;

procedure inicializarVector (var v:vector);
var
	i:integer;
begin
	for i:=1 to 4 do begin
		v[i]:=0;
	end;
end;

procedure agregarAdelante(var L:lista; c:clientes);
var
	nue:lista;
begin
	new(nue);
	nue^.dato := c;
	nue^.sig := L;
	L := nue;
end;

procedure cargarLista (var L:lista);
var
	c:clientes;
begin
	writeln('Ingrese el DNI');
	readln(c.DNI);
	while (c.DNI <> 0) do begin
		writeln('Ingrese el nombre');
		readln(c.nombre);
		writeln('Ingrese la edad');
		readln(c.edad);
		writeln('Ingrese el tipo de suscripcion (1..4)');
		readln(c.suscripcion);
		agregarAdelante(L,c);
		writeln('Ingrese el DNI');
		readln(c.DNI);
	end;
end;

procedure cantSuscripcionesxTipo(L:lista; var v:vector);
begin
	v[L^.dato.suscripcion] := v[L^.dato.suscripcion] + 1;
end;

procedure gananciaTotal (v, vp:vector; var ganancia:integer);
var
	i:integer;
begin
	for i:=1 to 4 do begin
		ganancia := ganancia + (v[i] * vp[i]);
	end;
	writeln('La ganancia total fue de ', ganancia);
end;

procedure maxSuscripciones (v:vector);
var
	i,max1,max2,maxS1,maxS2 : integer;
begin
	max1:=-1;
	max2:=-1;
	maxS1:=-1;
	maxS2:=-1;
	for i:=1 to 4 do begin
		if (v[i]>max1) then begin
			max2:=max1;
			max1:=v[i];
			
			maxS2:=maxS1;
			maxS1:=i;
		end else if (v[i] > max2) then begin
			max2:=v[i];
			maxS2:=i;
		end;
	end;
	writeln('Las suscripciones con mas clientes son ', maxS1,' ' ,maxS2);
end;

procedure generarOrdenadaDNI(L:lista; var L2:listaDNI);
var
	nue, act, ant:listaDNI;
begin
	if ((L^.dato.edad > 40) and ((L^.dato.suscripcion = 3) or (L^.dato.suscripcion = 4))) then begin
		new(nue);
		nue^.dato.DNI := L^.dato.DNI;
		nue^.dato.nombre := L^.dato.nombre;
		act := L2;
		ant := L2;
		while ((act <> nil) and (L^.dato.DNI < act^.dato.DNI)) do begin
			ant := act;
			act := act^.sig
		end;
		if (act = ant) then
			L2 := nue
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;
end;

procedure recorrerLista(L:lista; LDNI:listaDNI; vP:vector);
var
	ganancia : integer;
	vGT : vector;
begin
	inicializarVector(vGT);
	while (L <> nil) do begin
		cantSuscripcionesxTipo(L,vGT);
		maxSuscripciones(vGT);
		generarOrdenadaDNI(L,LDNI);
		L := L^.sig;
	end;
	gananciaTotal(vGT,vP,ganancia);
end;


var
	L:lista;
	LDNI:listaDNI;
	vP:vector;
BEGIN
	crearLista(L);
	cargarLista(L);
	crearListaDNI(LDNI);
	inicializarVector(vP);
	recorrerLista(L,LDNI,vP);
END.

