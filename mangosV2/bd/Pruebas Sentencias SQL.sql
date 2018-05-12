-- Mirar todos los datos de Mangos
SELECT * FROM mangos LIMIT 100;
SELECT * FROM comprador LIMIT 100;
SELECT * FROM factura LIMIT 100;
SELECT * FROM det_fact LIMIT 100;

--Comprobar tipo de datos
SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_NAME = 'mangos'
AND 
     COLUMN_NAME = 'nombreVar'

--Cambiar Fecha a Not Null
ALTER TABLE mangos ALTER COLUMN fechaIniAprox DATE NOT NULL;

--Borrar todos los registros
TRUNCATE TABLE mangos;

--Inserta Comprador
INSERT INTO comprador
VALUES (1234,'pepe','11112222A','empresa','Calle1','pepe@pepe.com', '611222333')

-- Insertar datos en factura
INSERT INTO factura
VALUES (1,'2018-03-14',1234)

--Coger mayor numero de factura
SELECT MAX(numFact) AS maxNumFact FROM factura

--Coger Usuario
SELECT * FROM comprador

--Borrar de det-factura
@NUMFACT = 2
DELETE FROM det_fact WHERE numFact = 2
--Borrar facturas
DELETE FROM factura WHERE numFact = 2

--Consulta Pedido
SELECT f.`numFact`, c.`nombreComp`, f.`fechaFact`, T2.Precio_Total  FROM factura f
LEFT JOIN comprador c ON f.`idComprador`=c.`idComprador`
LEFT JOIN (SELECT numFact, SUM(precio*cantidad) AS 'Precio_Total' FROM det_fact
GROUP BY numFact) T2 ON f.`numFact` = T2.numFact


SELECT numFact, SUM(precio*cantidad) FROM det_fact
GROUP BY numFact