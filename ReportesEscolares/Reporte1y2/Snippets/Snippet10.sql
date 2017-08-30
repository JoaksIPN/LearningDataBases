CREATE TABLE Cartelera (
    IDCartelera     INT NOT NULL PRIMARY KEY,
    FechaInicio     DATE,
    FechaFin        DATE,
    Clasificacion   VARCHAR(5),
    IDCine          INT,
    NombreCinemex   VARCHAR(30),
    FOREIGN KEY(IDCine, NombreCinemex)
        REFERENCES Cinemex(IDCine, Nombre)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
