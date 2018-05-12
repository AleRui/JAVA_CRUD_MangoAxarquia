<%-- 
    Document   : home
    Created on : 09-may-2018, 12:03:44
    Author     : Solbyte
--%>

<%-- Importa todo dentro de Util --%>
<%@ page import="java.util.*" %>

<%-- Fecha --%>
<%@ page import="java.text.SimpleDateFormat"%>

<%-- IMPORTAR Mis Objetos --%>
<%@ page import="mangoObjetos.Linea" %>

<%-- IMPORTAR Mis Funciones --%>
<%@ page import="mangoFunciones.operar" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
  <head>

    <!-- Global Metas -->
    <meta charset="utf-8">
    <meta name="description" content="MangoAxarquía">
    <meta name="author" content="Alejandro Ruiz">
    <meta name="keywords" content="mango, axarquia">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>Mangos de la Axarquía</title>

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <%@include file="../esquema/librerias.jsp"%>
  </head>
  <body>
    <header class="header-index">
      <!-- Redes Sociales -->
      <div class="menu-rs">
        <a href="#"><img class="ico-rs" src="../ima/ico_fb.svg" alt="Facebook"></a>
        <a href="#"><img class="ico-rs" src="../ima/ico_tw.svg" alt="Twiter"></a>
        <a href="#"><img class="ico-rs" src="../ima/ico_in.svg" alt="Insagram"></a>
      </div>

      <!-- Slider de fotos -->
      <div class="cont-slider cont-slider-display" onload="mostrar_divs()">
        <img class="foto_slider" src="../ima/ima04.jpg" alt="Foto de Campo con Mangos 04">
        <img class="foto_slider" src="../ima/ima02.jpg" alt="Foto de Campo con Mangos 02">
        <img class="foto_slider" src="../ima/ima03.jpg" alt="Foto de Campo con Mangos 03">
        <img class="foto_slider" src="../ima/ima01.jpg" alt="Foto de Campo con Mangos 01">
        <img class="foto_slider" src="../ima/ima05.jpg" alt="Foto de Campo con Mangos 05">

        <button class="boton-sld btn-negro btn-slider-izq" onclick="plusDivs(-1)">&#10094;</button>
        <button class="boton-sld btn-negro btn-slider-der" onclick="plusDivs(1)">&#10095;</button>
      </div>

      <!-- Logo -->
      <div class="cont-logo">
        <div class="marco-logo">
          <img class="logo" src="../ima/logo_mangoAxarquia.png" alt="Logo MangoAxarquía">
        </div>
      </div>

      <!-- Menú de Navegación -->
    </header>

    <!-- Menu Navegación -->
    <div class="cont-navbar-mangos">
      <%@include file="../esquema/menuNavegacion.jsp"%>
    </div>

    <!-- Info Principal -->
    <div class="main">
      <div class="wrapper">
	<div class="cont-alerta">
	  <%
	    // Muestra ALERTA
	    String alerta = (String) (request.getSession().getAttribute("alerta"));
	    if (operar.compVacio(alerta) == false) {
	      out.print(alerta);
	      alerta = "";
	      request.getSession().setAttribute("alerta", alerta);
	    }
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
	</div>
        <section>
          <article class="zonaPrincipal">
            <a href="../vista/formVariedad.jsp">
              <img class="ima_main_01" src="../ima/ima_main_02.jpg" alt="Imagen Cultivo Mango">
              <h4>Insertar Variedad de Mangos</h4>
              <p>Podrá gestionar una amplia variedad de mangos entre las que destacan:
                Tomy Atkins, Osteen, Palmer, Kent, Keitt...</p>
            </a>
          </article>
          <article class="zonaPrincipal">
            <a href="../vista/formComprador.jsp">
              <img class="ima_main_01" src="../ima/ima_main_04.jpg" alt="Gastronomía del Mango">
              <h4>Zona de gestión de clientes</h4>
              <p> Podrá dar de altas nuevos clientes.</p>
            </a>
          </article>
          <article class="zonaPrincipal">
            <a href="../vista/crearPedido.jsp">
              <img class="ima_main_02" src="../ima/ima_main_01.jpg" alt="Vareidades dew Mango">
              <h4>Realizar Pedido</h4>
              <p>Podrá realizar un pedido de mangos
              </p>
            </a>
          </article>
        </section>
      </div>
    </div>
    <!-- Final Main -->

    <!-- footer -->
    <%@include file="../esquema/footer.jsp"%>

    <!-- Script Slider -->
    <script>
      var slideIndex = 1;
      mostrar_divs(slideIndex);

      function plusDivs(n) {
	mostrar_divs(slideIndex += n);
      }

      function mostrar_divs(n) {
	console.log('Funcionando mostrar_divs');
	var i;
	var x = document.getElementsByClassName("foto_slider");
	if (n > x.length) {
	  slideIndex = 1;
	}
	if (n < 1) {
	  slideIndex = x.length;
	}
	for (i = 0; i < x.length; i++) {
	  x[i].style.display = "none";
	}
	x[slideIndex - 1].style.display = "block";
      }
    </script>
  </body>
</html>
