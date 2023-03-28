program Pr4P1Ej7;

const
	dimF = 10;

type
	vector = array[0..9] of integer;

procedure inicializarVector(var v:vector);
var 
	i:integer;
begin
	for i:=1 to dimF do
		v[i-1] := 0;
end;

procedure cantOcurrencias(var v:vector; num:integer);
var
	dig : integer;
begin
	while (num <> 0) do begin
		dig := num MOD 10;
		v[dig] := v[dig] + 1;
		num := num DIV 10;
	end;
end;

procedure digMasLeido(v:vector; var max, maxDig:integer);
var
	i : integer;
begin
	for i:=1 to dimF do begin
		if v[i-1] > max then begin
			max := v[i-1];
			maxDig := i-1;
		end;
	end;
end;

procedure sinOcurrencias(v:vector; var v2:vector; var dimL:integer);
var
	i : integer;
begin
	for i := 1 to dimF do begin
		if (v[i-1] = 0) then begin
			dimL := dimL + 1;
			v2[dimL] := i-1;
		end;
	end;
end;

var
	v, v2 : vector;
	num, max, maxDig, dimL2, i : integer;

BEGIN
	inicializarVector(v);
	inicializarVector(v2);
	max := -1;
	maxDig := -1;
	dimL2 := 0;
	
	readln(num);
	While (num <> -1) do begin
		cantOcurrencias(v,num);
		readln(num);
	end;
	digMasLeido(v,max,maxDig);
	sinOcurrencias(v,v2,dimL2);
	
	for i := 1 to dimF do
		writeln('Numero ', i-1, ' : ',v[i-1]);
	writeln('El digito mas leido fue el ',maxDig);
	write('Los digitos que no tuvieron ocurrencias son ');
	for i := 1 to dimL2 do	
		write(v2[i]);
END.

