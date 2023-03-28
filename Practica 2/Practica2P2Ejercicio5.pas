program Pr2P2Ej5;
function nums (num1, num2:integer) : boolean;
var
	ok : boolean;
begin
	ok := (num1 + num1 = num2)
	nums := ok
end;
var
	num1, num2, cantnums, cantdoble : integer;
BEGIN
	cantnums := 0;
	cantdoble := -1;
	repeat
		readln(num1);
		readln(num2);
		if (nums(num1,num2)) then
			cantdoble := cantdoble + 1;
		cantnums := cantnums + 1;
	until ((num1 = 0) and (num2 = 0));
	writeln('Cantidad de numeros: ',cantnums);
	writeln('Cantidad de dobles: ',cantdoble);
END.

