program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	pc^:= 'un nuevo texto';	//tira error
	new(pc);
	writeln(pc^);			//imprimiria basura
end.
