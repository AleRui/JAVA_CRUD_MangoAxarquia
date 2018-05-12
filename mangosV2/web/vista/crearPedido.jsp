<%-- 
    Document   : crearPedidos
    Created on : 12-mar-2018, 18:59:37
    Author     : Ale Ruiz
--%>

<%--  IMPORTAR Librerias SQL --%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- Importa todo dentro de Util --%>
<%@ page import="java.util.*" %>
<%-- Fecha --%>
<%@ page import="java.text.SimpleDateFormat"%>

<%-- IMPORTAR Mis Objetos --%>
<%@ page import="mangoObjetos.Linea" %>

<%-- IMPORTAR Mis Funciones --%>
<%@ page import="mangoFunciones.operar" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Global Metas -->
    <meta charset="utf-8">
    <meta name="description" content="MangoAxarquía">
    <meta name="author" content="Alejandro Ruiz">
    <meta name="keywords" content="mango, axarquia">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>Mangos de la Axarquía</title>

    <%@include file="../esquema/librerias.jsp"%>

  </head>

  <body>
    <!-- Header -->
    <%@include file="../esquema/header.jsp"%>
    <!-- Menu Navegación -->
    <%@include file="../esquema/menuNavegacion.jsp"%>

    <!-- Contenido Página -->
    <div class="wrapper">
      <div class="cont-alerta">
        <%
	  request.setCharacterEncoding("UTF-8");
	  // --------------------------------------
	  // Muestra ALERTA
	  String alerta = (String) (request.getSession().getAttribute("alerta"));
	  if (operar.compVacio(alerta) == false) {
	    out.print(alerta);
	    alerta = "";
	    request.getSession().setAttribute("alerta", alerta);
	  }
	  //-- Variables de Session crearPedido de Session
	  Object idCompUsado = request.getSession().getAttribute("idCompUsado");
	  //if (idCompUsado != null) {
	  //  out.print("idCompUsado = " + idCompUsado + "<br>");
	  //} else {
	  //  out.print("idCompUsado = " + idCompUsado + "<br>");
	  //}
	  Object NumFactUsado = request.getSession().getAttribute("NumFactUsado");
	  //if (NumFactUsado != null) {
	  //  out.print("NumFactUsado = "+NumFactUsado+"<br>");
	  //}

        %>
      </div>
      <div class="container-fluid">
        <!-- Formulario Inserción Mangos -->
        <div class="row int_mangos">
          <%	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conexion_1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");

	    //Consulta 0 Número de Factura
	    Statement con0 = conexion_1.createStatement();
	    ResultSet consulta0 = con0.executeQuery(
		    "SELECT MAX(numFact) AS maxNumFact FROM factura"
	    );
	    //Object NumFactUsado = request.getSession().getAttribute("NumFactUsado");
	    int NumFact = 0;
	    if (NumFactUsado == null) {
	      while (consulta0.next()) {
		NumFact = consulta0.getInt("maxNumFact") + 1;
		//out.print("<div>NumFact = "+NumFact+"</div><br>");
	      }
	    } else {
	      int UsarNumFactura = Integer.parseInt(request.getSession().getAttribute("NumFactUsado").toString());
	      //out.print("NumFactUsado: " + UsarNumFactura);
	      NumFact = UsarNumFactura;
	    }
	    // --------------------------------------

	    //Consulta 1 Cargar Variedades de Mangos
	    Statement con1 = conexion_1.createStatement();
	    ResultSet infoMangos = con1.executeQuery(
		    "SELECT idMangos, nombreVar, precio FROM variedad ORDER BY idMangos"
	    );
	    //---------------------------------------

	    //Consulta 2 Cargar Compradores
	    Statement con2 = conexion_1.createStatement();
	    ResultSet infoComprador = con2.executeQuery(
		    "SELECT * FROM comprador"
	    );
	    // ------------------
	    /*Obetener Ultimo CodDetFact usado en línea anterior*/

	    int CodDetFact = 0;
	    Object ultLi = request.getSession().getAttribute("ultNumLinea");
	    if (ultLi == null) {
	      CodDetFact = 1;
	    } else {
	      int ultNumLinea = Integer.parseInt(request.getSession().getAttribute("ultNumLinea").toString());
	      //out.print("<div style=\"background-color:yellow\">" + ultNumLinea + "</div>");
	      CodDetFact = ultNumLinea + 1;
	    }

          %>
          <h1>Realizar Pedido</h1>
          <form id="pedido" class="form" method="GET" accept-charset="UTF-8"
                action="../controlador/ingresaPedido.jsp">
            <!-- Zona Comprador -->
            <div class="zona_comprador">
              <h3>Datos Comprador:</h3>
              <div class="form-group form-group-idComprador">
                <label for="idComprador">idComp</label>
                <input class="form-control" id="idComprador" type="number"
                       form="pedido" value="0" name="idComprador" required readonly/>
                <small id="idCompradorHelp" class="form-text text-muted">Cuidado.</small>
              </div>
              <div class="form-group form-group-nombreComp">
                <label for="nombreComp">Nombre Comprador</label>
                <select form="pedido" class="form-control" name="nombreComp"
                        id="nombreComp"onChange="ponerComprador()"
			data-opc_idComprador="
			<%			    if (idCompUsado != null) {
			    out.print(idCompUsado);
			  } else {
			    out.print("");
			  }
			%>
			">
                  <option id="opcionElegida" class="opcion-select" data-opc_idComprador="0">Elegir Usuario</option>
                  <%		    int contOpcNomComp = 1;
		    while (infoComprador.next()) {
		      String idComprador = infoComprador.getString("idComprador");
		      String nombreComp = infoComprador.getString("nombreComp");
		      String NIFComp = infoComprador.getString("NIFComp");
		      String tipoComp = infoComprador.getString("tipoComp");
		      String dirEnvioComp = infoComprador.getString("dirEnvioComp");
		      String emailComp = infoComprador.getString("emailComp");
		      String tlfComp = infoComprador.getString("tlfComp");
		      out.print(
			      "<option id=\"opcionElegida-" + contOpcNomComp + "\" "
			      + "class=\"opcion-select\""
			      + "data-opc_idComprador=\"" + idComprador + "\""
			      + "data-opc_NIFComp=\"" + NIFComp + "\""
			      + "data-opc_tipoComp=\"" + tipoComp + "\""
			      + "data-opc_dirEnvioComp=\"" + dirEnvioComp + "\""
			      + "data-opc_emailComp=\"" + emailComp + "\""
			      + "data-opc_tlfComp=\"" + tlfComp + "\""
			      + "value=\"" + nombreComp + "\">" + nombreComp + "</option>"
		      );
		      contOpcNomComp++;
		    }
                  %>
                </select>
                <small id="nombreVarHelp" class="form-text text-muted">Cuidado.</small>
              </div>
              <div class="form-group form-group-idComprador">
                <label for="NIFComp">DNI/NIF</label>
                <input class="form-control" id="NIFComp" type="text"
                       form="pedido" value="" name="NIFComp" required readonly/>
                <small id="NIFCompHelp" class="form-text text-muted">Cuidado.</small>
              </div>
              <div class="form-group form-group-tipoComp">
                <label for="tipoComp">Tipo Comprador</label>
                <input class="form-control" id="tipoComp" type="text"
                       form="pedido" value="" name="tipoComp" required readonly/>
                <small id="tipoCompHelp" class="form-text text-muted">Cuidado.</small>
              </div>
              <div class="form-group form-group-dirEnvioComp">
                <label for="dirEnvioComp">Dirección Factura</label>
                <input class="form-control" id="dirEnvioComp" type="text"
                       form="pedido" value="" name="dirEnvioComp" required readonly/>
                <small id="dirEnvioCompHelp" class="form-text text-muted">Cuidado.</small>
              </div>
              <div class="form-group form-group-emailComp">
                <label for="emailComp">emailComp</label>
                <input class="form-control" id="emailComp" type="text"
                       form="pedido" value="" name="emailComp" required readonly/>
                <small id="emailCompHelp" class="form-text text-muted">Cuidado.</small>
              </div>
              <div class="form-group form-group-tlfComp">
                <label for="tlfComp">tlfComp</label>
                <input class="form-control" id="tlfComp" type="text"
                       form="pedido" value="" name="tlfComp" required readonly/>
                <small id="tlfCompHelp" class="form-text text-muted">Cuidado.</small>
              </div>
              <div class="form-group form-group-tlfComp">
                <label for="fechaFact">fechaFact</label>
                <input class="form-control" id="fechaFact" type="text"
                       value="<%
			 Date dNow = new Date();
			 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			 String fechaActual = ft.format(dNow);
			 out.println(fechaActual);
                       %>"
                       form="pedido" name="fechaFact" required readonly/>
                <small id="fechaFactHelp" class="form-text text-muted">Cuidado.</small>
              </div> 
              <div class="form-group form-group-numFact">
                <label for="numFact">numFact</label>
                <input class="form-control" id="numFact" type="number"
                       form="pedido" value="<%=NumFact%>"
                       name="numFact" placeholder="numFact" required readonly/>
                <small id="numFactHelp" class="form-text text-muted">Cuidado.</small>
              </div>
            </div>
            <!-- Botón Introducir -->
            <div class="form-group form-group-boton">
              <button form="pedido" type="submit" class="btn btn-primary">Introducir</button>
            </div>
          </form>
        </div>

        <!-- Introduce línea de producto -->
        <div>
          <form  id="linea-pedido" class="form" method="GET" accept-charset="UTF-8"
                 action="">
            <h3>Introduzca Producto:</h3>
            <div class="form-group form-group-numFact-row">
              <label for="numFact-row">NºF</label>
              <input class="form-control" id="numFact-row" type="number"
                     form="linea-pedido" value="<%=NumFact%>"
                     name="numFact-row" required readonly/>
              <small id="numFact-rowHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-codDetFact">
              <label for="codDetFact">CDF</label>
              <input class="form-control" id="codDetFact" type="text"
                     form="linea-pedido" value="<%=CodDetFact%>"
                     name="codDetFact" required readonly/>
              <small id="codDetFactHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-idMangos">
              <label for="idMangos">idMangos</label>
              <input class="form-control" type="number" id="idMangos"
                     form="linea-pedido" name="idMangos" value="" readonly required/>
              <small id="idMangosHelp" class="form-text text-muted">Cuidado.</small>
            </div>

            <div class="form-group form-group-nombreVar">
              <label for="nombreVar2">Variedad Mango</label>
              <select class="form-control" name="nombreVar2" 
                      form="linea-pedido" id="nombreVar2" onChange="ponerVariedad()">
                <option id="opcionElegida" class="opcion-select">Elige Variedad</option>
                <%
		  int contOpcElegida = 1;
		  float precioVar = 0;
		  while (infoMangos.next()) {
		    int ponerIdMangos = infoMangos.getInt("idMangos");
		    String campo = infoMangos.getString("nombreVar");
		    precioVar = infoMangos.getFloat("precio");
		    out.print(
			    "<option id=\"opcionElegida-" + contOpcElegida + "\" "
			    + "class=\"opcion-select\""
			    + "data-opc_precio=\"" + precioVar + "\""
			    + "data-opc_idmangos=\"" + ponerIdMangos + "\""
			    + "value=\"" + campo + "\">" + campo + "</option>"
		    );
		    contOpcElegida++;
		  }
                %>

              </select>
              <small id="nombreVarHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-precio">
              <label for="precio">Precio</label>
              <input class="form-control" type="number" step="0.01" id="precio"
                     form="linea-pedido" name="precio" value="" readonly required/>
              <small id="precioHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-cantidad">
              <label for="cantidad">Cantidad</label>
              <input class="form-control" type="number" step="0.01"
                     form="linea-pedido" name="cantidad"  id="cantidad" value="0.00"
                     onChange="calculaPrecioFinal()" required/>
              <small id="cantidadHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-precioTotal">
              <label for="precioTotal">Precio Total</label>
              <input class="form-control" type="text"
                     form="linea-pedido" id="precioTotal" name="precioTotal"  value="" readonly />
              <small id="precioTotalHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <!-- Botón Introduce Línea -->
            <div class="form-group form-group-boton">
              <a id="btn-insertar-linea" form="linea-pedido" class="btn btn-primary" href="">Insertar Línea</a>
            </div>
          </form>
        </div>
	<div class="cont_lineas_add">
	  <h4>Líneas Añadidas</h4>
	  <%
	    // Manipulación de ArrayList
	    ArrayList<Linea> conjLineas = new ArrayList();
	    conjLineas = (ArrayList<Linea>) request.getSession().getAttribute("conjLineas");

	    if (conjLineas != null) {
	      request.getSession().setAttribute("conjLineas", conjLineas);
	      out.println("<div class=\"contIntRows\">");
	      for (int i = 0; i < conjLineas.size(); i++) {
		out.println(
			"<div class=\"contRow\">"
			+ "<div class=\"form-control intRow-CDF\" readonly>"
			+ conjLineas.get(i).getNumFact() + "</div>"
			+ "<div class=\"form-control intRow-NF\" readonly>"
			+ conjLineas.get(i).getCodDetFact() + "</div>"
			+ "<div class=\"form-control intRow-IDM\" readonly>"
			+ conjLineas.get(i).getIdMangos() + "</div>"
			+ "<div class=\"form-control intRow-variedad\" readonly>"
			+ conjLineas.get(i).getVarMango() + "</div>"
			+ "<div class=\"form-control intRow-precio\" readonly>"
			+ conjLineas.get(i).getPrecio() + "</div>"
			+ "<div class=\"form-control intRow-cantidad\" readonly>"
			+ conjLineas.get(i).getCantidad() + "</div>"
			+ "<div class=\"form-control intRow-PT\" readonly>"
			+ conjLineas.get(i).getPrecioTotal() + "</div>"
			+ "<div class=\"intRow-btnElim\">"
			+ "<a class=\"btnElim\" href=\"../controlador/eliminarLineaPedido.jsp?eli_Linea=" + i
			+ "\">Eliminar</a></div>"
			+ "</div>"
		);
	      }
	      out.println("</div>");
	    }

	    // --------------------------------------
	    conexion_1.close();
	    /* Cierra Rellena */
	  %>
	</div>
      </div>
    </div>
  </div>

  <!-- footer -->
  <%@include file="../esquema/footer.jsp"%>
</body>
</html>