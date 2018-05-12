<%-- 
    Document   : eliminarPedido
    Created on : 11-may-2018, 12:02:45
    Author     : Solbyte
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
    <title>Eliminar Pedido</title>
  </head>
  <body>
    <h1>Elimina Línea de Pedido</h1>
    <div>
      <%
        out.print("Eliminar Pedido<br>");
        
        //-- Trae ID del pedido a eliminar
        int numFact = Integer.parseInt(request.getParameter("numFact") );
        out.print("Número de Factura a Borrar:"+numFact+"<br>");
        
        //-- BORRADO Establecer conexcion con BD
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
        Statement s = conexion.createStatement();
        request.setCharacterEncoding("UTF-8");
        
        //-- Borrar líneas de factura del pedido
        String borrarLíneas = "DELETE FROM det_fact WHERE numFact = " + numFact;
        s.execute(borrarLíneas);
        
        //-- Borrar factura 
        String borrarFact = "DELETE FROM factura WHERE numFact = " + numFact;
        s.execute(borrarFact);
        
        //-- Redirigir a Lineas de Pedido
        String redirectURL = "../vista/listaPedidos.jsp";
        response.sendRedirect(redirectURL);
      %>
    </div>
  </body>
</html>
