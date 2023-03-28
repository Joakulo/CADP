program Pr0Ej5a;
var
  cant_caramelos, clientes, sobras, carxcli : integer;
begin
  writeln('Cuantos caramelos tiene el kiosquero?');
  read(cant_caramelos);
  writeln('Cuantos clientes hay?');
  read(clientes);
  carxcli := cant_caramelos DIV clientes;
  sobras := cant_caramelos MOD clientes;
  writeln('La cantidad de caramelos a cada cliente es ', carxcli, '. Y se queda con ', sobras);
end.
