-- =============================================================
-- Ejercicio 5 (2,5 puntos): Procedimiento p_anularPedido
-- =============================================================
-- Recibe un número de pedido como parámetro.
-- Dentro de una transacción:
--   1. Restaura el stock de cada producto según las unidades del pedido.
--   2. Elimina las líneas de pedido asociadas.
--   3. Elimina el propio pedido.
-- Si ocurre cualquier error, se hace ROLLBACK y se lanza un mensaje de error.

DELIMITER //

CREATE PROCEDURE p_anularPedido(IN p_pedidoId INT)
BEGIN
    -- Manejador de excepciones: ante cualquier error SQL se revierte la transacción
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error al anular el pedido. Se ha revertido la operación.';
    END;

    START TRANSACTION;

    -- Paso 1: Reponer el stock de los productos afectados por el pedido
    UPDATE Productos p
    JOIN   LineasPedido lp ON p.id = lp.productoId
    SET    p.stock = p.stock + lp.unidades
    WHERE  lp.pedidoId = p_pedidoId;

    -- Paso 2: Eliminar las líneas del pedido
    DELETE FROM LineasPedido
    WHERE pedidoId = p_pedidoId;

    -- Paso 3: Eliminar el pedido
    DELETE FROM Pedidos
    WHERE id = p_pedidoId;

    COMMIT;
END //

DELIMITER ;
