#Creación Base de Datos
CREATE DATABASE practica_estudiante;

CREATE TABLE Estudiante (
    CodEstudiante INT(11) PRIMARY KEY,
    Nombre VARCHAR(70) NOT NULL,
    FechaNac DATE NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    Email VARCHAR(200) NOT NULL,
    Genero CHAR(1) NOT NULL
);

CREATE TABLE director(

CodDirector INT(11) PRIMARY KEY,
Nombre VARCHAR(80) NOT NULL,
Profesion VARCHAR(40)
);

CREATE TABLE profesor (
    CodProfesor INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    genero BOOLEAN NOT NULL,
    estado VARCHAR(50) NOT NULL,
    TipContrato VARCHAR (30) NOT NULL,
    estaActivo BOOLEAN NOT NULL,
    FechaActivacion DATETIME NOT NULL

);

CREATE TABLE Carrera(
    CodCarrera INT(11) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Duracion TINYINT(4) NOT NULL,
    Modalidad VARCHAR(50) NOT NULL,
    FkCodDirector INT(11) NOT NULL,
    FOREIGN KEY (FkCodDirector) REFERENCES director (CodDirector)

);

CREATE TABLE Practica (
    IdContrato INT(11) NOT NULL PRIMARY KEY,
    Lugar VARCHAR(70) NOT NULL,
    FechaIni DATE NOT NULL,
    FechaFin DATE NOT NULL,
    Nota FLOAT(11) NOT NULL,
    Modalidad VARCHAR(50),
    FkCodEstudiante INT(11), 
    FOREIGN KEY (FkCodEstudiante) REFERENCES Estudiante (CodEstudiante),
    FkCodCarrera INT(11),
    FOREIGN KEY (FkCodCarrera) REFERENCES Carrera (CodCarrera)
    
);

CREATE TABLE PracticaProfesor (
    IdContrato INT(11) NOT NULL,
    CodProfesor INT(11) NOT NULL,
    PRIMARY KEY (IdContrato, CodProfesor),
    FOREIGN KEY (IdContrato) REFERENCES Practica (IdContrato),
    FOREIGN KEY (CodProfesor) REFERENCES profesor (CodProfesor)
    

);




INSERT INTO Estudiante VALUES(123, "Juan", "2000-01-01", "Cra 1", "juan@gmail.com", "M"  )

INSERT INTO Estudiante VALUES(456, "Adrian", "2002-11-20", "Cra 8", "adrianxx2002@gmail.com", "M")

INSERT INTO director VALUES(789, "Jose David", "Dios")

INSERT INTO profesor VALUES(101112, "Luis Carlos", "M", "Activo", "Planta", "1985-05-19")

INSERT INTO Carrera VALUES(22190, "Antropologia", 3 , "Presencial", 789)

INSERT INTO Practica VALUES(131415, "Mi casa", "2021-11-30", "2023-05-15", 3.5, "Virtual", 123, 22190)

INSERT INTO Estudiante (CodEstudiante, Nombre, FechaNac, Direccion, Email, Genero) VALUES(333, "Alberto", "2003-12-30", "Cra 5", "albertosoccer@gmail.com", "M")