program Pr0Ej6;
const
  dolar = 189.32;
var
  monto, montopesos, total : real;
begin
  writeln('Ingrese el valor de la transaccion');
  readln(monto);
  montopesos := monto * dolar;
  writeln(montopesos:1:2);
  total := montopesos * 4 / 100 + montopesos;
  writeln ('El coste final de la transaccion en pesos es de ', total:1:2);
end.
