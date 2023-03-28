program untitled;
var
  char1, char2, char3 : char;
BEGIN
  writeln('Ingrese el primer caracter');
  readln(char1);
  writeln('Ingrese el segundo caracter');
  readln(char2);
  writeln('Ingrese el tercer caracter');
  readln(char3);
  
	if (((char1 = 'a') or (char1 = 'e') or (char1 = 'i') or (char1 = 'o') or (char1 = 'u')) and ((char2 = 'a') or (char2 = 'e') or (char2 = 'i') or (char2 = 'o') or (char2 = 'u')) and ((char3 = 'a') or (char3 = 'e') or (char3 = 'i') or (char3 = 'o') or (char3 = 'u'))) then
		writeln('Los tres caracteres son vocales');

	if (not((char1 = 'a') or (char1 = 'e') or (char1 = 'i') or (char1 = 'o') or (char1 = 'u')) or not((char2 = 'a') or (char2 = 'e') or (char2 = 'i') or (char2 = 'o') or (char2 = 'u')) or not((char3 = 'a') or (char3 = 'e') or (char3 = 'i') or (char3 = 'o') or (char3 = 'u'))) then
		writeln('Al menos un caracter no es vocal');
END.
