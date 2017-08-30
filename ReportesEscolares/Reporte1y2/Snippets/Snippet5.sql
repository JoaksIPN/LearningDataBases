CREATE TABLE Empleado (
    IDEmpleado 	INT NOT NULL 	PRIMARY KEY,
    Nombre 		VARCHAR(20),
    Direccion 	VARCHAR(300),
    Telefono 	int,
    Genero 		VARCHAR(10)
);



CREATE TABLE Cinemex (
    IDCine	 	INT NOT NULL 	PRIMARY KEY,
    Nombre 		VARCHAR(30),
    Direccion 	VARCHAR(300),
    Telefono 	int,
    email 		VARCHAR(30)
);


CREATE TABLE EmpleadoCinemex (
    IDEmpleado INT NOT NULL,
    IDCine INT NOT NULL,

    PRIMARY KEY (IDEmpleado, IDCine),

    FOREIGN KEY (IDCine) 
    	REFERENCES Cinemex(IDCine)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE,
    FOREIGN KEY (IDEmpleado)
    	REFERENCES Empleado(IDEmpleado)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE
);
