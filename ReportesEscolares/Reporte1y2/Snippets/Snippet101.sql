SELECT * FROM club;

SELECT idclub, nombre FROM club;

SELECT idclub, nombre FROM club
    ORDER BY nombre DESC;

SELECT COUNT(*) AS proveedor FROM proveedor;
SELECT COUNT(*) AS "numero de proveedor" FROM proveedor;


SELECT nombre AS socio FROM socio
    ORDER BY nombre;


SELECT nombre FROM servicio;

SELECT nombre, precioUnitario FROM producto
    WHERE precioUnitario BETWEEN 100 AND 3000
    ORDER BY precioUnitario;

SELECT * FROM Gerente
    ORDER BY Nombre;

