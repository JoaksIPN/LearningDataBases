
# ======================================================
# =============     PRACTICA 3     =====================
# ======================================================


#1: Nombre de asociado y sucursal donde esta asignado
SELECT a.nombre, h.nombre
	FROM asociado a, homedepot h
		WHERE a.homedepot_idhd = h.idhd
			ORDER BY 2, 1; 



#2: Nombre de clubes existentes en DF
SELECT nombre
	FROM homedepot
		WHERE estado="DF"
			ORDER BY nombre;



#3: Nombre de clubes existentes en NuevoLeon
SELECT nombre
	FROM homedepot
		WHERE estado LIKE "Nuev%"
			ORDER BY nombre;



#4: Nombre de clubes existentes en Tamaulipas
SELECT nombre
	FROM homedepot
		WHERE estado LIKE "Tamau%"
			ORDER BY nombre;



#5: Nombre del socio y la tarjeta asignada
SELECT s.nombre, t.nombre
	FROM socio s, tarjeta t
		WHERE s.idsocio = t.socio_idsocio
			ORDER BY 2, 1;



#6: Nombre del socio y la tarjeta asignada y que se apellida Hernandez
SELECT s.nombre, t.nombre
	FROM socio s, tarjeta t
		WHERE s.idsocio = t.socio_idsocio AND s.nombre LIKE "Hern_nd%"
		ORDER BY 2, 1;



#7: Nombre de los departamentos de una sucursal determinada
SELECT h.nombre, d.nombre
	FROM homedepot h, depto d, hddepto x
		WHERE h.idhd=x.homedepot_idhd AND x.depto_iddepto = d.iddepto
		ORDER BY 1;



#8: Mostrar el credito que tienen los socios que se apellidan como Garcia
SELECT nombre, credito
	FROM socio
		WHERE nombre LIKE "Garc%" OR nombre LIKE "% Garc%"
		ORDER BY 2;



#9: Cuantos socios tienen la tarjeta DECORE
SELECT COUNT(*)
	FROM socio s, tarjeta t
		WHERE s.idsocio = T.socio_idsocio AND t.nombre like "DECOR%";



#10: Como se llaman los socios de la consulta anterior
SELECT s.nombre, t.nombre
	FROM socio s, tarjeta t
		WHERE s.idsocio = T.socio_idsocio AND t.nombre like "DECOR%";



#11: Cuantos asociados tienen como apellido paterno Perez
SELECT COUNT(*)
	FROM asociado
		WHERE nombre LIKE "Pere%";


#12: Como se llaman los asociados de la consulta anterior 
SELECT nombre
	FROM asociado
		WHERE nombre LIKE "Pere%";



#13: Proyectar las sucursales donde estan asignados los asociados
#    donde proyectar es ordenar la salida y eliminar campos
SELECT homedepot_idhd
	FROM asociado
		GROUP BY homedepot_idhd;



#14: Mostrar el nombre de las siguientes sucursales y sus asociados
#    con CP 78045, 89360, 25279.
SELECT h.nombre, a.nombre
	FROM homedepot h, asociado a
		WHERE h.idhd = a.homedepot_idhd 
			AND (
				h.direccion LIKE "%78045%"
				OR h.direccion LIKE "%25279%"
				OR h.direccion LIKE "%89360%")
		ORDER BY 1, 2;



#15: Como se llaman los asociados que tienen Metepec como sucursal
SELECT a.nombre
	FROM homedepot h, asociado a
		WHERE h.idhd = a.homedepot_idhd 
			AND h.nombre LIKE "Metepec%"
		ORDER BY 1;



#16: Que telefeno tienen los socios que tiene la tarjeta Pagos Fijos
#    y mostrar la sucursal donde de se encuentran dados de alta.
SELECT s.nombre, s.tel
	FROM socio s, tarjeta t, hdsocio x, homedepot h
		WHERE
			(s.idSocio = t.socio_idSocio)	AND
			(s.idSocio = x.socio_idSocio)   AND
			(X.homedepot_idhd = H.idhd) 	AND
			(t.nombre = "PAGOS FIJOS")
		ORDER BY 1;



#17: Mostrar los departamentos que tiene la sucursal Tijuana
SELECT h.nombre, d.nombre
	FROM homedepot h, depto d, hddepto x
		WHERE 
			(h.idhd = x.homedepot_idhd)   AND
			(x.depto_iddepto = d.iddepto) AND
			(h.nombre LIKE "Tijuan%")
			ORDER BY 2;



#18: Como se llaman las sucursales que tienen el departamento de pisos
SELECT h.nombre, h.estado
	FROM homedepot h, depto d, hddepto x
		WHERE 
			(h.idhd = x.homedepot_idhd)    AND
			(x.depto_iddepto = d.iddepto)  AND
			(d.nombre LIKE "Pis%")
			ORDER BY 1;


