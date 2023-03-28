program eje13;

function distintoDePeso(c: char): boolean;
begin
	distintoDePeso := c <> '$';
end;

procedure cumpleA(var cumple: boolean; var long: integer);
var 
	c: char;
begin
	read(c);
	while (c <> '%') and (cumple) do begin
		if( not distintoDePeso(c)) then
			cumple := false
		else
			long := long + 1;
			read(c);
	end;
end;

function esArroba(c: char): boolean;
begin
	esArroba := (c = '@');
end;

procedure cumpleB(var cumple: boolean; long: integer);
var
	c: char;
	longB : integer;
	cant : integer;
begin
	longB := 0; 
	cant := 0;
	read(c);
	while (c <> '*') and (cumple) do begin
		if(esArroba(c)) then
			cant := cant + 1;
			
		if (cant > 3) or (longB > long) then
			cumple := false
		else
			longB := longB + 1;
			read(c);
	end;
end;

var
	cumple : boolean;
	long : integer;
begin
	cumple := true;
	long := 0;
	cumpleA(cumple, long);
	if (cumple) then begin
		cumpleB(cumple, long);
		if (cumple) then
			writeln('Se cumple la secuencia')
		else
			writeln('No cumple con B')
		end
	else
		writeln('No cumple con A');
end.

{
* pp
* 	parteA();
* 		// leer car
* 		// verificar cindiciones
* 		// si es % termina parte A
* 	parteB();
* 		// leer car
* 		// verificar cindiciones
* 		// si es * termina parte B
* }
