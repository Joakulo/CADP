program Pr7Ej13;

type
	libros = record
		titulo : string;
		nombreeditorial : string;
		cantpaginas : integer;
		anioedicion : integer;
		ventas : integer;
		tematica : string;
	end;
	listaLibros =^nodoLibros;
	nodoLibros = record
		dato : libros;
		sig : listaLibros;
	end;
	
	PlanetaLista = record
		titulo:string;
		tematica : string;
		cantpaginas : integer;
	end;
	listaPlaneta =^nodoPlaneta;
	nodoPlaneta = record
		dato:PlanetaLista;
		sig:listaPlaneta;
	end;
	
	PlanetaLibros = record
		nombre:string;
		anioantiguo:integer;
		libroseditados:integer;
		totalventas : integer;
		librosPlaneta : listaPlaneta;
	end;

procedure crearListaLibros(var L:listaLibros);
begin
	new(L);
	L:=nil;
end;

procedure crearListaPlaneta(var L:listaPlaneta);
begin
	new(L);
	L:=nil;
end;

procedure agregarAdelante(var L:listaLibros; li:libros);
var
	nue:listaLibros;
begin
	new(nue);
	nue^.dato:=li;
	nue^.sig:=L;
	L:=nue;
end;

procedure cargarListaLibros(var L:listaLibros);
var
	li:libros;
begin
	repeat
		readln(li.titulo);
		readln(li.nombreeditorial);
		readln(li.cantpaginas);
		readln(li.anioedicion);
		readln(li.ventas);
		readln(li.tematica);
		agregarAdelante(L,li);
	until (li.titulo = 'Relato de un naufrago');
end;

procedure masAntiguo (L:listaLibros; var min:integer);
begin
	if (L^.dato.nombreeditorial = 'Planeta Libros') then begin
		if L^.dato.anioedicion < min then
			min := L^.dato.anioedicion;
	end;
end;

procedure librosEditados (L:listaLibros; var cant:integer);
begin
	if (L^.dato.nombreeditorial = 'Planeta Libros') then begin
		cant := cant + 1;
	end;
end;

procedure librosVendidos (L:listaLibros; var cant:integer);
begin
	cant := cant + L^.dato.ventas;
end;

procedure lista250 (L:listaLibros; LP :listaPlaneta);
begin
	if (L^.dato.ventas > 250) then begin
		LP^.dato.titulo := L^.dato.titulo;
		LP^.dato.tematica := L^.dato.tematica;
		LP^.dato.cantpaginas := L^.dato.cantpaginas;
	end;
end;

procedure recorrerLista(L:listaLibros; LP:listaPlaneta);
var
	min, cantEditados, cantVendidos:integer;
begin
	while (L <> nil) do begin
		masAntiguo(L,min);
		librosEditados(L,cantEditados);
		librosVendidos(L,cantVendidos);
		lista250(L,LP);
		L := L^.sig;
	end;
	writeln('Planeta Libros');
	writeln('El libro mas antiguo es del ', min);
	writeln('Cantidad de libros editaos: ', cantEditados);
	writeln('Cantidad de libros vendidos: ', cantVendidos);
end;

procedure imprimirListaPlaneta (LP:listaPlaneta);
begin
	while (LP <> nil) do begin
		writeln('Planeta Libros');
		writeln(LP^.dato.titulo);
		writeln('');
	end;
end;

var
	L:listaLibros;
	LP:listaPlaneta;

BEGIN
	crearListaLibros(L);
	crearListaPlaneta(LP);
	cargarListaLibros(L);
	recorrerLista(L,LP);
END.
