/* 01-restaurantes.sql  ─ Evaluador de Restaurantes */
-- 1. Crear login y usuario
CREATE LOGIN eva_rest_user WITH PASSWORD = 'P@ssw0rd2025!';
GO
CREATE DATABASE EvaRestDB;
GO
USE EvaRestDB;
CREATE USER eva_rest_user FOR LOGIN eva_rest_user;
ALTER ROLE db_owner ADD MEMBER eva_rest_user;
GO

-- 2. Crear tabla principal
CREATE TABLE Restaurantes (
    Id            INT IDENTITY PRIMARY KEY,
    Nombre        NVARCHAR(100) NOT NULL,
    TipoComida    NVARCHAR(50)  NOT NULL,
    Calificacion  INT CHECK (Calificacion BETWEEN 1 AND 5),
    Comentarios   NVARCHAR(255)
);

-- 3. Poblar con 5 registros
INSERT INTO Restaurantes (Nombre, TipoComida, Calificacion, Comentarios) VALUES
(N'La Parrilla de Juan',      N'Parrillada', 5,  N'Excelente carne'),
(N'Sushi Go',                 N'Japonesa',   4,  N'Buena relación precio-calidad'),
(N'Verde Fresco',             N'Vegano',     3,  N'Ensaladas frescas'),
(N'Pizzería Napolitana',      N'Italiana',   5,  N'Masa artesanal'),
(N'Tacos del Zócalo',         N'Mexicana',   4,  N'Salsas picantes variadas');