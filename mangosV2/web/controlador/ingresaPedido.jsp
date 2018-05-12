<%-- 
    Document   : ingresPedido
    Created on : 12-mar-2018, 12:37:47
    Author     : Alejandro Ruiz
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
<html class="no-js" lang="en"> <!--<![endif]-->
  <head>
    <!-- Global Metas -->
    <meta charset="utf-8">
    <meta name="description" content="MangoAxarquía">
    <meta name="author" content="Alejandro Ruiz">
    <meta name="keywords" content="mango, axarquia">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>Inserta Variedad Mango</title>
  </head>
  <body>
    <h1>Inserta Variedad Mango</h1>
    <%
      String alerta = "";
      //Valida que tenga idComprador
      ArrayList<Linea> CompLineas = new ArrayList();
      CompLineas = (ArrayList<Linea>) request.getSession().getAttribute("conjLineas");
      boolean pedidoCorrecto = false;
      /* Validación de Pedido */
      if (request.getParameter("idComprador") != null && !request.getParameter("idComprador").isEmpty()) {
	pedidoCorrecto = true;
      } else {
	pedidoCorrecto = false;
	alerta = "Debe especificar comprador";
      }
      if (CompLineas != null && CompLineas.size() > 0) {
	out.print("Tamaño ComLineas=" + CompLineas.size() + "<br>");
	pedidoCorrecto = true;
      } else {
	out.print("No hay Líneas<br>");
	pedidoCorrecto = false;
	alerta = "No se ha podido instroducir el pedido, no hay líneas de pedido";
	request.getSession().setAttribute("alerta", alerta);
      }
      out.print("pedidoCorrecto=" + pedidoCorrecto);

      if (pedidoCorrecto == true) {
	out.print("Con IdComprador<br>");
	out.print(Integer.valueOf(request.getParameter("idComprador")) + "<br>");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
	Statement s = conexion.createStatement();
	//Recoge los parametros de envio de la URL
	request.setCharacterEncoding("UTF-8");

	/* -- Insertar Factura -- */
	String insercion1 = "INSERT INTO factura "
		+ "(numFact, fechaFact, idComprador)"
		+ " VALUES ( "
		+ Integer.valueOf(request.getParameter("numFact")) + ", "
		+ "'" + request.getParameter("fechaFact") + "', "
		+ request.getParameter("idComprador") + ");";
	out.println(insercion1);

	/* -- Insertar Líneas de Factura -- */
	ArrayList<Linea> conjLineas = new ArrayList();
	conjLineas = (ArrayList<Linea>) request.getSession().getAttribute("conjLineas");
	String insercion2 = "";
	if (conjLineas != null) {
	  request.getSession().setAttribute("conjLineas", conjLineas);

	  out.print("<div>");
	  insercion2 = "INSERT INTO det_fact "
		  + "(codDetFact, idMangos, numFact, cantidad, precio)"
		  + " VALUES ";
	  for (int i = 0; i < conjLineas.size(); i++) {
	    insercion2 += "( ";
	    insercion2 += conjLineas.get(i).getCodDetFact() + ", ";
	    insercion2 += conjLineas.get(i).getIdMangos() + ", ";
	    insercion2 += conjLineas.get(i).getNumFact() + ", ";
	    insercion2 += conjLineas.get(i).getCantidad() + ", ";
	    insercion2 += conjLineas.get(i).getPrecio();
	    if ((conjLineas.size() - 1) != i) {
	      insercion2 += " ), ";
	    } else {
	      insercion2 += " )";
	    }
	  }
	  insercion2 += ";";
	  out.println(insercion2);
	  out.println("</div>");
	}
	//-- Primero debe de crear la factura
	s.execute(insercion1);

	//-- Una vez creadala factura, introducir filas
	s.execute(insercion2);

	//-- Borra las variables de crearPedido de Session
	Object idCompUsado = request.getSession().getAttribute("idComprador");
	if (idCompUsado != null) {
	  request.getSession().removeAttribute("idComprador");
	}
	Object NumFactUsado = request.getSession().getAttribute("NumFactUsado");
	if (NumFactUsado != null) {
	  request.getSession().removeAttribute("NumFactUsado");
	}
	Object ultNumLinea = request.getSession().getAttribute("ultNumLinea");
	if (ultNumLinea != null) {
	  request.getSession().removeAttribute("ultNumLinea");
	}
	if (conjLineas != null) {
	  out.print("El conjLineas en uso es: " + conjLineas + "<br>");
	  request.getSession().removeAttribute("conjLineas");
	}

	//-- Redirecciona a Pedido Realziado
	String redirectURL = "../vista/listaPedidos.jsp";
	out.print(redirectURL);
	response.sendRedirect(redirectURL);

      } else {
	out.print("Sin IdComprador<br>");
	if (alerta != "") {
	  request.getSession().setAttribute("alerta", alerta);
	}
	String redirectURL = "../vista/crearPedido.jsp";
	out.print(redirectURL);
	response.sendRedirect(redirectURL);
      }
    %>
  </body>
</html>

