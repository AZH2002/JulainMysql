CREATE DATABASE ejercicio3_discos;

CREATE TABLE artistas (
    IdArtista INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    GeneroMusical VARCHAR (70),
    NumAlbumes TINYINT (20)
);

CREATE TABLE discografica (
    IdDiscografica INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    telefono INT (12) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    Cant_Discos INT(100)
);

CREATE TABLE discos (
    IdDisco INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    Fec_Creacion DATE NOT NULL,
    generos VARCHAR(150) NOT NULL,
    FkIdDiscografica INT(11) NOT NULL,
    FOREIGN KEY (FkIdDiscografica) REFERENCES discografica (IdDiscografica)
);

CREATE TABLE canciones (
    IdCanciones INT(11) NOT NULL PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    duracion FLOAT (11) NOT NULL,
    generos VARCHAR(150) NOT NULL,
    Esc_Artista BIT(1) NOT NULL,
    Esc_Compositor BIT(1) NOT NULL,
    FkIdDisco INT(11) NOT NULL,
    FOREIGN KEY (FkIdDisco) REFERENCES discos (IdDisco)
);

CREATE TABLE ArtistasDiscos (
    FkIdArtista INT(11) NOT NULL,
    FkIdDisco INT(11) NOT NULL,
    PRIMARY KEY (FkIdArtista, FkIdDisco),
    FOREIGN KEY (FkIdArtista) REFERENCES artistas (IdArtista),
    FOREIGN KEY (FkIdDisco) REFERENCES discos (IdDisco)
);

INSERT INTO artistas VALUES(12345, "Pierce The Veil", "Post Hardcore", 4)
INSERT INTO artistas VALUES(6789, "Rage Against The Machine", "Trash", 3)
UPDATE artistas SET nombre ="Sleeping With Sirens" WHERE nombre="Pierce The Veil"
UPDATE artistas SET nombre ="Slipknot", GeneroMusical ="New Metal" 
DELETE FROM artistas WHERE IdArtista= 6789
DELETE FROM aritstas WHERE IdArtista = 12345