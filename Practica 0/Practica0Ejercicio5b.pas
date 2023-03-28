program Pr0Ej5b;
const
  precio = 1.60;
var
  cant_caramelos, clientes, sobras, carxcli, x : integer;
begin
  writeln('Cuantos caramelos tiene el kiosquero?');
  read(cant_caramelos);
  writeln('Cuantos clientes hay?');
  read(clientes);
  carxcli := cant_caramelos DIV clientes;
  sobras := cant_caramelos MOD clientes;
  x := cant_caramelos - sobras;
  writeln('La cantidad de caramelos a cada cliente es ', carxcli, '. Y se queda con ', sobras, '. Debe cobrar ', x*precio:1:2);
end.
