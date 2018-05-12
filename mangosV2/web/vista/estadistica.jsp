<%-- 
    Document   : estadistica
    Created on : 12-mar-2018, 12:37:47
    Author     : Alejandro Ruiz
--%>

<%--  IMPORTAR Librerias --%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- Fecha --%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

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
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion_1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
      
      //Consulta 0 Número de Factura
      Statement con0 = conexion_1.createStatement();
      ResultSet consultaComprador = con0.executeQuery(
	      "SELECT nombreComp FROM comprador"
      );
      Statement con1 = conexion_1.createStatement();
      ResultSet consultaVariedades = con1.executeQuery(
	      "SELECT nombreVar FROM variedad"
      );
      //-- Creación de HasMap Compradores
      int contLC = 1;
      HashMap<Integer, String> listaCompradores = new HashMap();
      while (consultaComprador.next()) {
	String compadror = consultaComprador.getString("nombreComp");
	listaCompradores.put(contLC, compadror);
	contLC++;
      }
      //-- Creación de HasMap Variedades
      int contLV = 1;
      HashMap<Integer, String> listaVariedades = new HashMap();
      while (consultaVariedades.next()) {
	String variedad = consultaVariedades.getString("nombreVar");
	listaVariedades.put(contLV, variedad);
	contLV++;
      }
      //-- Cerrar Conexión 
      conexion_1.close();
    %>
    <!-- Header -->
    <%@include file="../esquema/header.jsp"%>
    <!-- Menu Navegación -->
    <%@include file="../esquema/menuNavegacion.jsp"%>
    <!-- MAIN-->
    <div class="wrapper">
      <h1>Estadística</h1>
      <div class="cont-lista">
	<ul class="lista">
	  <h4>Compradores</h4>
	  <%
	    for (Map.Entry pareja : listaCompradores.entrySet()) {
	      out.print("<li>");
	      out.print(pareja.getKey() + "\t");
	      out.println(pareja.getValue());
	      out.print("</li>");
	    }
	  %>
	</ul>
      </div>
      <div class="cont-lista">
	<ul class="lista">
	  <h4>Variedades de Mango</h4>
	  <%
	    for (Map.Entry pareja2 : listaVariedades.entrySet()) {
	      out.print("<li>");
	      out.print(pareja2.getKey() + "\t");
	      out.println(pareja2.getValue());
	      out.print("</li>");
	    }
	  %>
	</ul>
      </div>
    </div>
    <!-- footer -->
    <%@include file="../esquema/footer.jsp"%>
  </body>
</html>
