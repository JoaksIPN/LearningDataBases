# ======================================================
# =============     PRACTICA 3     =====================
# ======================================================


#1: Conocer el no de tt, de aquellos tts que ha dirigido el Director
SELECT d.nott
    FROM dirige d, profesor p
    WHERE
        (d.idprof = p.idprof)       AND
        (p.nombre LIKE 'ANDr_s%')   AND
        (p.apPaterno LIKE 'Orti%')
    ORDER BY 1;



#2: Cuantos tts ha dirigido el tio flavio 
SELECT *
    FROM dirige d, profesor p
        WHERE
            (d.idprof = p.idprof)        AND
            (p.nombre LIKE "Flavio%")    AND
            (p.apPaterno LIKE "S_nchez%")
        ORDER BY 1;



#3: Cual es titulo de los tts de la consulta anterior
SELECT t.titulo
    FROM dirige d, profesor p, tt t
        WHERE
        (d.idprof = p.idprof)           AND
        (d.noTT = t.noTT)               AND
        (p.nombre LIKE 'Flavio%')       AND
        (p.apPaterno LIKE 'S_nchez%')
    ORDER BY 1;



#4: Que no. de tt tienen aquellos tts que se han presentado en el ao 2008
SELECT nott, fecha
    FROM presentacion    
        WHERE fecha BETWEEN "2008-01-01" AND "2008-12-31"
    ORDER BY 2, 1;



#5: Mostrar el tipo de tt que ha dirigido su profe de bases
SELECT t.nott, x.tipo
    FROM profesor p, presentacion x, tt t, dirige d
        WHERE 
            (x.noTT = t.noTT)               AND
            (t.noTT = d.noTT)               AND
            (d.idProf = p.idProf)           AND
            (p.nombre LIKE 'Euler%')        AND
            (p.apPaterno LIKE 'Hern_ndez%')
        ORDER BY 2, 1;



#6: Grado de Garcias
SELECT p.*, ge.descripcion 
    FROM profesor p, gradoestudios ge, gradoprof gp
        WHERE 
            (p.idProf = gp.idProf)      AND
            (gp.idGrado = ge.idGrado)   AND
            (p.apPaterno LIKE "Garc_a%" OR p.apMaterno LIKE "%Garc_a%") 
        ORDER BY p.apPaterno;


#7: Profesores de la UNAM
SELECT p.*
    FROM profesor p, gradoprof gp
        WHERE (p.idProf = gp.idProf) AND (gp.institucion = 'UNAM')
        ORDER BY p.apPaterno;



#8: Mostrar el no. de tt y el tipo, ademas del dictamen de aquellos tts donde la
#   Dra. Lorena Chavarria ha sido sinodal.
SELECT p.nott, p.tipo 
    FROM presentacion p, tt t, sinodalia s, profesor f 
        WHERE
            (t.noTT = s.noTT)           AND
            (p.noTT = t.noTT)           AND
            f.nombre LIKE "Lore%"       AND
            f.apPaterno LIKE "Chava%"   AND
            (s.s1 = f.idprof OR s.s2 = f.idprof OR s.s3 = f.idprof) 
        ORDER BY 2, 1;



#9: Mostrar el no de tt y la fecha de presentacion de aquellos tts que incluyen 
#   la palabra Redes neuronales.
SELECT t.noTT, p.fecha, t.titulo
    FROM tt t, presentacion p
    WHERE p.noTT = t.noTT AND t.titulo LIKE '%redes%'
    ORDER BY 2, 1;



#10: Mostrar el no de tt y el nombre de los directores que han dirigido tt remediales.
SELECT t.nott, p.tipo, f.nombre, f.apPaterno, f.apmaterno 
    FROM presentacion p, tt t, dirige d, profesor f 
    WHERE
        (p.nott = t.nott)     AND
        (t.nott = d.nott)     AND
        (d.idprof = f.idprof) AND 
        (p.tipo = "TT R") 
    ORDER BY 4;



#11: Mostrar la cedula profesional y la institucion de aquellos profesores que
#    tienen grado de maestria
SELECT p.nombre, p.apPaterno, p.apMaterno, gp.cedula, gp.institucion
    FROM profesor p, gradoprof gp, gradoestudios ge
    WHERE
        (p.idProf = gp.idProf)              AND
        (gp.idGrado = ge.idGrado)           AND
        (ge.descripcion LIKE 'MAESTR_A')
    ORDER BY 2;



#12: Mostrar el no de tt, la calificacion de los sinodales, donde el revisor ha 
#    sido la Dra. Fabiola Ocampo
SELECT p.nott, p.califSinodales 
    FROM presentacion p, tt t, sinodalia s, profesor f 
        WHERE
        (p.nott = t.nott)               AND
        (t.nott = s.nott)               AND
        (s.revisor = f.idprof)          AND
        (f.nombre LIKE "Fabio%")        AND
        (f.apPaterno LIKE "Ocamp%");



#13: Mostrar los sinodales que han tenido los siguientes tts: 2000-0209, 06-1-0174
SELECT p.*, s.nott 
    FROM profesor p, sinodalia s 
    WHERE
        (s.s1 = p.idprof OR s.s2 = p.idprof OR s.s3 = p.idprof) 
        AND s.nott IN ("2000-0209", "06-1-0174");



#14: Quien fue el revisor del tt que ha dirigido Idalia Maldonado?
SELECT d.nott, p.* 
    FROM dirige d, profesor p, sinodalia s 
    WHERE d.idprof = 
        (SELECT idprof FROM profesor 
            WHERE nombre LIKE "Idali%" AND apPaterno LIKE "Maldo%")
        AND p.idprof = s.revisor
        AND p.nombre LIKE "Idali%" 
        AND p.apPaterno LIKE "Maldon%";


