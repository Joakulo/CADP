program Pr0Ej4;
var
  diametro, area, radio, perimetro : real;
begin
  writeln('Ingrese el diametro de circulo.');
  readln(diametro);
  radio := diametro / 2;
  area := pi * radio * radio;
  perimetro := diametro * pi;
  writeln('El radio del circulo es:', radio:1:2);
  writeln('El area del circulo es:', area:1:2);
  writeln('El perimetro del circulo es:', perimetro:1:2);
end.
