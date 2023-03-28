program Pr7Ej8;

type
	vector = array [1..8] of integer;
	
	pelicula = record
		codeP : integer;
		titulo : string;
		codeG : 1..8;
		puntaje : 1..10;
	end;
	listaP =^nodoP;
	nodoP = record
		dato:pelicula;
		sig:listaP;
	end;
	critica = record
		DNI : integer;
		nom : string;
		codeP : integer;
		puntaje : 1..10;
	end;
	listaC =^nodoC;
	nodoC = record
		dato:critica;
		sig:listaC
	end;

procedure crearListaC(var L:listaC);
begin
	new(L);
	L:=nil;
end;

procedure crearListaP(var L:listaP);
begin
	new(L);
	L:=nil;
end;

procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 7 do
		v[i] := 0;
end;

procedure agregarAtrasP(var L,ult:listaP; p:pelicula);
var
	nue:listaP;
begin
	new(nue);
	nue^.dato := p;
	nue^.sig:=nil;
	if (L = nil) then
		L := nue
	else
		ult^.sig:=nue;
	ult := nue;
end;

procedure agregarAtrasC(var L,ult:listaC; c:critica);
var
	nue:listaC;
begin
	new(nue);
	nue^.dato := c;
	nue^.sig:=nil;
	if (L = nil) then
		L := nue
	else
		ult^.sig:=nue;
	ult := nue;
end;

procedure cargarListaP (var L:listaP);
var
	p:pelicula;
	ult:listaP;
begin
	writeln('Ingrese el codigo de pelicula');
	readln(p.codeP);
	while (p.codeP <> -1) do begin
		writeln('Ingrese el titulo');
		readln(p.titulo);
		writeln('Ingrese el codigo de genero (1..8)');
		readln(p.codeG);
		writeln('Ingrese el puntaje (1..10)');
		readln(p.puntaje);
		agregarAtrasP(L,ult,p);
		writeln('Ingrese el codigo de pelicula');
		readln(p.codeP);
	end;
end;

procedure actualizarLista(LP:listaP; prom:integer);
begin
	while (LP<>nil) do begin
		LP^.dato.puntaje := prom;
		LP:=LP^.sig;
	end;
end;

procedure cargarListaC (var LC:listaC; LP:listaP);
var
	c:critica;
	prom, codeActual:integer;
	ult:listaC;
begin
	writeln('Ingrese el codigo de pelicula');
	readln(c.codeP);
	while (c.codeP <> -1) do begin
		prom:=0;
		codeActual := c.codeP;
		while ((c.codeP <> -1) and (codeActual = c.codeP)) do begin
			writeln('Ingrese el titulo');
			readln(c.DNI);
			writeln('Ingrese el codigo de genero (1..8)');
			readln(c.nom);
			writeln('Ingrese el puntaje (1..10)');
			readln(c.puntaje);
			agregarAtrasC(LC,ult,c);
			prom := prom + c.puntaje;
			writeln('Ingrese el codigo de pelicula');
			readln(c.codeP);
		end;
		actualizarLista(LP,prom);
	end;
end;

procedure maxCode (LP:listaP; LC:listaC; var v1,v2:vector);
var
	i, max, maxi:integer;
begin
	max:=-1;
	while (LC <> nil) do begin
		while ((LP <> nil) and (LP^.dato.codeP <> LC^.dato.codeP)) do begin
			LP := LP^.sig;
		end;
		v1[LP^.dato.codeG] := v1[LP^.dato.codeG] + LP^.dato.puntaje;
		v2[LP^.dato.codeG] := v2[LP^.dato.codeG] + 1;
		LC := LC^.sig;
	end;
	for i:=1 to 8 do begin
		v1[i] := v1[i] DIV v2[i];
		if (v1[i] > max) then begin
			max := v1[i];
			maxi := i;
		end;
	end;
	writeln('El genero con mayor puntaje fue el ', maxi);
end;

procedure criticosIP(LC:listaC);
var
	num,par,impar:integer;
begin
	num := LC^.dato.DNI;
	par := 0;
	impar:=0;
	while (num<>0) do begin
		if (num MOD 10 MOD 2 = 0) then
			par := par + 1
		else
			impar := impar + 1;
		num := num DIV 10;
	end;
	if (par=impar) then 
		writeln(LC^.dato.nom,' tiene par = impar');
end;

procedure EliminarP(var LP:listaP; num:integer);
var
	act, ant:listaP;
begin
	act:=LP;
	ant:=LP;
	while (act<>nil) do begin
		if (act^.dato.codeP <> num) then begin
			ant := act;
			act := act^.sig;
		end else
			if (act <> nil) then begin
				if (act = LP) then
					LP := LP^.sig
				else
					ant^.sig := act^.sig;
				dispose(act);
				act := ant;
			end;
	end;
end;

procedure recorrerLista(LC:listaC; LP:listaP);
var
	v1,v2:vector;
	num:integer;
begin
	inicializarVector(v1);
	inicializarVector(v2);
	cargarListaC(LC,LP);
	maxcode(LP,LC,v1,v2);
	while (LC <> nil) do begin
		criticosIP(LC);
		LC:=LC^.sig;
	end;
	writeln('Ingrese el codigo de una pelicula a eliminar');
	readln(num);
	EliminarP(LP,num);
end;

var
	priP:listaP;
	priC:listaC;
	
BEGIN
	crearListaP(priP);
	crearListaC(priC);
	recorrerLista(priC,priP);
END.
