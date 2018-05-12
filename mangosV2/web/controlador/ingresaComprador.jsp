<%-- 
    Document   : ingresComprador
    Created on : 12-mar-2018, 12:37:47
    Author     : Alejandro Ruiz
--%>

<%--  IMPORTAR Librerias --%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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

    <title>Inserta Variedad de Mango</title>
  </head>
  <body>
    <h1>Inserta Variedad de Mango</h1>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
      Statement s = conexion.createStatement();
      //Recoge los parametros de envio de la URL
      request.setCharacterEncoding("UTF-8");
      //Prepara la sentencia SQL de inserción
      //out.print(Integer.valueOf(request.getParameter("idMangos"))+"<br>");
      //out.print(request.getParameter("nombreVar")+"<br>");
      //out.print(Float.valueOf(request.getParameter("peso"))+"<br>");
      //out.print(java.sql.Date.valueOf(request.getParameter("fechaIniAprox"))+"<br>");
      //out.print(Float.valueOf(request.getParameter("precio"))+"<br>");
      //out.print(Float.valueOf(request.getParameter("stock"))+"<br>");
      String insercion = "INSERT INTO comprador VALUES( "
	      + Integer.valueOf(request.getParameter("idComprador")) + ", "
	      + "'" + request.getParameter("nombreComp") + "', "
	      + "'" + request.getParameter("NIFComp") + "', "
	      + "'" + request.getParameter("tipoComp") + "', "
	      + "'" + request.getParameter("dirEnvioComp") + "', "
	      + "'" + request.getParameter("emailComp") + "', "
	      + "'" + request.getParameter("tlfComp") + "' )"
	      ;
      out.println(insercion);
      
      String redirectURL = "../vista/formComprador.jsp";
      s.execute(insercion);
      conexion.close();
      response.sendRedirect(redirectURL);
    %>
  </body>
</html>

