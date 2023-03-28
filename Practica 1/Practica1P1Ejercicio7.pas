program Pr1Ej7;
var
codigo: integer;
porcientoactual,calculo,precioactual,nuevoprecio:real;
begin
  codigo := 1;
  while (codigo <> 32767) do
    begin
    writeln('Ingrese el codigo del producto.');
    readln (codigo);
    if (codigo <> 32767) then
    begin
      writeln('Ingrese el precio actual del producto.');
      readln (precioactual);
      writeln('Ingrese el nuevo precio del producto.');
      readln (nuevoprecio); 
      porcientoactual:= precioactual/100*10;
      calculo:= porcientoactual + precioactual;
      if (calculo >= nuevoprecio) then
        writeln ('El aumento del precio del producto ' ,codigo, ' no supera el 10%');
      if (calculo < nuevoprecio) then 
        writeln ('El aumento del precio del producto ' ,codigo, ' es superior al 10%');
    end;
  end;
  writeln('Ingrese el precio actual del producto.');
  readln (precioactual);
  writeln('Ingrese el nuevo precio del producto.');
  readln (nuevoprecio);
  porcientoactual:= precioactual/100*10;
  calculo := porcientoactual + precioactual;
  if (calculo >= nuevoprecio) then
    writeln ('El aumento del precio del producto ' ,codigo, ' no supera el 10%');
  if (calculo < nuevoprecio) then 
    writeln ('El aumento del precio del producto ' ,codigo, ' es superior al 10%');
end.
