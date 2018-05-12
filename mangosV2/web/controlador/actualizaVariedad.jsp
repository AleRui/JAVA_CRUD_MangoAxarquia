<%-- 
    Document   : actualizaTipos
    Created on : 14-mar-2018, 18:55:37
    Author     : Ale Ruiz
--%>

<%--  IMPORTAR Librerias --%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insertar Tipo de Mango</title>
  </head>
  <body>
    <h1>Insertar Tipo de Mango</h1>
    <div>
    <%
      request.setCharacterEncoding("UTF-8");
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
      Statement s = conexion.createStatement();

      //request.setCharacterEncoding("UTF-8");
      String insercion = "UPDATE variedad SET "
	      + "nombreVar = " + "'" + request.getParameter("nombreVar") + "', "
	      + "peso = " + Float.valueOf(request.getParameter("peso")) + ", "
	      + "fechaIniAprox = " + "'" + java.sql.Date.valueOf(request.getParameter("fechaIniAprox")) + "', "
	      + "precio = " + Float.valueOf(request.getParameter("precio")) + ", "
	      + "stock = " + Float.valueOf(request.getParameter("stock")) +
	      " WHERE idMANGOS = "+request.getParameter("idMangos");
      out.println(insercion);
      s.execute(insercion);
      String redirectURL = "../vista/formVariedad.jsp";
      conexion.close();
      response.sendRedirect(redirectURL);
    %>
    </div>
  </body>
</html>
