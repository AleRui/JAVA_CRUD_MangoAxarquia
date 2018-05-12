<%-- 
    Document   : listaPedidos
    Created on : 08-may-2018, 13:06:55
    Author     : Solbyte
--%>

<%@page import="mangoObjetos.PedidoRealizado"%>
<%--  IMPORTAR Librerias --%>
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

    <title>Lista de Pedido</title>

    <%@include file="../esquema/librerias.jsp"%>

  </head>

  <body>
    <!-- Header -->
    <%@include file="../esquema/header.jsp"%>
    <!-- Menu Navegación -->
    <%@include file="../esquema/menuNavegacion.jsp"%>

    <!-- Contenido Página -->
    <%
      //-- Borra las variables de crearPedido de Session
      Object idCompUsado = request.getSession().getAttribute("idCompUsado");
      if (idCompUsado != null) {
	request.getSession().removeAttribute("idCompUsado");
      }
      Object NumFactUsado = request.getSession().getAttribute("NumFactUsado");
      if (NumFactUsado != null) {
	request.getSession().removeAttribute("NumFactUsado");
      }
      Object ultNumLinea = request.getSession().getAttribute("ultNumLinea");
      if (ultNumLinea != null) {
	request.getSession().removeAttribute("ultNumLinea");
      }
      Object conjLineas = request.getSession().getAttribute("conjLineas");
      if (conjLineas != null) {
	request.getSession().removeAttribute("conjLineas");
      }

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
      /*Modificado por Ale*/
      Statement consulta0 = conexion.createStatement();
    %>

    <!-- Listado de MAngos -->
    <div class="wrapper">
      <h4>Listado de Pedidos</h4>
      <div class="cont-alerta">
        <%        // Muestra ALERTA
	  String alerta = (String) (request.getSession().getAttribute("alerta"));
	  if (operar.compVacio(alerta) == false) {
	    out.print(alerta);
	    alerta = "";
	    request.getSession().setAttribute("alerta", alerta);
	  }
        %>
      </div>
      <!-- Tabla Pedido -->
      <table class="table table-striped">
        <thead class="thead-dark">
        <div class="table-titles">Títulos</div>
        </thead>
        <tr>
          <%              //-- Listado de Clientes
	    Statement consulta1 = conexion.createStatement();
	    ResultSet conjFacts = consulta1.executeQuery(
		    "SELECT f.`numFact`, c.`nombreComp`, f.`fechaFact`, T2.`Precio_Total`  FROM factura f"
		    + "  LEFT JOIN comprador c ON f.`idComprador`=c.`idComprador`"
		    + "  LEFT JOIN ("
		    + "    SELECT numFact, SUM(precio*cantidad) AS 'Precio_Total' FROM det_fact"
		    + "    GROUP BY numFact"
		    + "    ) T2 ON f.`numFact` = T2.numFact"
	    );
	    if (conjFacts != null) {
	      while (conjFacts.next()) {
          %>
        </tr>
        <td>
          <form name="list_ped-<%=conjFacts.getInt("numFact")%>" id="list_ped-<%=conjFacts.getInt("numFact")%>"
                accept-charset="UTF-8" method="GET" action="" class="list_ped">

            <!-- Campos Fila Lista Formulario -->
            <div class="row-list-numFact">
              <input form="list_ped-<%=conjFacts.getInt("numFact")%>" id="numFact" class="form-control input-list-form-numFact" type="number"
                     name="numFact" value="<%= conjFacts.getInt("numFact")%>" readonly>
            </div>
            <div class="row-list-nombreComp">
              <input form="list_ped-<%=conjFacts.getInt("numFact")%>" id="nombreComp" class="form-control input-list-form-numFact" type="text"
                     name="nombreComp" value="<%= conjFacts.getString("nombreComp")%>" readonly>
            </div>
            <div class="row-list-fechaFact">
              <input form="list_ped-<%=conjFacts.getInt("numFact")%>" id="fechaFact" class="form-control input-list-form-fechaFact" type="text"
                     name="fechaFact" value="<%= conjFacts.getString("fechaFact")%>" readonly>
            </div>
            <div class="row-list-precioTot">
              <input form="list_ped-<%=conjFacts.getInt("numFact")%>" id="precioTot" class="form-control input-list-form-precioTot" type="number" step="0.01"
                     name="list_ped-<%=conjFacts.getInt("numFact")%>" value="<%= conjFacts.getFloat("Precio_Total")%>"" readonly>
            </div>
            <!-- Botones Formulario -->
            <!--<button type="submit" class="btn btn-primary" data-act=""
                    onclick="">Modificar</button>
            </div>-->
            <div class="row-list-btn">
              <button form="list_ped-<%=conjFacts.getInt("numFact")%>" type="submit" class="btn btn-primary "  data-act=""
                      onclick="elimPedido(this)">Eliminar</button>
            </div>
          </form>
          <%
	      }
	    }

	    conexion.close();
          %>
        </td>
        </tr>
      </table>

    </div>
  </div>

  <!-- footer -->
  <%@include file="../esquema/footer.jsp"%>
</body>
</html>
