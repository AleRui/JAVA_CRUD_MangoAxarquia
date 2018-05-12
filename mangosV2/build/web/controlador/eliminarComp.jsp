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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Comprador</title>
  </head>
  <body>
    <h1>Elimina Comprador</h1>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mangos", "root", "root");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      //-- Pregunta si la variedad a borrar está en una línea de pedido
      int idComprador = Integer.parseInt(request.getParameter("idComprador"));
      ResultSet consultaIDs = s.executeQuery("SELECT idComprador FROM factura WHERE idComprador = " + idComprador);
      //-- Pregunta si el ResultSet viene vacio
      boolean consultaIDsVacio = true;
      while (consultaIDs.next()) {
	consultaIDsVacio = false;
      }
      out.print("consultaIDaVacio = "+consultaIDsVacio+"<br>");
      
      if (consultaIDsVacio == false) {
        String alerta = "Hay lineas de factura con este comprador, no se puede borrar";
        request.getSession().setAttribute("alerta", alerta);
        out.print(alerta);
        String redirectURL = "../vista/formComprador.jsp";
        conexion.close();
        response.sendRedirect(redirectURL);
      } else {
        request.setCharacterEncoding("UTF-8");
        String borrar = "DELETE FROM comprador WHERE idComprador = " + idComprador;
        out.println(borrar);
        String redirectURL = "../vista/formComprador.jsp";
        s.execute(borrar);
        conexion.close();
        response.sendRedirect(redirectURL);
      }
    %>
  </body>
</html>
