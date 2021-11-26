CREATE DATABASE ejercicio2_campeonato;

CREATE TABLE campeonato (
    IdCampeonato INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    F_inicio DATE NOT NULL,
    F_fin DATE,
    duracion TINYINT(30)
);

CREATE TABLE selecciones (
    codigo INT(11) NOT NULL PRIMARY KEY,
    nombreOficial VARCHAR(70) NOT NULL,
    añoFundacion DATE NOT NULL
);

CREATE TABLE partidos (
    IdPartido INT(11) NOT NULL PRIMARY KEY,
    ciudad VARCHAR(85) NOT NULL,
    resultado CHAR(1),
    estadio VARCHAR(50) NOT NULL,
    fecha DATE
);

CREATE TABLE jugadores (
    documento INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    1_apellido VARCHAR(50) NOT NULL,
    2_apellido VARCHAR(50),
    numero TINYINT(11),
    suplente BIT NOT NULL,
    lesionado BIT,
    posicion VARCHAR(30) NOT NULL,
    FkCodSeleccion INT(11) NOT NULL,
    FOREIGN KEY (FkCodSeleccion) REFERENCES selecciones (codigo)

);

CREATE TABLE CampeonatoSelecciones (
    IDCampeonato INT(11) NOT NULL,
    CodigoSelecciones INT(11) NOT NULL,
    PRIMARY KEY (IDCampeonato, CodigoSelecciones),
    FOREIGN KEY (IDCampeonato) REFERENCES campeonato (IdCampeonato),
    FOREIGN KEY (CodigoSelecciones) REFERENCES selecciones (codigo)
);

CREATE TABLE SeleccionesPartidos (
    CodigoSelecciones INT(11) NOT NULL,
    IDPartido INT(11) NOT NULL,
    PRIMARY KEY (CodigoSelecciones, IDPartido),
    FOREIGN KEY (CodigoSelecciones) REFERENCES selecciones (codigo),
    FOREIGN KEY (IDPartido) REFERENCES partidos (IdPartido)
);

CREATE TABLE JugadoresPartidos (
    DocJugador INT(11) NOT NULL,
    IDPartido INT (11) NOT NULL,
    Goles INT (20),
    PRIMARY KEY (DocJugador, IDPartido),
    FOREIGN KEY (DocJugador) REFERENCES jugadores (documento),
    FOREIGN KEY (IDPartido) REFERENCES partidos (IdPartido)
);

INSERT INTO partidos VALUES(12345, "Manizales", "P", "Palogrande", "2021-11-22");
INSERT INTO partidos VALUES(13579, "Cardiff", "G", "Cardiff City Stadium", "2018-4-16")
UPDATE partidos SET ciudad ="Cardiff ", resultado="G", estadio="Cardiff City Stadium", fecha="2018-4-16" WHERE IdPartido = 12345
DELETE FROM partidos WHERE IdPartido= 13579