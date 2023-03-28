program Pr1Ej3;
var
  num1, num2, num3 : integer;
begin
  writeln('Ingrese el primer numero');
  readln(num1);
  writeln('Ingrese el segundo numero');
  readln(num2);
  writeln('Ingrese el tercer numero');
  readln(num3);
  if (num1 > num2) and (num1 > num3) then begin
    if num2 > num3 then
	  writeln(num1,' ',num2,' ',num3)
	else
	  writeln(num1,' ',num3,' ',num2);
	end
	else
      if (num2 > num1) and (num2 > num3) then begin
        if num1 > num3 then
	      writeln(num2,' ',num1,' ',num3)
     	else
	      writeln(num2,' ',num3,' ',num1);
	  end
	  else
	    if num2>num1 then
	      writeln(num3,' ',num2,' ',num1)
	    else
	      writeln(num3,' ',num1,' ',num2)
end.
