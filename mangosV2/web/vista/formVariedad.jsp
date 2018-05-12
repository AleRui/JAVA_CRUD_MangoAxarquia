<%-- 
    Document   : formTiposMangos
    Created on : 12-mar-2018, 18:59:37
    Author     : Ale Ruiz
--%>

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

    <title>Mangos de la Axarquía</title>

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
      //-- Fin Borrado Sessión
      //-- Conexión a BBDD
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
      Statement consulta0 = conexion.createStatement();

      //-- Trae la ultima ID de Variedad de Mango
      int ultIdM = 0;
      ResultSet conjId = consulta0.executeQuery("SELECT MAX(idMangos) AS `ultIdM` FROM variedad");
      if (conjId != null) {
	while (conjId.next()) {
	  ultIdM = conjId.getInt("ultIdM") + 1;
	}
      } else {
	ultIdM = 101;
      }
    %>
    <div class="wrapper">
      <div class="cont-alerta">
	<%
	  // Muestra ALERTA
	  String alerta = (String) (request.getSession().getAttribute("alerta"));
	  if (operar.compVacio(alerta) == false) {
	    out.print(alerta);
	    alerta = "";
	    request.getSession().setAttribute("alerta", alerta);
	  }
	%>
      </div>
      <div class="container-fluid">
        <!-- Formulario Inserción Mangos -->
        <div class="row int_mangos">
          <h1>Introduzca Variedad de Mangos:</h1>
          <form class="form" method="GET" accept-charset="UTF-8" action="../controlador/ingresaVariedad.jsp">
            <div class="form-group form-group-idMangos">
              <label for="idMangos">ID Mango</label>
              <input class="form-control" id="idMangos" type="number"
                     name="idMangos" placeholder="ID" value="<%= ultIdM%>" required readonly/>
              <small id="idMangosHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-nombreVar">
              <label for="nombreVariedadMAngo">Nombre Variedad Mango</label>
              <input class="form-control" type="text"
                     name="nombreVar" placeholder="Nombre Variedad" required/>
              <small id="nombreVarHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-peso">
              <label for="peso">Peso</label>
              <input class="form-control" type="number" step="0.01"
                     name="peso"  placeholder="Kg." value="0.00"/>
              <small id="pesoHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-fechaIniAprox">
              <label for="fechaIniAprox">Disponible</label>
              <input class="form-control" type="date"
                     name="fechaIniAprox" placeholder="Fecha" required/>
              <small id="fechaIniAproxHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-precio">
              <label for="precio">Precio</label>
              <input class="form-control" type="number" step="0.01"
                     name="precio"  placeholder="€" required/>
              <small id="precioHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-stock">
              <label for="stock">stock</label>
              <input class="form-control" type="number" step="0.01"
                     name="stock"  placeholder="Kg." value="0.00"/>
              <small id="precioHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-boton">
              <button type="submit" class="btn btn-primary">Introducir</button>
            </div>
          </form>
        </div>

        <!-- Listado de Mangos -->

        <h4>Tipos de Mangos</h4>
        <table class="table table-striped">
          <thead class="thead-dark">
          <div class="table-titles">Títulos</div>
          </thead>
          <tr>
            <%
	      //-- Trae info de BD: Variedades de Mangos
	      ResultSet listado = consulta0.executeQuery("SELECT * FROM variedad ORDER BY idMangos");
	      int contForm = 1;

	      while (listado.next()) {
            %>
          </tr>
          <td>
            <form name="<%
	      String nameForm = "list-row-form-" + String.valueOf(contForm);
	      out.print(nameForm);
	      contForm++;
                  %>" 
                  id="<% out.print(nameForm);%>" 
                  accept-charset="UTF-8" method="GET" action="" class="prueba">

              <!-- Campos Fila Lista Formulario -->
              <div class="row-list-idMangos">
                <input id="idMangos-list" class="form-control input-list-form-idMangos" type="text"
                       name="idMangos" value="<%= listado.getInt("idMangos")%>" readonly>
              </div>
              <div class="row-list-nombreVar">
                <input id="nombreVar-list" class="form-control input-list-form-nombreVar" type="text"
                       name="nombreVar" value="<%= listado.getString("nombreVar")%>">
              </div>
              <div class="row-list-peso">
                <input id="peso-list" class="form-control input-list-form-peso" type="number" step="0.01"
                       name="peso" value="<%= listado.getFloat("peso")%>">
              </div>
              <div class="row-list-fechaIniAprox">
                <input id="fechaIniAprox-list" class="form-control input-list-form-fechaIniAprox" type="date"
                       name="fechaIniAprox" value="<%= listado.getDate("fechaIniAprox")%>">
              </div>
              <div class="row-list-precio">
                <input id="precio-list" class="form-control input-list-form-precio" type="number" step="0.01"
                       name="precio" value="<%= listado.getFloat("precio")%>">
              </div>
              <div class="row-list">
                <input id="stock-list" class="form-control input-list-form-boton" type="number" step="0.01"
                       name="stock" value="<%= listado.getFloat("stock")%>">
              </div>
              <div class="row-list-btn">
                <!-- Botones Formulario -->
                <button type="submit" class="btn btn-primary" data-act="<% out.print(nameForm); %>"
                        onclick="modif(this.getAttribute('data-act'))">Modificar</button>
              </div>
              <div class="row-list-btn">
                <button type="submit" class="btn btn-primary "  data-act="<% out.print(nameForm); %>"
                        onclick="elim(this.getAttribute('data-act'))">Eliminar</button>
              </div>
            </form>
            <%
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