program Pr1Ej2;
var
  num1 : real;
begin
  writeln('Ingrese un numero');
  readln(num1);
  if num1 >= 0 then
    writeln('El valor absoluto de ', num1:1:2, ' es ', num1:1:2)
  else
    writeln('El valor absoluto de ', num1:1:2, ' es ', -num1:1:2);
end.
