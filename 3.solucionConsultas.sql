-- =============================================================
-- Ejercicio 3 (3,5 puntos): Consultas
-- =============================================================


-- -----------------------------------------------------------
-- 3.1 (1 punto):
-- Obtener los ids y nombres de productos SIN ninguna promoción asociada.
-- -----------------------------------------------------------
-- Estrategia: LEFT JOIN con Promociones. Los productos sin promoción
-- tendrán NULL en los campos de la tabla Promociones.

SELECT p.id,
       p.nombre
FROM Productos p
LEFT JOIN Promociones pr ON p.id = pr.productoId
WHERE pr.id IS NULL;


-- -----------------------------------------------------------
-- 3.2 (1,25 puntos):
-- Obtener los productos con promociones ACTIVAS (hoy está entre fechaInicio y fechaFin).
-- Incluye: id, nombre, precio sin promoción y precio con promoción aplicada.
-- -----------------------------------------------------------
-- CURDATE() devuelve la fecha actual del servidor.
-- El precio con descuento = precio * (1 - descuento).

SELECT p.id,
       p.nombre,
       p.precio                                    AS precioOriginal,
       ROUND(p.precio * (1 - pr.descuento), 2)    AS precioConPromocion
FROM Productos p
JOIN Promociones pr ON p.id = pr.productoId
WHERE CURDATE() BETWEEN pr.fechaInicio AND pr.fechaFin;


-- -----------------------------------------------------------
-- 3.3 (1,25 puntos):
-- Obtener TODOS los productos ordenados por número de promociones asociadas (desc).
-- Incluye: id, nombre y número de promociones.
-- Los productos SIN promociones también deben aparecer (con 0).
-- -----------------------------------------------------------
-- LEFT JOIN para incluir productos sin promociones.
-- COUNT(pr.id) devuelve 0 cuando no hay filas en Promociones (no cuenta NULLs).

SELECT p.id,
       p.nombre,
       COUNT(pr.id) AS numPromociones
FROM Productos p
LEFT JOIN Promociones pr ON p.id = pr.productoId
GROUP BY p.id, p.nombre
ORDER BY numPromociones DESC;
