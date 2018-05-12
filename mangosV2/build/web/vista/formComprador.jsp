<%-- 
    Document   : introducriClientes
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

  <!-- Global Metas -->
  <meta charset="utf-8">
  <meta name="description" content="MangoAxarquía">
  <meta name="author" content="Alejandro Ruiz">
  <meta name="keywords" content="mango, axarquia">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>Mangos de la Axarquía</title>

  <%@include file="../esquema/librerias.jsp"%>



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

      //-- Trae la ultima ID de Comprador
      int ultIdComp = 0;
      ResultSet conjId = consulta0.executeQuery("SELECT MAX(idComprador) AS `ultIdComp` FROM comprador");
      if (conjId != null) {
	while (conjId.next()) {
	  ultIdComp = conjId.getInt("ultIdComp") + 1;
	}
      } else {
	ultIdComp = 1;
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
        <!-- Formulario Inserción Clientes -->
        <div class="row int_mangos">
          <h1>Introduzca Clientes:</h1>
          <form id="form_comp" class="form" method="GET" accept-charset="UTF-8"
                onsubmit="return valFormComp(this)" action="../controlador/ingresaComprador.jsp">
            <div class="form-group form-group-idComprador">
              <label for="idComprador">ID Cliente</label>
              <input class="form-control" id="idComprador" type="number"
                     name="idComprador"  value="<%= ultIdComp%>" placeholder="ID" required readonly/>
              <small id="idCompradorHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-nombreComp">
              <label for="nombreComp">Nombre</label>
              <input class="form-control" type="text"
                     name="nombreComp" placeholder="Nombre Variedad" required/>
              <small id="nombreCompHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-NIFComp">
              <label for="NIFComp">NIF/CIF</label>
              <input id="NIFComp" class="form-control" type="text"
                     name="NIFComp"  placeholder="########X" required>
              <small id="NIFCompHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-tipoComp">
              <!-- Cambiar a Select -->
              <label for="nombreComp">Figura</label>
              <select form="form_comp" class="form-control" name="tipoComp"
                      id="tipoComp">
                <option id="opcionElegida" class="opcion-select">Elegir Usuario</option>
                <option id="opcionElegida" class="opcion-select" value="Particular">Persona</option>
                <option id="opcionElegida" class="opcion-select" value="Empresa">Empresa</option>
              </select>
              <small id="tipoCompHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-dirEnvioComp">
              <label for="dirEnvioComp">Dirección de Envío</label>
              <input class="form-control" type="text"
                     name="dirEnvioComp"  placeholder="Calle, portal, número, población..." />
              <small id="dirEnvioCompHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-emailComp">
              <label for="emailComp">Email</label>
              <input class="form-control" type="text"
                     name="emailComp"  placeholder="email@email.com" required/>
              <small id="dirEnvioCompHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-tlfComp">
              <label for="tlfComp">Teléfono</label>
              <input class="form-control" type="tel"
                     name="tlfComp"  placeholder="#########" required/>
              <small id="tlfCompHelp" class="form-text text-muted">Cuidado.</small>
            </div>
            <div class="form-group form-group-boton">
              <button type="submit" class="btn btn-primary">Introducir</button>
            </div>
          </form>
        </div>

        <!-- Listado de MAngos -->

        <h4>Tipos de Mangos</h4>
        <table class="table table-striped">
          <thead class="thead-dark">
          <div class="table-titles">Títulos</div>
          </thead>
          <tr>
            <%
	      //-- Listado de Clientes
	      Statement consulta1 = conexion.createStatement();
	      ResultSet listado = consulta1.executeQuery("SELECT * FROM comprador ORDER BY idComprador");

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
                  accept-charset="UTF-8" method="GET" action="" class="prueba"
		  onsubmit="return valFormComp(this)" >

              <!-- Campos Fila Lista Formulario -->
              <div class="row-list-idComprador">
                <input id="idComprador-list" class="form-control input-list-form-idComprador" type="text"
                       name="idComprador" value="<%= listado.getInt("idComprador")%>" readonly>
              </div>
              <div class="row-list-nombreComp">
                <input id="nombreComp-list" class="form-control input-list-form-nombreComp" type="text"
                       name="nombreComp" value="<%= listado.getString("nombreComp")%>">
              </div>
              <div class="row-list-NIFComp">
                <input id="NIFComp-list" class="form-control input-list-form-NIFComp" type="text"
                       name="NIFComp" value="<%= listado.getString("NIFComp")%>">
              </div>
              <div class="row-list-tipoComp">
                <input id="tipoComp-list" class="form-control input-list-form-tipoComp" type="text"
                       name="tipoComp" value="<%= listado.getString("tipoComp")%>">
              </div>
              <div class="row-list-dirEnvioComp">
                <input id="dirEnvioComp-list" class="form-control input-list-form-dirEnvioComp" type="text"
                       name="dirEnvioComp" value="<%= listado.getString("dirEnvioComp")%>">
              </div>
              <div class="row-list-email">
                <input id="emailComp-list" class="form-control input-list-form-boton" type="text"
                       name="emailComp" value="<%= listado.getString("emailComp")%>">
              </div>
              <div class="row-list-tlfComp">
                <input id="tlfComp-list" class="form-control input-list-form-boton" type="tel"
                       name="tlfComp" value="<%= listado.getString("tlfComp")%>">
              </div>
              <div class="row-list-btn">
                <!-- Botones Formulario -->
                <button type="submit" class="btn btn-primary" data-act="<% out.print(nameForm); %>"
                        onclick="modifComp(this.getAttribute('data-act'))">Modificar</button>
              </div>
              <div class="row-list-btn">
                <button type="submit" class="btn btn-primary "  data-act="<% out.print(nameForm); %>"
                        onclick="elimComp(this.getAttribute('data-act'))">Eliminar</button>
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