# ======================================================
# =============     PRACTICA 6     =====================
# ======================================================

#1: Mostrar nombre y numero de tt donde sinodal es Fabiola Ocampos
CREATE VIEW V1 AS
    SELECT t.*
        FROM tt t, sinodalia s, profesor p
        WHERE
            T.nott = s.nott                                             AND
            (s.s1 = p.idprof OR s.s2 = p.idprof OR s.s3 = p.idprof)     AND
            p.nombre like "Fabiol%"                                     AND
            P.apPaterno like "Ocamp%"
        ORDER BY t.nott; 

SELECT * FROM V1;



#2: Mostrar las calificaciones de los tt remediales
CREATE VIEW V2 AS
    SELECT nott, califRevisor, califSinodales
        FROM presentacion
        WHERE
            presentacion.tipo like "TT R"
        ORDER BY nott; 

SELECT * FROM V2;



#3: Mostrar la fecha de la presentacion y el tipo de tt que han sido 
#dirigidos por Arturo Garfias
CREATE VIEW V3 AS
    SELECT p.nott, p.fecha, p.tipo
        FROM presentacion p, tt t, dirige d, profesor
        WHERE
            p.nott = t.nott                     AND
            t.nott = d.nott                     AND
            d.idProf = profesor.idProf          AND
            profesor.nombre like "F% Artur%"    AND
            profesor.apPaterno like "S_nche%"   
        ORDER BY p.nott; 

SELECT * FROM V3;



#4: Nombre de los profesores que tienen doctorado
CREATE VIEW V4 AS
    SELECT p.*
        FROM profesor p, gradoProf g , gradoEstudios ge
        WHERE
            p.idProf = g.idProf                 AND
            ge.idGrado = g.idGrado              AND 
            ge.descripcion like "Doc%"  
        ORDER BY p.nombre; 

SELECT * FROM V4;



#5: Mostar tt del 2007
CREATE VIEW V5 AS
    SELECT p.fecha, t.*
        FROM presentacion p, tt t
        WHERE
            t.nott = p.nott                                 AND
            p.fecha BETWEEN "2007-01-01" AND "2007-12-31"
        ORDER BY p.fecha; 

SELECT * FROM V5; 



#6: Mostar tt donde ha sido sinodal Martha Rosa
CREATE VIEW V6 AS
    SELECT t.*
        FROM tt t, sinodalia s, profesor p
        WHERE
            T.nott = s.nott                                             AND
            (s.s1 = p.idprof OR s.s2 = p.idprof OR s.s3 = p.idprof)     AND
            p.nombre like "Marth% Ros%"                                 AND
            P.apPaterno like "Corder%"
        ORDER BY t.nott; 

SELECT * FROM V6;


#7: Mostar tt que se presentaron el 2008
CREATE VIEW V7 AS
    SELECT p.fecha, t.*
        FROM presentacion p, tt t
        WHERE
            t.nott = p.nott                                 AND
            p.fecha BETWEEN "2008-01-01" AND "2008-12-31"
        ORDER BY p.fecha; 

SELECT * FROM V7; 



#8: Mostar dictamen de los tts que han sido revisados por Idalia
CREATE VIEW V8 AS
    SELECT pre.nott, pre.dictamen
        FROM presentacion pre, tt t, sinodalia s, profesor p
        WHERE
            pre.nott = t.nott                                           AND
            t.nott = s.nott                                             AND
            s.revisor = p.idProf                                        AND
            p.nombre like "Ulises%"                                     AND
            P.apPaterno like "V_le%"
        ORDER BY t.nott; 

SELECT * FROM V8;


# ======================================================
# =============     PROCEDURE      =====================
# ======================================================
#9: Conocer el numero de Registros sobre Euler dirigio tt
#9.1: Conocer el numero de tt y la fecha de presentación de 9
DELIMITER &
CREATE PROCEDURE P1()
BEGIN
    SELECT COUNT(*) 
        FROM dirige, profesor
        WHERE
            dirige.idProf = profesor.idProf     AND
            profesor.nombre like "Eule%"        AND
            profesor.apPaterno like "Hern_ndez%";

    SELECT s.nott, s.fecha
        FROM dirige, profesor, presentacion s, tt t
        WHERE
            s.nott = t.nott                     AND
            t.nott = dirige.nott                AND
            dirige.idProf = profesor.idProf     AND
            profesor.nombre like "Eule%"        AND
            profesor.apPaterno like "Hern_ndez%"; 
END &

DELIMITER ;
CALL P1;



#11: Conocer tt que tienen en su título redes
#11.1: Conocer el nombre de sus directores de la anterior
DELIMITER &
CREATE PROCEDURE P3()
BEGIN
    SELECT * 
        FROM tt
        WHERE
            titulo like "%redes%"
        ORDER BY titulo;

    SELECT tt.nott, p.* 
        FROM tt, profesor p, dirige d
        WHERE
            tt.nott = d.nott            AND
            d.idProf = p.idProf         AND
            tt.titulo like "%redes%"
        ORDER BY p.apPaterno;
END &

DELIMITER ;
CALL P3;