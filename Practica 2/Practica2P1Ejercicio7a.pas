program alcanceYFunciones;
var
  suma, cant : integer;
function calcularPromedio : real;
var
   prom : real;
begin
   if (cant = 0) then
     prom := -1
    else
      prom := suma / cant;
   calcularPromedio := prom
 end;
begin { programa principal }
   readln(suma);
   readln(cant);
   if (calcularPromedio <> -1) then
      writeln('El promedio es: ', calcularPromedio)
   else
      writeln( 'Dividir por cero no parece ser una buena idea');
end.
