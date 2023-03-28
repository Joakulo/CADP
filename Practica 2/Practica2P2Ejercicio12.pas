program untitled;

function esVocal (c : char):boolean;
begin
	esVocal := (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u') or (c = 'A') or (c = 'E') or (c = 'I') or (c = 'O') or (c = 'U');
end;

procedure cumpleA (var cumple:boolean; var long:integer);
var
	c : char;
begin
	writeln('Ingrese la secuencia A');
	read(c);
	while ((c <> '$') and (cumple)) do begin
		if (not esVocal(c)) then
			cumple := false
		else begin
			long := long + 1
			read(c);
		end;
	end;
end;



function esVocal (c : char):boolean;
begin
	NoesVocal := ((c = 'b') or (c = 'c') or (c = 'd') or (c = 'f') or (c = 'g') or (c = 'h') or (c = 'j') or (c = 'k') or (c = 'l') or (c = 'm') or (c = 'n') or (c = 'ñ') or (c = 'p') or (c = 'q') or (c = 'r') or (c = 's') or (c = 't') or (c = 'v') or (c = 'w') or (c = 'x') or (c = 'y') or (c = 'z') or (c = 'B') or (c = 'C') or (c = 'D') or (c = 'F') or (c = 'G') or (c = 'H') or (c = 'J') or (c = 'K') or (c = 'L') or (c = 'M') or (c = 'N') or (c = 'Ñ') or (c = 'P') or (c = 'Q') or (c = 'R') or (c = 'S') or (c = 'T') or (c = 'V') or (c = 'W') or (c = 'X') or (c = 'Y') or (c = 'Z'));
end;

procedure cumpleB (var cumple:boolean; var long:integer);
var
	c : char;
begin
	writeln('Ingrese la secuencia B');
	readln(c);
	while ((c <> '#') and (cumple)) do begin
		if (not noesvocal(c)) then
			cumple := false;
		else begin
			long := long + 1;
			readln(c);
		end;
	end;
end;



var
	long : integer;
	cumple: boolean;
BEGIN
	cumple := true;
	long := 0;
	cumpleA (cumple,long);
	if (cumple) then begin
		cumpleB (cumple, long);
		if (cumple) then
			writeln('Se cumple la secuencia')
		else
			writeln('No cumple con B')
		end
    else
		writeln('No cumple con A');
END.

