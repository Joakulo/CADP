program Pr3Ej7;

Type
    centro = record
        nombre:string[15];
        uni:string[15];
        cantinv:integer;
        cantbec:integer;
    end;

procedure leerCentro(var c:centro);
begin
    writeln('Investigadores');
    readln(c.cantinv);
    if c.cantinv > 0 then begin
        writeln('Nombre');
        readln(c.nombre);
        writeln('Universidad');
        readln(c.uni);
        writeln('Becarios');
        readln(c.cantbec);
        writeln(' ');
    end;
end;

procedure maxInv (var max : integer; var maxUni : string; canti:integer; uniactual:string);
begin
    if canti > max then begin
        max := canti;
        maxUni := uniactual;
    end;
end;

procedure minDos (c:centro; var minB1, minB2 : integer; var minCentro1, minCentro2 : string; cantb : integer);
begin
    if cantb < minB1 then begin
        minB2 := minB1;
        minB1 := cantb;

        minCentro2 := minCentro1;
        minCentro1 := c.nombre;
    end else if cantb < minB2 then begin
        minB2 := cantb;

        minCentro2 := c.nombre;
    end;
end;

var
    c:centro;
    minB1, minB2, maxInvUni, cantcentros, cantInv, cantBec: integer;
    minCentro1, minCentro2, maxUni, uniactual: string[15];


BEGIN
    minB1 := 9999;
    minB2 := 9999;
    minCentro1 := 'a';
    minCentro2 := 'a';
    maxUni := 'a';
    maxInvUni := 0;


    leerCentro(c);
    while (c.cantinv > 0) do begin
        cantcentros := 0;
        cantBec := 0;
        cantInv := 0;
        uniactual := c.uni;
        while (c.uni = uniactual) do begin
            cantcentros := cantcentros + 1;
            cantInv := cantInv + c.cantinv;
            cantBec := cantBec + c.cantbec;
            leerCentro(c);
        end;
        writeln(cantcentros);
        maxInv(maxInvUni,maxUni,cantInv,uniactual);
        minDos(c,minB1,minB2,minCentro1,minCentro2,cantBec);
    end;
    writeln(maxUni);
    writeln(minCentro1,' ',minCentro2);
END.
