program modulos;

procedure ordenarVector (var v:vector; dimL:integer);
var
	i,j : integer;
	p,aux : integer;
begin
	for i:=1 to dimL - 1 do begin
		p:= i
		for j:=i+1 to dimL do
			if (v[j] < v[p]) then
				p:=j;
		aux := v[p];
		v[p] := v[i];
		v[i] := aux;
	end;
end;



procedure agregarAdelante (var L:lista; num:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato := num;
	nue^.sig := L;
	L := nue;
end;



procedure agregarAtras (var L,ult:lista; num:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato := num;
	nue^.sig := nil;
	if (L = nil) then
		L := nue
	else
		ult^.sig := nue;
	ult := nue;
end;



procedure insertarOrdenado (var L:lista; num:integer);
var
	nue, act, ant : lista;
begin
	new(nue);
	nue^.dato := num;
	act := L;
	ant := L;
	while ((act <> nil) and (act^.dato > num)) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act = ant) then
		L := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;



procedure Eliminar (var L:lista; num : integer);
var
	act, ant : lista;
begin
	act := L;
	while (act <> nil) do begin
		if (act^.dato <> num) then begin
			ant := act;
			act := act^.sig;
		end else
			if (act <> nil) then begin
				 if (act = L) then begin
					L := L^.sig;
					ant := L;
				end else
					ant^.sig := act^.sig;
				dispose(act);
				act := ant;
			end;
	end;
end;
