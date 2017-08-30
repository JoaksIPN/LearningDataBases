ALTER TABLE Gerente         ADD COLUMN NombreCinemex VARCHAR(30);
ALTER TABLE EmpleadoCinemex ADD COLUMN NombreCinemex VARCHAR(30);


ALTER TABLE Gerente 
    ADD FOREIGN KEY(IDCine, NombreCinemex)
        REFERENCES Cinemex(IDCine, Nombre)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

ALTER TABLE EmpleadoCinemex
    ADD FOREIGN KEY(IDCine, NombreCinemex)
        REFERENCES Cinemex(IDCine, Nombre)
        ON DELETE CASCADE
        ON UPDATE CASCADE;
