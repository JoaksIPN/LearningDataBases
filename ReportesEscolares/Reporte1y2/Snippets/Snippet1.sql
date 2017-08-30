CREATE TABLE TrabajoTerminal (
    NumeroDeTrabajoTerminal INT NOT NULL PRIMARY KEY,
    TituloDelTrabajo VARCHAR(80)
);

CREATE TABLE Departamento (
    IDDepartamento INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Presentacion (
    IDPresentacion INT NOT NULL PRIMARY KEY,
    Fecha date,
    CalificacionSeguimiento INT,
    CalificacionSinodales INT,
    Tipo VARCHAR(8)
);


CREATE TABLE Profesor (
    IDProfesor INT NOT NULL PRIMARY KEY,
    IDDepartamento INT,
    Nombre VARCHAR(10),
    ApellidoPaterno VARCHAR(10),
    ApellidoMaterno VARCHAR(10),
    Academia VARCHAR(20),
    Salario REAL,

    FOREIGN KEY(IDDepartamento)
        REFERENCES Departamento(IDDepartamento)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE DirigeTrabajoTerminal (
    NumeroTrabajo INT NOT NULL,
    IDProfesor INT NOT NULL,

    PRIMARY KEY(NumeroTrabajo, IDProfesor),

    FOREIGN KEY(NumeroTrabajo)
        REFERENCES TrabajoTerminal(NumeroDeTrabajoTerminal)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY(IDProfesor)
        REFERENCES Profesor(IDProfesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);