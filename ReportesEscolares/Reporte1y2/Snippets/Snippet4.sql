	ALTER TABLE Presentacion DROP PRIMARY KEY;

	ALTER TABLE Presentacion ADD
		PRIMARY KEY(IDPresentacion, Fecha);