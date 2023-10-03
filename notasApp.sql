-- Crear la base de datos
CREATE DATABASE AppNotas;

-- Usar la base de datos
USE AppNotas;

-- Crear la tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- 10 registros de prueba en la tabla de Usuarios
INSERT INTO Usuarios (Nombre, Email)
VALUES
    ('Usuario1', 'usuario1@email.com'),
    ('Usuario2', 'usuario2@email.com'),
    ('Usuario3', 'usuario3@email.com'),
    ('Usuario4', 'usuario4@email.com'),
    ('Usuario5', 'usuario5@email.com'),
    ('Usuario6', 'usuario6@email.com'),
    ('Usuario7', 'usuario7@email.com'),
    ('Usuario8', 'usuario8@email.com'),
    ('Usuario9', 'usuario9@email.com'),
    ('Usuario10', 'usuario10@email.com');

-- Crear la tabla de Notas
CREATE TABLE Notas (
    NotaID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    Título VARCHAR(100) NOT NULL,
    FechaCreacion DATE NOT NULL,
    FechaModificacion DATE NOT NULL,
    Descripcion TEXT NOT NULL,
    PuedeSerEliminada BOOLEAN NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- 10 registros de prueba en la tabla de Notas
INSERT INTO Notas (UsuarioID, Título, FechaCreacion, FechaModificacion, Descripcion, PuedeSerEliminada)
VALUES
    (1, 'Nota 1', '2023-09-14', '2023-09-14', 'Esta es la nota 1', 1),
    (2, 'Nota 2', '2023-09-14', '2023-09-14', 'Esta es la nota 2', 0),
    (3, 'Nota 3', '2023-09-14', '2023-09-14', 'Esta es la nota 3', 1),
    (4, 'Nota 4', '2023-09-14', '2023-09-14', 'Esta es la nota 4', 0),
    (5, 'Nota 5', '2023-09-14', '2023-09-14', 'Esta es la nota 5', 1),
    (6, 'Nota 6', '2023-09-14', '2023-09-14', 'Esta es la nota 6', 0),
    (7, 'Nota 7', '2023-09-14', '2023-09-14', 'Esta es la nota 7', 1),
    (8, 'Nota 8', '2023-09-14', '2023-09-14', 'Esta es la nota 8', 0),
    (9, 'Nota 9', '2023-09-14', '2023-09-14', 'Esta es la nota 9', 1),
    (10, 'Nota 10', '2023-09-14', '2023-09-14', 'Esta es la nota 10', 0);

-- Crear tabla de Categorías
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    NombreCategoria VARCHAR(255) NOT NULL
);

-- 10 registros de prueba en la tabla de Categorías
INSERT INTO Categorias (NombreCategoria)
VALUES
    ('Música'),
    ('Deportes'),
    ('Tecnología'),
    ('Viajes'),
    ('Cocina'),
    ('Salud'),
    ('Cine'),
    ('Libros'),
    ('Arte'),
    ('Ciencia');

-- Crear tabla de NotasCategorias para asociar notas a categorías
CREATE TABLE NotasCategorias (
    NotaID INT,
    CategoriaID INT,
    PRIMARY KEY (NotaID, CategoriaID),
    FOREIGN KEY (NotaID) REFERENCES Notas(NotaID),
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);