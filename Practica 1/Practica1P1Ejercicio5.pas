program Pr1Ej5;
var
  num1, num2, cont : real;
begin
  read(num1);
  num2:=num1 + num1;
  cont:=0;
  while ((num1 <> num2) and (cont < 10)) do
    begin
      read(num1);
      cont := cont + 1;
    end;
  if (num1 <> num2) then
    writeln('No se ha ingresado el doble de X');
end.
