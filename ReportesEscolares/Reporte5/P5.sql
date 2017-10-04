# ======================================================
# =============     PRACTICA 5     =====================
# ======================================================


#1: Nombre de la Sucursal y el estado donde esta
CREATE VIEW V1 AS
    SELECT nombre AS Sucursal, estado
        FROM tienda
        ORDER BY 2; 



#2: Nombre del Producto y su Categoria
CREATE VIEW V2 AS
    SELECT p.nombre AS Producto, c.nombre as Categoria
        FROM producto p, categoria c, subcategoria s
            WHERE
                p.idsubcategoria = s.idsubcategoria AND
                s.idsubcategoria = c.idcategoria
        ORDER BY 2, 1; 



#3: Nombre de la Categoria y Subcategoria
CREATE VIEW V3 AS
    SELECT c.nombre AS Categoria, s.nombre AS SubCategoria
        FROM categoria c, subcategoria s 
            WHERE
                c.idcategoria = s.idcategoria
        ORDER BY 1, 2; 



#4: Nombre del Cliente y Sucursal donde fue dado de alta
CREATE VIEW V4 AS
    SELECT
        c.nombre    AS Cliente, 
        c.apPaterno AS Apellido1,
        c.apMaterno AS Apellido2,
        t.nombre    AS Sucursal
        FROM cliente c, pago p, tienda t
            WHERE
                c.idcliente = p.idcliente AND
                p.idtienda = t.idtienda
        ORDER BY 4, 2; 



#5: Nombre del Producto y su Subcategoria
CREATE VIEW V5 AS
    SELECT
        p.nombre    AS Producto, 
        s.nombre    AS Subcategoria
        FROM producto p, subcategoria s
            WHERE
                p.idsubcategoria = s.idsubcategoria
        ORDER BY 2, 1; 



#6: Nombre del Cliente y monto del Credito
CREATE VIEW V6 AS
    SELECT
        cliente.nombre    AS Cliente, 
        cliente.apPaterno AS Apellido1,
        cliente.apMaterno AS Apellido2, 
        credito.monto     AS Monto
        FROM credito, cliente, pago p
            WHERE
                cliente.idcliente = p.idcliente AND
                p.idcredito = credito.idcredito
        ORDER BY 2; 

#7: Nombre del Cliente y fechas de pago
CREATE VIEW V7 AS
    SELECT
        cliente.nombre    AS Cliente, 
        cliente.apPaterno AS Apellido1,
        cliente.apMaterno AS Apellido2, 
        p.fechaPago       AS FechaPago
        FROM cliente, pago p
            WHERE
                cliente.idcliente = p.idcliente
        ORDER BY 4, 2; 

#8: Nombre del Producto y Precio Unitario
CREATE VIEW V8 AS
    SELECT
        p.nombre         AS Nombre, 
        p.precioUnitario AS PrecioUnitario
        FROM producto p
        ORDER BY 2, 1; 

#9: Nombre del Producto y su Marca
CREATE VIEW V9 AS
    SELECT
        p.nombre    AS Nombre, 
        p.marca     AS Marca
        FROM producto p
        ORDER BY 2, 1; 

#10: Nombre del Cliente, Email y su género
CREATE VIEW V10 AS
    SELECT
        c.nombre    AS Cliente, 
        c.apPaterno AS Apellido1,
        c.apMaterno AS Apellido2, 
        c.email     AS Email, 
        c.sexo      AS Sexo 
        FROM cliente c
        ORDER BY 2; 

#11: Nombre del Cliente y su Salario
CREATE VIEW V11 AS
    SELECT
        c.nombre    AS Cliente, 
        c.apPaterno AS Apellido1,
        c.apMaterno AS Apellido2, 
        c.salario   AS Salario 
        FROM cliente c
        ORDER BY 2; 




# ======================================================
# =============     PRACTICA 5: V2   ===================
# ======================================================


#1: Clientes en las sucursales de Colima
SELECT
    V4.*, V1.estado
    FROM V1, V4
    WHERE 
        V1.Sucursal = V4.Sucursal AND
        V1.estado like "Colima%"
    ORDER BY V1.Sucursal;
    


#2: Sucursales donde hay mujeres
SELECT
    V4.*, V10.Sexo
    FROM V4, V10
    WHERE 
        V10.sexo = "F"                  AND
        V4.Apellido1 = V10.Apellido1    AND
        V4.Apellido2 = V10.Apellido2    AND
        V4.Cliente = V10.Cliente        
    ORDER BY V4.Apellido1;

#3: Clientes que ganan entre 6k y 6.5k, incluir sucursales
SELECT
    V11.*, V4.Sucursal
    FROM V4, V11
    WHERE 
        V11.Salario BETWEEN 6000 AND 6500   AND
        V4.Apellido1 = V11.Apellido1        AND
        V4.Apellido2 = V11.Apellido2        AND
        V4.Cliente = V11.Cliente        
    ORDER BY V11.Salario, V11.Apellido1;

#4: Productos de Deporte
SELECT
    V2.*
    FROM V2
    WHERE 
        V2.Categoria like "Depor%"
    ORDER BY V2.producto;

#5: Clientes que pagaron en 12 Marzo de 2010, incluir de la Sucursal
SELECT
    V7.*, V4.Sucursal
    FROM V4, V7
    WHERE 
        V4.Apellido1 = V7.Apellido1        AND
        V4.Apellido2 = V7.Apellido2        AND
        V4.Cliente   = V7.Cliente          AND
        V7.FechaPago = "2010-03-12"
    ORDER BY V7.Apellido1;

