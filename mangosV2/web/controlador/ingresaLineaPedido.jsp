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
    <h1>Inserta Mangos</h1>
    <div>
      <%
	request.setCharacterEncoding("UTF-8");

	//-- Mantener el Usuario en la Inserción de Líneas
	if (operar.compVacio(request.getParameter("idComprador")) == false) {
	  int idCompUsado = (Integer.parseInt(request.getParameter("idComprador")));
	  out.print("idCompUsado = " + idCompUsado + "<br>");
	  request.getSession().setAttribute("idCompUsado", idCompUsado);
	}

	//-- ¿¿CREAR ALERTAS??
	//--Comprueba numFact-row
	if (request.getParameter("numFact-row") != null) {
	  out.print("numFact-row = " + Integer.parseInt(request.getParameter("numFact-row")) + "<br>");
	} else {
	  out.print("No hay número de factura<br>");
	}
	//--Comprueba idMangos
	if (request.getParameter("idMangos") != null) {
	  out.print("idMangos = " + Integer.parseInt(request.getParameter("idMangos")) + "<br>");
	} else {
	  out.print("No hay número de idMangos<br>");
	}
	//--Comprueba nombreVar2
	if (request.getParameter("nombreVar2") != null) {
	  out.print("nombreVar2 = " + request.getParameter("nombreVar2") + "<br>");
	} else {
	  out.print("No hay número de nombreVar2<br>");
	}
	//--Comprueba precio
	if (request.getParameter("precio") != null) {
	  out.print("precio = " + request.getParameter("precio") + "<br>");
	} else {
	  out.print("No hay número de precio<br>");
	}
	//--Comprueba precio
	if (request.getParameter("cantidad") != null) {
	  out.print("cantidad = " + request.getParameter("cantidad") + "<br>");
	} else {
	  out.print("No hay número de cantidad<br>");
	}
	//--Comprueba precioTotal
	if (request.getParameter("precioTotal") != null) {
	  out.print("precioTotal = " + request.getParameter("precioTotal") + "<br>");
	} else {
	  out.print("No hay número de precioTotal<br>");
	}
	//-- Ingresar Línea en Array List
	if (operar.compVacio(request.getParameter("numFact-row")) == false
		&& operar.compVacio(request.getParameter("codDetFact")) == false
		&& operar.compVacio(request.getParameter("idMangos")) == false
		&& operar.compVacio(request.getParameter("nombreVar2")) == false
		&& operar.compVacio(request.getParameter("precio")) == false
		&& operar.compVacio(request.getParameter("cantidad")) == false
		&& operar.compVacio(request.getParameter("precioTotal")) == false) {

	  Linea nuevaLinea = new Linea();
	  nuevaLinea.setNumFact(Integer.parseInt(request.getParameter("numFact-row")));
	  nuevaLinea.setCodDetFact(Integer.parseInt(request.getParameter("codDetFact")));
	  nuevaLinea.setIdMangos(Integer.parseInt(request.getParameter("idMangos")));
	  nuevaLinea.setVarMango(request.getParameter("nombreVar2"));
	  nuevaLinea.setPrecio(Float.parseFloat(request.getParameter("precio")));
	  nuevaLinea.setCantidad(Float.parseFloat(request.getParameter("cantidad")));
	  nuevaLinea.setPrecioTotal(Float.parseFloat(request.getParameter("precioTotal")));

	  //-- Comprueba NumFactUsado
	  Object NumFactUsado = request.getSession().getAttribute("NumFactUsado");
	  if (NumFactUsado == null) {
	    NumFactUsado = Integer.parseInt(request.getParameter("numFact-row"));
	    out.print("NumFactUsado = " + NumFactUsado + "<br>");
	  } else {
	    NumFactUsado = request.getSession().getAttribute("NumFactUsado");
	    out.print("NumFactUsado = " + NumFactUsado + "<br>");
	  }

	  //-- Comprueba ArrayList
	  ArrayList<Linea> conjLineas = new ArrayList();
	  conjLineas = (ArrayList<Linea>) request.getSession().getAttribute("conjLineas");
	  int ultNumLinea = Integer.parseInt(request.getParameter("codDetFact"));
	  //out.print(ultNumLinea);
	  if (conjLineas == null) {
	    //out.print("No hay líneas<br>");
	    ArrayList<Linea> nuevoConjLineas = new ArrayList();
	    nuevoConjLineas.add(nuevaLinea);
	    request.getSession().setAttribute("NumFactUsado", NumFactUsado);
	    request.getSession().setAttribute("conjLineas", nuevoConjLineas);
	    request.getSession().setAttribute("ultNumLinea", ultNumLinea);
	  } else {
	    conjLineas.add(nuevaLinea);
	    request.getSession().setAttribute("NumFactUsado", NumFactUsado);
	    request.getSession().setAttribute("conjLineas", conjLineas);
	    request.getSession().setAttribute("ultNumLinea", ultNumLinea);
	  }
	} else {
	  String alerta = "No se ha podido instroducir la fila, falta algún dato.";
	  request.getSession().setAttribute("alerta", alerta);
	}

	//-- Redirección y envío
	String redirectURL = "../vista/crearPedido.jsp";
	response.sendRedirect(redirectURL);
%>
    </div>
  </body>
</html>
