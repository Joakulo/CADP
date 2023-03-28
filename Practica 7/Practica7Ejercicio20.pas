program 20
  type
    numero: 1..10
    libro = record
		titulo : string
		autorp: string
		añoe: integer
		tema: numero
    end
    vector: array [1..1500] of libro
      
    vectorContadorii: array [numero] of integer
      
    socio = record
		numsocio: integer
        correo: string
        prestamos: lista2
        cantp:integer	
    end
    prestamo = record
        codigodelibro: integer
        fecha: string
    end
	
    lista1 = ^nodo1
    nodo1 = record
        dato: socio
        siguiente: lista1
    end
         
    lista2 = ^nodo2
    nodo2 = record
		dato: prestamo
        siguiente: lista2
	end 
    
    socio2=record
		num:integer
		cantP:integer
    end
    
    listai=^nodoi
    nodoi=record
		dato:socio2
		sig:listai
	end
    
        
procedure inicializarvector (var v: vector) // se dispone

procedure leerlibros (var l: libro) // se dispone

procedure cargarvector (var v: vector; var l:libro) // se dispone



procedure inicializarvector2 (var v2: vector2)
var
  i: integer
begin
  for i:= 1 to 10 do begin
    v2[i]:= 0 
  end
end
 
 
 
procedure leersocio (var s:socio) 
begin
	read (s.numsocio)
	if (s.numsocio <> -1) then begin
		read (s.correo)
	end
end



procedure leerprestamo (var P: prestamo)
begin
	read (p.codigodelibro)
	if (p.codigodelibro <> -1) then 
		read (p.fecha)
end



procedure AgregarAdelanteS (var l:lista1; s:socio)
var
	aux:lista1
begin
	new (aux)
	aux^.dato:= s
	aux^.siguiente := l
	l:= aux
end



procedure AgregarAdelanteP (var l:lista2; p:prestamo)
var
	aux:lista2
begin
	new (aux)
	aux^.dato:= p
	aux^.siguiente:= l
	l:= aux
end



procedure AgregarAdelantei (var L:listai; s:socio)	//...
var
	aux:listai
begin
	new (aux)
	aux^.dato:= s
	aux^.siguiente := L
	L:= aux
end



procedure cargarListaSocios (var l1:lista1)		//...
var
	s: socio
	p : prestamo
begin
	leersocio(s)
	while (s.numsocio <> -1) do begin
		leerprestamo(p)
		s.cantp:=0
		while (p.codigodelibro <> -1) do begin
			s.cantp:= s.cantp + 1
			AgregarAdelanteP(s.prestamos,p)
			leerprestamo(p)
		end
		AgregarAdelanteS(l1,s)
		leersocio(s)
	end
end



procedure i (var Li:listai; S:socio)		//...
var
begin
	if (S.cantp > 20) then begin
		AgregarAdelantei(Li,S)
	end
end



procedure ii (v: vector; var v2: vector2)
var
begin
  v2[v[l.tema]]:= v2[v[l.tema]] + 1   //preguntar si esta bien
end



procedure iii (var cantptotal: integer)
var
begin
  cantptotal:= cantptotal + 1
end



procedure a (var L:lista1; var Li:listai; var V:vectorContadorii; var cantP:integer; vL:vector)
var
	aux:lista1
begin
	cargarListaSocios(L)
	aux:=L
	cantP:=0
	while (L <> nil) do begin
		i(Li,L^.dato)
		while (L^.dato.prestamos <> nil) do begin
			ii(v,v2)
			V[  vL[  L^.dato.prestamos^.dato.codigodelibro  ]  .tema  ] := V[  vL[  L^.dato.prestamos^.dato.codigodelibro  ]  .tema  ] + 1		//ii
			cantP:=cantP+1		//iii
			L^.dato.prestamos := L^.dato.prestamos^.sig
		end
		L:=L^.sig
    end
	writeln (cantP)
	L:=aux
end



function b (v2: vectorContadorii): integer
var
	i: integer
	max: integer
begin
	max:= -9999
	for i:= 1 to 10 do
		if (v2[i] > max) then
			max:= v2[i]
	b:= max
end



function parimpar (numero: integer): boolean
var
	cantp: integer
	canti: integer
begin
	cantp:= 0
	canti:= 0
	while (numero <> 0) do begin
		if (numero mod 2 = 0) then 
			cantp:= cantp + 1
		else
			canti:= canti + 1
		numero:= numero div 10
	end
	parimpar := (cantp = canti)
end



procedure c (L:lista1)
var
	valor:integer
begin
	readln(valor)
	if ((L^.dato.cantp = valor) and (parimpar(L^.dato.numsocio))  then
		writeln(L^.dato.numsocio)
end



var
	VectorLibros: vector					//se dispone
	LS: lista1
	Listai: listai
	VectorDeTemas: vectorContadorii
	CantidadDePrestamos: integer
begin
	cargarVector(VectorLibros)			//se dispone
	a(LS,Listai,VectorDeTemas,CantidadDePrestamos,VectorLibros)
	b(VectorDeTemas)
	c(LS,valor)
end
