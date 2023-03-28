program Pr0Ej3;
var
  num1, num2, n : real;
begin
  writeln('Ingrese el primer numero');
  readln(num1);
  writeln('Ingrese el segundo numero');
  readln(num2);
  n := num1 / num2;
  writeln('El resultado de dividir ', num1:1:2, ' por ', num2:1:2, ' es ', n:1:2);
end.
