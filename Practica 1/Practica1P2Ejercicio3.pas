program Pr1P2Ej3;
type
	notas = 1..10;
var
	nombre : string[50];
	nota : notas;
	cantA, cant7 : integer;
BEGIN
	nombre := 'a';
	cantA := 0;
	cant7 := 0;
	while nombre <> 'Zidane Zinedine' do
		begin
			writeln('Ingrese su nombre');
			readln(nombre);
			writeln('Ingrese su nota');
			readln(nota);
			if nota > 7 then
				cantA := cantA + 1;
			if nota = 7 then
				cant7 := cant7 + 1;
		end;
	writeln('Alumnos aprobados: ', cantA);
	writeln('Alumnos con 7: ', cant7);
END.
