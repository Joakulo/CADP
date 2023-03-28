program Pr1Ej4;
var
  num1, num2 : real;
begin
  read(num1);
  num2:=num1 + num1;
  while (num1 <> num2) do
    begin
      read(num1);
    end;
end.
