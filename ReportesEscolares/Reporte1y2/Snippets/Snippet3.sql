ALTER TABLE Presentacion ADD COLUMN NumeroTrabajo INT;

ALTER TABLE Presentacion ADD
    FOREIGN KEY(NumeroTrabajo)
        REFERENCES TrabajoTerminal(NumeroDeTrabajoTerminal)
        ON DELETE CASCADE
        ON UPDATE CASCADE;