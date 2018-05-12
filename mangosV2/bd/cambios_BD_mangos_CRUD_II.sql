/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Solbyte
 * Created: 03-may-2018
 */
-- Cambia tabala det_fact
ALTER TABLE det_fact
  DROP PRIMARY KEY,
  ADD PRIMARY KEY(codDetFact, numFact);

-- Añade Precio
ALTER TABLE det_fact
  ADD `precio` FLOAT NOT NULL;

-- Vaciar Tablas det_fact y factura
TRUNCATE det_fact;
DELETE FROM det_fact WHERE numFact = 4;
--
DELETE FROM factura WHERE numFact = 2;
-- Cambia numFact
ALTER TABLE det_fact DROP INDEX numFact
--
ALTER TABLE factura DROP INDEX numFact


-- Cambio nombre variedad
ALTER TABLE `mangos`.`mangos` 
RENAME TO  `mangos`.`variedad` ;

-- SELECT
SELECT * FROM FACTURA