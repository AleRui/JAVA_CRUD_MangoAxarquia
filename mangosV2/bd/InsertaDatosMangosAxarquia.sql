
/**
 * Author:  Ale Ruiz
 * Created: 21-mar-2018
 */
USE  mangos;

/*Inserta Comprador*/
INSERT INTO comprador
VALUES
  (1,'Eva Mª Perales Belizón','11112222A','empresa',
    'C/ Marie Curie Nº 10. PTA Málaga','eva@empresa.com', '611222333'),
  (2,'Luis José Sánchez González','B33334444','particular',
    'C/ MArie Curie Nº 10. PTA Málaga','luis@particular.com', '644555666')

/*Insertar datos en factura*/
INSERT INTO mangos
VALUES 
  (101, 'Osteen', 0.53, '2018-09-14', 1.20, 20000 ),
  (102, 'Kent', 0.48, '2018-09-21', 1.20, 23000 ),
  (103, 'Tommy Atkins', 0.48, '2018-08-21', 0.850, 45000 ),
  (104, 'Ataulfo', 0.48, '2018-09-21', 1.80, 2000 ),
  (105, 'Keit', 0.48, '2018-10-14', 0.80, 42000 ),
  (106, 'Palmer', 600, '2018-10-14', 1.40, 8000 )

