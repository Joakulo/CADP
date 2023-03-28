program untitled;
var 
  legajo, alumnos, maspromedio, alumnosd : integer;
  promedio, alumnosdpor : real;
BEGIN
legajo := 0;
promedio := 0;
alumnos := 0;
maspromedio := 0;
alumnosd := 0;
  while (legajo <> -1) do
  begin
    readln(legajo);
    if (legajo <> -1) then
    begin
      readln(promedio);
      alumnos := alumnos + 1;
      if promedio > 6.5 then
        maspromedio := maspromedio + 1;
      if ((promedio > 8.5) and (legajo < 2500)) then
        alumnosd := alumnosd + 1;
    end;
  end;
  alumnosdpor := alumnosd * 100 / alumnos;
  writeln('Alumnos ingresados: ', alumnos);
  writeln('Alumnos con promeido mayor a 6,5: ', maspromedio);
  writeln('Alumnos destacados: ', alumnosdpor:1:2, '%');
END.
