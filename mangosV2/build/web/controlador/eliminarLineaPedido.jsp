<%-- 
    Document   : eliminaLineaPedido
    Created on : 03-may-2018, 18:55:37
    Author     : Ale Ruiz
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
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insertar Línea de Pedido</title>
  </head>
  <body>
    <h1>Elimina Línea de Pedido</h1>
    <div>
      <%
        request.setCharacterEncoding("UTF-8");
        
        int numFila = Integer.parseInt(request.getParameter("eli_Linea") );
        out.print(numFila);
        ArrayList<Linea> conjLineas_Mod = new ArrayList();
        conjLineas_Mod = (ArrayList<Linea>) request.getSession().getAttribute("conjLineas");
        conjLineas_Mod.remove(numFila);
        request.getSession().setAttribute("conjLineas", conjLineas_Mod);
        
        /* -- Redirección -- */
        String redirectURL = "../vista/crearPedido.jsp";
        response.sendRedirect(redirectURL);
      %>
    </div>
  </body>
</html>
