-- =============================================================
-- Ejercicio 2 (1 punto): Inserción de datos en la tabla Promociones
-- =============================================================
-- Descuentos expresados como decimales: 10% = 0.10, 15% = 0.15, etc.

INSERT INTO Promociones (productoId, descuento, fechaInicio, fechaFin) VALUES
-- Producto 1: Smartphone (3 promociones)
(1, 0.10, '2024-01-01', '2024-01-15'),   -- 10% desc. del 1 al 15 de enero 2024
(1, 0.15, '2025-01-01', '2025-01-15'),   -- 15% desc. del 1 al 15 de enero 2025
(1, 0.20, '2025-06-01', '2025-06-30'),   -- 20% desc. del 1 al 30 de junio 2025

-- Producto 2: Laptop (2 promociones)
(2, 0.30, '2024-07-01', '2024-07-31'),   -- 30% desc. durante julio 2024
(2, 0.20, '2025-07-01', '2025-07-31'),   -- 20% desc. durante julio 2025

-- Producto 3: Libro Electrónico (1 promoción)
(3, 0.10, '2025-07-01', '2025-07-31'),   -- 10% desc. durante julio 2025

-- Producto 4: Videojuego (1 promoción)
(4, 0.40, '2025-08-01', '2025-08-31'),   -- 40% desc. durante agosto 2025

-- Producto 7: Película (1 promoción)
(7, 0.05, '2025-06-01', '2025-06-30'),   -- 5% desc. durante junio 2025

-- Producto 9: Tableta Gráfica (1 promoción)
(9, 0.10, '2025-07-01', '2025-07-31');   -- 10% desc. durante julio 2025
