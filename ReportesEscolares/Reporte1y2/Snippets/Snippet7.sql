CREATE TABLE Gerente (
    IDGenerente INT NOT NULL,
    Nombre VARCHAR(30),
    Turno VARCHAR(20),
    Salario REAL,
    Telefeno INT,
    IDCine INT,
    FOREIGN KEY (IDCine)
        REFERENCES Cinemex(IDCine)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
