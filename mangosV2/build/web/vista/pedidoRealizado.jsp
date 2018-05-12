<%-- 
    Document   : pedidoRealizado
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

    <<%@include file="../esquema/librerias.jsp"%>

  </head>

  <body>
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
    %>
    <!-- Header -->
    <%@include file="../esquema/header.jsp"%>
    <!-- Menu Navegación -->
    <%@include file="../esquema/menuNavegacion.jsp"%>
    <h1>Pedido Realizado con exito</h1>
    <!-- footer -->
    <%@include file="../esquema/footer.jsp"%>
  </body>
</html>