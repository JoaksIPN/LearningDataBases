ALTER TABLE Profesor RENAME AS Catedratico;

ALTER TABLE Presentacion ADD COLUMN
	Dictamen VARCHAR(10);

ALTER TABLE Departamento CHANGE COLUMN
	Nombre NombreDelDepartamento VARCHAR(50);

ALTER TABLE Catedratico ADD COLUMN
	Telefono INT;

ALTER TABLE Catedratico MODIFY COLUMN
	Telefono VARCHAR(15);