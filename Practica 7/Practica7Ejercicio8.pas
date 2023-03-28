program Pr7Ej8;

type
	rangomotivo = 1..7;
	vector = array[rangomotivo] of integer;
	fechaR = record
		hora:integer;
		dia:integer;
		mes:1..11;
	end;
	transferencias = record
		numori : integer;
		DNIori : integer;
		numdest: integer;
		DNIdest: integer;
		fecha : fechaR;
		monto : integer;
		motivo : rangomotivo;
	end;
	lista =^nodo;
	nodo = record
		dato : transferencias;
		sig:lista;
	end;

procedure crearLista(var L:lista);
begin
	new(L);
	L:=nil;
end;

procedure agregarAtras(var L,ult:lista; t:transferencias);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=t;
	nue^.sig := nil;
	if (L=nil) then
		L:=nue
	else
		ult^.sig := nue;
	ult:=nue;
end;

procedure cargarLista(var L,ult:lista);
var
	t:transferencias;
begin
	writeln('Ingrese el numero de origen');
	readln(t.numori);
	while (t.numori <> -1) do begin
{
		writeln('Ingrese el DNI origen');
		readln(t.DNIori);
}
		writeln('Ingrese el numero de destino');
		readln(t.numdest);
{
		writeln('Ingrese el DNI destino');
		readln(t.DNIdest);
		writeln('Ingrese la hora');
		readln(t.fecha.hora);
		writeln('Ingrese el dia');
		readln(t.fecha.dia);
}
		writeln('Ingrese el mes');
		readln(t.fecha.mes);
		writeln('Ingrese el monto');
		readln(t.monto);
		writeln('Ingrese el motivo (1..7)');
		readln(t.motivo);
		agregarAtras(L,ult,t);
		writeln('Ingrese el numero de origen');
		readln(t.numori);
	end;
end;

procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 7 do
		v[i] := 0;
end;

procedure vectorContador(L:lista;var v:vector);
begin
	v[L^.dato.motivo] := v[L^.dato.motivo] + 1;
end;

procedure nuevaOrdenadaP2 (var L2:lista; L:lista);
var
	act, ant, nue:lista;
begin
	new(nue);
	nue^.dato := L^.dato;
	act:=L2;
	ant:=L2;
	while ((act <> nil) and (L^.dato.numori > act^.dato.numori)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then
		L2 := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;


procedure nuevaOrdenada(var L2:lista; L:lista);
begin
	while (L<>nil) do begin
		if (L^.dato.numori <> L^.dato.numdest) then
			nuevaOrdenadaP2(L2,L);
		L:=L^.sig;
	end;
end;

procedure motivoMaximo (v:vector);
var
	i,imax,max: integer;
begin
	max := -1;
	for i:=1 to 7 do begin
		if v[i] > max then begin
			max := v[i];
			imax := i;
		end;
	end;
	writeln('El motivo que mas transacciones tuvo fue el ',imax);
end;

procedure tJunio (L:lista;var cant:integer);
var
	num, par, impar:integer;
begin
	par := 0;
	impar := 0;
	num := L^.dato.numdest;
	while (num <> 0) do begin
		if (num MOD 10 MOD 2 = 0) then
			par := par + 1
		else
			impar := impar + 1;
		num := num DIV 10;
	end;
	if (par < impar) then
		cant := cant + 1;
end;

procedure recorrerLista(L:lista);
var
	cuentaActual, montoTotal, cantJ  : integer;
	v:vector;
begin
	cantJ:=0;
	inicializarVector(v);
	while (L<>nil) do begin
		cuentaActual := L^.dato.numori;
		montoTotal:=0;
		while ((L<>nil) and (cuentaActual = L^.dato.numori)) do begin
			montoTotal := montoTotal + L^.dato.monto;
			vectorContador(L,v);
			if (L^.dato.fecha.mes = 6) then
				tJunio(L,cantJ);
			L := L^.sig;
		end;
		if (L<>nil) then begin
			writeln('La cuenta ',cuentaActual, ' transfirio un total de ', montoTotal);
			vectorContador(L,v);
			if (L^.dato.fecha.mes = 6) then
				tJunio(L,cantJ);
		end;
	end;
	writeln('La cuenta ',cuentaActual, ' transfirio un total de ', montoTotal);
	motivoMaximo(v);
	writeln('Cantidad de transferencias impares en Junio: ', cantJ);
end;

var
	pri, ult,pri2 : lista;

BEGIN
	crearLista(pri);
	crearLista(ult);
	crearLista(pri2);
	cargarLista(pri,ult);
	nuevaOrdenada(pri2,pri);
	recorrerLista(pri2);
END.

