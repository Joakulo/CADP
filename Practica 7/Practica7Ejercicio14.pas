program Pr7Ej14;

type
	
	prestamos=record
		numprestamo : integer;
		ISBN : integer;
		numsocio : integer;
		dia : 1..31;
	end;
	listaPrestamos =^nodoPrestamos;
	nodoPrestamos = record
		dato:prestamos;
		sig:listaPrestamos;
	end;
	
	ISBNs = record
		ISBN : integer;
		cantprestamos : integer;
	end;
	listaISBNs =^ nodoISBNs;
	nodoISBNs = record
		dato:ISBNs;
		sig:listaISBNs;
	end;
	
	vectorDias = array [1..31] of integer;

procedure crearListaPrestamos(var L:listaPrestamos);
begin
	new(L);
	L:=nil;
end;

procedure crearListaISBNs(var L:listaISBNs);
begin
	new(L);
	L:=nil;
end;

procedure agregarAtrasPrestamos(var L,ult:listaPrestamos; p:prestamos);
var
	nue:listaPrestamos;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=nil;
	if (L = nil) then
		L := nue
	else
		ult^.sig := nue;
	ult := nue;		
end;

procedure cargarListaPrestamos (var L,ult:listaPrestamos);
var
	p:prestamos;
begin
	writeln('Ingrese el ISBN');
	readln(p.ISBN);
	while (p.ISBN <> -1) do begin
		writeln('Ingrese el numero de prestamo');
		readln(p.numprestamo);
		writeln('Ingrese el numero de socio que pidio prestado');
		readln(p.numsocio);
		writeln('Ingrese el dia del prestamo');
		readln(p.dia);
		agregarAtrasPrestamos(L,ult,p);
		writeln('Ingrese el ISBN');
		readln(p.ISBN);
	end;
end;

procedure agregarAtrasISBN(var L,ult:listaISBNs; ISBN, cant:integer);
var
	nue:listaISBNs;
begin
	new(nue);
	nue^.dato.ISBN := ISBN;
	nue^.dato.cantprestamos := cant;
	nue^.sig := nil;
	if (L=nil) then
		L:=nue
	else
		ult^.sig := nue;
	ult := nue;
end;

procedure inicializarVector (var v:vectorDias);
var
	i:integer;
begin
	for i:=1 to 31 do begin
		v[i]:=0;
	end;
end;

procedure contarPrestamosxDia (var v:vectorDias; L:listaPrestamos);
begin
	v[L^.dato.dia] := v[L^.dato.dia] + 1;
end;

procedure menosPrestamos (v:vectorDias);
var
	i, min, mini:integer;
begin
	min := 999;
	for i:=1 to 31 do begin
		if (v[i] < min) then begin
			min := v[i];
			mini := i;
		end;
	end;
	writeln('El dia con menos prestamos fue el ', mini);
end;

procedure prestamoParImpar (L:listaPrestamos; var cant:integer);
var
	par, impar : boolean;
begin
	par := (L^.dato.numprestamo MOD 2 = 0);
	impar := (L^.dato.numsocio MOD 2 = 1);
	if ((par) and (impar)) then
		cant := cant + 1;
end;

procedure recorrerLista (LP:listaPrestamos; var LI,ultI:listaISBNs);
var
	ISBNactual, cantISBNprestado, cantParImpar, cantPrestamos : integer;
	v : vectorDias;
begin
	cantParImpar := 0;
	cantPrestamos := 0;
	inicializarVector(v);
	while (LP <> nil) do begin
		ISBNactual := LP^.dato.ISBN;
		cantISBNprestado := 0;
		while ((LP<>nil) and (ISBNactual = LP^.dato.ISBN)) do begin
			cantISBNprestado := cantISBNprestado + 1;
			contarPrestamosxDia(v,LP);
			prestamoParImpar(LP,cantParImpar);
			cantPrestamos := cantPrestamos + 1;
			LP:=LP^.sig;
		end;
		agregarAtrasISBN(LI,ultI,ISBNactual,cantISBNprestado);
	end;
	menosPrestamos(v);
	writeln('La cantidad de prestamos Par Impar representan un ', cantParImpar DIV 100 * cantPrestamos);
end;

var
	LP, ultP : listaPrestamos;
	LI, ultI : listaISBNs;
	
BEGIN
	crearListaPrestamos(LP);
	crearListaPrestamos(ultP);
	crearListaISBNs(LI);
	crearListaISBNs(ultI);
	cargarListaPrestamos(LP,ultP);
	recorrerLista(LP,LI,ultI);
END.

