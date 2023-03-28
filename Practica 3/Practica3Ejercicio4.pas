program Pr3Ej4;

Const
	MB = 1.35;
	minuto = 3.40;

Type

	lineas = record
		numero : integer;
		cantminutos : real;
		cantMB : real;
	end;

	clientes = record
		codigo : integer;
		cantlineas : integer;
	end;

procedure leerLinea (var l:lineas);
begin
	readln(l.numero);
	readln(l.cantminutos);
	readln(l.cantMB);
end;

procedure procesarCliente (c:clientes; var cantminutos, cantMB:real);
var
	i : integer;
	l : lineas;
begin
	cantminutos :=0;
	cantMB :=0;
	
	for i:=1 to c.cantlineas do begin
		leerLinea(l);
		cantminutos := cantminutos + l.cantminutos;
		cantMB := cantMB + l.cantMB;
	end;
end;

procedure leerCliente (var c:clientes);
begin
	readln(c.codigo);
	readln(c.cantlineas);
end;

var
	cliente : clientes;
	canttotalminutos, canttotalMB : real;
	i : integer;

BEGIN
	for i := 1 to 5 do begin
		leerCliente(cliente);
		procesarCliente(cliente,canttotalminutos,canttotalMB);
		writeln('Cantidad de minutos: ', canttotalminutos);
		writeln('Monto total: ', canttotalminutos * minuto);
		writeln('Cantidad de MBs: ', canttotalMB);
		writeln('Monto total: ', canttotalMB * MB);
	end;
END.
