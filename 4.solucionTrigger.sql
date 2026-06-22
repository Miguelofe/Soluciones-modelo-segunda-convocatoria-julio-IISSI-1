-- =============================================================
-- Ejercicio 4 (2 puntos): Trigger trg_actualizar_precio_pedido_promocion
-- =============================================================
-- El trigger se dispara ANTES de insertar una línea de pedido.
-- Si existe una promoción activa para el producto, ajusta el precio
-- de la línea de pedido aplicando el descuento correspondiente.
-- Si no hay promoción activa, el precio se mantiene tal como se insertó.

DELIMITER //

CREATE OR REPLACE TRIGGER trg_actualizar_precio_pedido_promocion
BEFORE INSERT ON LineasPedido
FOR EACH ROW
BEGIN
    DECLARE v_descuento DECIMAL(4, 2) DEFAULT NULL;

    -- Buscar si existe una promoción activa para el producto en la fecha actual
    SELECT descuento
    INTO   v_descuento
    FROM   Promociones
    WHERE  productoId = NEW.productoId
      AND  CURDATE() BETWEEN fechaInicio AND fechaFin
    LIMIT 1;  -- por si hubiera más de una activa, tomamos la primera

    -- Si se encontró descuento, aplicarlo al precio de la línea
    IF v_descuento IS NOT NULL THEN
        SET NEW.precio = ROUND(NEW.precio * (1 - v_descuento), 2);
    END IF;
END //

DELIMITER ;
