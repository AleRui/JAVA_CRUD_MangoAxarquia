# Aplicación MangoAxarquía V2.0

Alumno: Alejandro Ruiz
Centro: IES Campanillas
Curso: 1ºDAW 2017-2018

Ejercicios de las asignaturas **Programación en Java y Base de Datos MySQL**

<img style=" width=50%; " src="imas/logo_mangoAxarquia.png">

## Instalación:
* La base de datos se ha realizado en MySQL por lo que se ha usado un servidor de MySQL versión 5.7 para ser ejecutada. Además se ha utilizado Netbeans por lo que hemos usado el driver JDBC para MySQL con el módulo de conexión mysql-connector-java-5.1.23-bin de Netbeans y la base de datos se ha ido tratadno tanto en NetBeans, como con MYSQL Workbench 6.3.
* Las páginas web están creadas en JSP por lo que necesita un servidor de aplicaciones como GlassFish para ser ejecutadas, se ha usado la versión 4.1.1
* Además se han usado el Framework de CSS bootstrap 4.0 y Javascript por lo que se recomienda usar con conexión a internet.

## Version 2.0: Cambios Realizados
<ul>
	<li>
		<divwidth="40%">
			Estructuración del contenido de los ficheros dentro del proyecto de acuerdo con el punto de vista de patrón de diseño de arquitectura de software Modelo-Vista-Contralador.
		</div>
		<divwidth="40%"><img height="250" src="imas/esquema.jpg" alt="Estructuración"></div>
	</li>
	<li>
		<divwidth="40%">
			Para hacer menos pesado el código se han externalizado los elementos comunes de las webs: header, navbar, footer... Y se han introducido en los jsp mediante:<br>
			~~~
			<%@include file="../esquema/header.jsp"%>
			~~~
		</div>
		<divwidth="40%"><img height="250" src="imas/includes.jpg" alt="includes"></div>
	</li>
	<li>
		<divwidth="40%">
			Cambios en la estructura de la base de datos. Ver archivo bd/cambios_BD_mangos_CRUD_II.sql<br>
			Hay también una copia de la base de datos: Backup_mangos
		</div>
		<divwidth="40%"><img height="250" src="imas/model.jpg" alt="Modelo"></div>
	</li>
	<li>
		<divwidth="40%">
			Creación de la clase Linea para manejar las líneas del pedido.<br>
			La clase esta en la ruta: Source Packages/mangoObjetos/linea.javabr>
			Ver archivos: crearPedido.jsp - ingresaLineaPedido.jsp - ingresaPedido.jsp
		</div>
		<divwidth="40%"><img height="250" src="imas/Clase_Linea01.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Uso de ArrayList para contener los objetos linea del pedido e ir actualizandolos.<br>
			Ver archivos: crearPedido.jsp - ingresaLineaPedido.jsp - ingresaPedido.jsp<br>
			~~~
			ArrayList<Linea> conjLineas = new ArrayList();
	  	conjLineas = (ArrayList<Linea>) request.getSession().getAttribute("conjLineas");
			~~~
		</div>
		<divwidth="40%"><img height="250" src="imas/ArrayList.png" alt="ArrayList"></div>
	</li>
	<li>
		<divwidth="40%">
			Creación de la operar.compVacio() Para comprobar si un String viene vacio.<br>
			La función esta en la ruta: Source Packages/mangoFunciones/operar.java<br>
			Ver archivos: crearPedido.jsp - ingresaLineaPedido.jsp - ingresaPedido.jsp
		</div>
		<divwidth="40%"><img height="250" src="imas/compVacio.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Uso de la variable Session en request.session() para pasar elementos de un psj a otro.
		</div>
		<divwidth="40%"><img height="250" src="imas/Clase_Linea01.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Eliminar elementos de la variable Session cuando se haya terminado de realizar un pedido o al salir a otra zona de la web.
		</div>
		<divwidth="40%"><img height="250" src="#" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Mantener el usuario mientras va añadiendo líneas javascript+java.<br>
			Ver archivos: crearPedido.jsp - ingresaLineaPedido.jsp - ingresaPedido.jsp - formulario.js
		</div>
		<divwidth="40%"><img height="250" src="imas/ArrayList.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Ingreso de Factura con varias Líneas de pedido.
		</div>
		<divwidth="40%"><img height="250" src="imas/ArrayList.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Consulta de pedido.
		</div>
		<divwidth="40%"><img height="250" src="imas/listaPedidos.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Validaciones de campos desde el navegador con javascript. Observar campos de Clientes: no se admite un DNI o Teléfono de una longitud distinta de 9. (" Para una futura versión esto se debería de controlar con patrones").
		</div>
		<divwidth="40%"><img height="250" src="imas/alertaNIF.jpg" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Control de valores de inserción en la BD del controlador.
			<ul>
				<li>No se puede introducir un pedido sin comprador.</li>
				<li>No se puede introducir un pedido sin líneas de factura.</li>
				<li>No se puede introducir un pedido sin cantidad.</li>
			</ul>
		</div>
		<divwidth="40%"><img height="250" src="imas/pedidoSinComp.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Ventanas de alerta a la hora de borrar una variedad, un cliente o un pedido.
		</div>
		<divwidth="40%"><img height="250" src="imas/alertaBorrarPedido.png" alt="Clase Linea"></div>
	</li>
	<li>
		<divwidth="40%">
			Creación de alertas para mostrar al usuario porque no se ha podido realizar una tarea.
		</div>
		<divwidth="40%"><img height="250" src="imas/pedidoSinComp.jpg" alt="Clase Linea"></div>
	</li>

## Cambios Propuestas para Version 3.0:
* Modificar Pedidos
* Mejorar validaciones en Vistas, Controlador y Modelo.
* Creación de objetos o funciones para tareas repetitivas: conexiones, validaciones...
* Mejoreas estéticas en la maquetación y el diseño
* Adaptación a web Responsiva
