<%-- 
    Document   : menuNavegacion
    Created on : 17-mar-2018, 14:00:49
    Author     : Ale Ruiz
--%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Ir a</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

      <!-- Botón Inicio Normal -->
      <li class="nav-item active">
        <a class="nav-link" href="../vista/home.jsp">Inicio <span class="sr-only">(current)</span></a>
      </li>

      <!-- Botón Inicio Enlace -->
      <li class="nav-item">
        <a class="nav-link" href="../vista/crearPedido.jsp">Realizar Pedido</a>
      </li>

      <!-- Botón con Subvotones -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Administración
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="../vista/formVariedad.jsp">Variedades</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="../vista/formComprador.jsp">Clientes</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="../vista/listaPedidos.jsp">Pedidos</a>
          <!--<div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Ver Pedidos</a>-->
        </div>
      </li>
      <!--<li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>-->
    </ul>
  </div>
</nav>
