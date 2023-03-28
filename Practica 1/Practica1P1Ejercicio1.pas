program Pr1Ej1;
var
  num1, num2 : integer;
begin
  writeln('Ingrese el primer numero');
  readln(num1);
  writeln('Ingrese el segundo numero');
  readln(num2);
  if num1 > num2 then
      writeln('El numero ', num1, ' es mayor que ',num2);
  if num2 > num1 then
      writeln('El numero ', num2, ' es mayor que ',num1);
  if num1 = num2 then
      writeln('Los numeros leidos son iguales');
end.
