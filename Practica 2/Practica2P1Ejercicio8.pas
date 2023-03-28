program anidamientos;
  procedure leer;
  var
     letra : char;
     function analizarLetra : boolean;
      begin
        if (letra >= 'a') and (letra <= 'z') then
          analizarletra := true
        else
          if (letra >= 'A') and (letra <= 'Z') then
            analizarletra := false;
     end; { fin de la funcion analizarletra }
      begin
        readln(letra);
        if (analizarletra) then
           writeln('Se trata de una minúscula')
        else
          writeln( 'Se trata de una mayúscula');
      end; { fin del procedure Leer}
var
   ok : boolean;
begin { programa principal }
    leer;
   ok := analizarLetra;
   if ok then
       writeln('Gracias, vuelva prontosss');
 end.
