<%-- 
    Document   : ingresTipos
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
      if (operar.compVacio(request.getParameter("idMangos")) == false
              && operar.compVacio(request.getParameter("nombreVar")) == false
              && operar.compVacio(request.getParameter("fechaIniAprox")) == false
              && operar.compVacio(request.getParameter("precio")) == false
              && operar.compVacio(request.getParameter("stock")) == false) {
        out.print("Viene bien");
        
        //-- Conexión BBDD
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
        Statement s = conexion.createStatement();
        //Recoge los parametros de envio de la URL
        request.setCharacterEncoding("UTF-8");
        
        //-- Formato de FLOAT cambiar punto por coma
        

        //-- Inserta la variedad en BD
        String insercion = "INSERT INTO variedad VALUES("
                + Integer.valueOf(request.getParameter("idMangos")) + ", "
                + "'" + request.getParameter("nombreVar") + "', "
                + Float.valueOf(request.getParameter("peso")) + ", "
                + "'" + java.sql.Date.valueOf(request.getParameter("fechaIniAprox")) + "', "
                + Float.valueOf(request.getParameter("precio")) + ","
                + Float.valueOf(request.getParameter("stock")) + " )";
        out.println(insercion);

        String redirectURL = "../vista/formVariedad.jsp";
        s.execute(insercion);
        conexion.close();
        response.sendRedirect(redirectURL);
      } else {
        String alerta = "No se ha podido instroducir la Variedad";
        request.getSession().setAttribute("alerta", alerta);
        String redirectURL = "../vista/formVariedad.jsp";
        response.sendRedirect(redirectURL);
      }
    %>
  </body>
</html>
