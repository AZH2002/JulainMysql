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