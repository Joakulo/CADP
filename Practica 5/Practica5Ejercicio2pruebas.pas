program punteros;
type
	cadena = string[9];
	producto = record
		codigo: integer;
		descripcion: cadena;
		precio: real;
	end;
	puntero_producto = ^producto;
var
	//p: puntero_producto;
	prod: producto;
	i:integer;
	r:real;
	s9:string[9];
	sc:cadena;
begin
	writeln(sizeof(i), ' bytes');
	writeln(sizeof(r), ' bytes');
	writeln(sizeof(s9), ' bytes');
	writeln(sizeof(sc), ' bytes');
	writeln(sizeof(prod), ' bytes');

	writeln(' ');

	//writeln(sizeof(p), ' bytes');
	//writeln(sizeof(prod), ' bytes');
	//new(p);
	//writeln(sizeof(p), ' bytes');
	//p^.codigo := 1;
	//p^.descripcion := 'nuevo ';
	//writeln(sizeof(p^), ' bytes');
	//p^.precio := 200;
	//writeln(sizeof(p^), ' bytes');
	//prod.codigo := 2;
	//prod.descripcion := 'otro ';
	//writeln(sizeof(prod), ' bytes');
end.
