CREATE DATABASE ejercicio1_universidad;

CREATE TABLE alumno(
    documento INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    telefono INT(11),
    genero CHAR(1) NOT NULL,
    fechaNac DATE NOT NULL
);

CREATE TABLE profesor (
    documento INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    experiencia DATE,
    area VARCHAR(200) NOT NULL
);

CREATE TABLE asignaturas (
    ID INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    nota FLOAT(2),
    creditos FLOAT(3) NOT NULL,
    FkDocumentoPro INT(11) NOT NULL,
    FOREIGN KEY (FkDocumentoPro) REFERENCES profesor (documento)

);

CREATE TABLE curso (
    numIdent INT(11) NOT NULL PRIMARY KEY,
    fechaIni DATE NOT NULL,
    fechaFin DATE,
    nombre VARCHAR(70) NOT NULL,
    intensidad TINYINT(10) NOT NULL,
    FkDocumentoPro INT(11) NOT NULL,
    FOREIGN KEY (FkDocumentoPro) REFERENCES profesor (documento),
    FkDocumentoEst INT(11) NOT NULL,
    FOREIGN KEY (FkDocumentoEst) REFERENCES alumno (documento)
);

CREATE TABLE alumnoAsignatura (
    documentoEstudiante INT(11) NOT NULL ,
    IDAsignatura INT(11) NOT NULL ,
    PRIMARY KEY (documentoEstudiante, IDAsignatura),
    FOREIGN KEY (documentoEstudiante) REFERENCES alumno (documento),
    FOREIGN KEY (IDAsignatura) REFERENCES asignaturas (ID)
    

);

CREATE TABLE cursoAsignatura (
    numIdenti INT(11) NOT NULL,
    IDAsign INT(11) NOT NULL,
    PRIMARY KEY (numIdenti, IDAsign),
    FOREIGN KEY (numIdenti) REFERENCES curso (numIdent),
    FOREIGN KEY (IDAsign) REFERENCES asignaturas (ID)
);

INSERT INTO alumno VALUES(12345, "Alberto", 3147170906, "M", "2002-11-20" )
UPDATE alumno SET nombre ="Arcangel" WHERE nombre="Alberto"
INSERT INTO alumno VALUES(6789, "Carolina", 3122743583, "F", "2002-05-05" )
DELETE FROM alumno WHERE documento= 12345