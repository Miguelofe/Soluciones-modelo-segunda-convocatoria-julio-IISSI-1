-- =============================================================
-- Ejercicio 1 (1 punto): Creación de la tabla Promociones
-- =============================================================
-- Cada promoción está relacionada con un único producto (no todos los productos tienen promoción).
-- El descuento es un valor > 0 y <= 1 (representado como decimal, ej: 0.20 = 20%).
-- Se garantiza que la fecha de fin es posterior a la fecha de inicio mediante CHECK.

CREATE TABLE Promociones (
    id          INT            PRIMARY KEY AUTO_INCREMENT,
    productoId  INT            NOT NULL,
    descuento   DECIMAL(4, 2)  NOT NULL
                               CHECK (descuento > 0 AND descuento <= 1),
    fechaInicio DATE           NOT NULL,
    fechaFin    DATE           NOT NULL,

    CONSTRAINT fk_promocion_producto
        FOREIGN KEY (productoId) REFERENCES Productos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT chk_fechas_validas
        CHECK (fechaFin > fechaInicio)
);
