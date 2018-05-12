<%-- 
    Document   : eliminaTipos
    Created on : 14-mar-2018, 18:55:37
    Author     : Ale Ruiz
--%>

<%--  IMPORTAR Librerias --%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%-- IMPORTAR Mis Objetos --%>
<%@ page import="mangoObjetos.Linea" %>

<%-- IMPORTAR Mis Funciones --%>
<%@ page import="mangoFunciones.operar" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Elimina Variedad de Mangos</title>
  </head>
  <body>
    <h1>Elimina Variedad de Mangos</h1>
    <%
      request.setCharacterEncoding("UTF-8");
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
      Statement s = conexion.createStatement();
      //-- Pregunta si la variedad a borrar está en una línea de pedido
      int idMango = Integer.parseInt(request.getParameter("idMangos"));
      out.print("idMango = " + idMango + "<br>");
      ResultSet consultaIDs = s.executeQuery("SELECT numFact FROM det_fact WHERE idMangos = " + idMango);
      out.print("consultaIDs = " + consultaIDs + "<br>");
      //-- Pregunta si el ResultSet viene vacio
      boolean consultaIDsVacio = true;
      while (consultaIDs.next()) {
	consultaIDsVacio = false;
      }
      out.print("consultaIDaVacio = "+consultaIDsVacio+"<br>");

      if (consultaIDsVacio == false) {
	String alerta = "Hay lineas de factura con esta variedad, no se puede borrar";
	request.getSession().setAttribute("alerta", alerta);
	out.print(alerta);
	String redirectURL = "../vista/formVariedad.jsp";
	conexion.close();
	//response.sendRedirect(redirectURL);
      } else {
	//--Borrado de la BD
	request.setCharacterEncoding("UTF-8");
	String borrar = "DELETE FROM variedad WHERE idMangos = " + idMango;
	out.println(borrar);
	s.execute(borrar);
	conexion.close();

	//-- Redirección
	String redirectURL = "../vista/formVariedad.jsp";
	response.sendRedirect(redirectURL);
      }
    %>
  </body>
</html>
