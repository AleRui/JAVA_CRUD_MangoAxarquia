/*
 * Javascript Web Mangos de la Axarquía
 * Author: Ale Ruiz;
 *
 */

/* Al cargar la página poner comprador si hay */
window.onload = function () {
  var pagina = $(location).attr('pathname');
  if (pagina === '/mangosV2/vista/crearPedido.jsp') {
    console.log('Página: crearPedido');
    console.log(pagina);
    console.log("Poniendo usuario");
    var idCompUsado = document.getElementById("nombreComp").getAttribute("data-opc_idComprador").trim();
    if (idCompUsado) {
      console.log("idCompUsado NO es null");
      console.log("idCompUsado = " + idCompUsado);
      document.getElementById("opcionElegida-" + idCompUsado).selected = true;
      ponerComprador();
    } else {
      console.log("idCompUsado es null");
    }
  } else {
    console.log('Otra Página');
  }
};

/* Variedad */
function modif(nameForm)
{
  console.log("Funcionando modif");
  document.getElementById(nameForm).setAttribute("action", "../controlador/actualizaVariedad.jsp");
}

function elim(nameForm)
{
  console.log("Funcionando elim");
  var r = confirm("Estás seguro que desea aliminar la variedad");
  if (r === true) {
    document.getElementById(nameForm).setAttribute("action", "../controlador/eliminarVariedad.jsp");
  }
}

/* Comprador */
function modifComp(nameForm)
{
  console.log("Funcionando modif");
  document.getElementById(nameForm).setAttribute("action", "../controlador/actualizaComp.jsp");
}

function elimComp(nameForm)
{
  console.log("Funcionando elim");
  var r = confirm("Estás seguro que desea aliminar al comprador");
  if (r === true) {
    document.getElementById(nameForm).setAttribute("action", "../controlador/eliminarComp.jsp");
  }
}

/* Pedido */
function elimPedido(formulario)
{
  console.log("Funcionando elim");
  console.log(formulario);
  var idForm = formulario.getAttribute("form");
  console.log("idForm ="+idForm);
  var r = confirm("Estás seguro que desea aliminar el pedido");
  if (r === true) {
  document.getElementById(idForm).setAttribute("action", "../controlador/eliminarPedido.jsp");
  }
}

function ponerComprador()
{
  console.log("Funcionando Poner Comprador");
  var seleccionador = document.getElementById('nombreComp');
  var idComprador = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_idComprador');
  var NIFComp = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_NIFComp');
  var tipoComp = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_tipoComp');
  var dirEnvioComp = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_dirEnvioComp');
  var emailComp = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_emailComp');
  var tlfComp = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_tlfComp');
  console.log(idComprador);
  document.getElementById("idComprador").value = idComprador;
  document.getElementById("NIFComp").value = NIFComp;
  document.getElementById("tipoComp").value = tipoComp;
  document.getElementById("dirEnvioComp").value = dirEnvioComp;
  document.getElementById("emailComp").value = emailComp;
  document.getElementById("tlfComp").value = tlfComp;
}

function ponerVariedad()
{
  console.log("Funcionando Poner Precio");
  var seleccionador = document.getElementById('nombreVar2');
  var precio = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_precio');
  var idMangos = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_idmangos');
  //console.log("idMAngos = "+idMangos);
  document.getElementById("precio").value = precio;
  document.getElementById("idMangos").value = idMangos;

  // Prepara la URL para ingresar Línea
  // Debería de cambiar dependiendo de lo seleccionado
  var redireccion = "../controlador/ingresaLineaPedido.jsp?";
  //--Valores
  var seleccionador2 = document.getElementById('nombreComp');
  var idComprador = seleccionador2.options[seleccionador2.selectedIndex].getAttribute('data-opc_idComprador');
  var codDetFact = document.getElementById('codDetFact').getAttribute("value");
  var nombreVar = seleccionador.value;
  var numFact = document.getElementById('numFact-row').getAttribute("value");
  console.log("numFact-row = "+numFact);
  var cantidad = document.getElementById('cantidad').getAttribute("value");

  redireccion += "idComprador=" + idComprador;
  redireccion += "&numFact-row=" + numFact;
  redireccion += "&codDetFact=" + codDetFact;
  redireccion += "&idMangos=" + idMangos;
  redireccion += "&nombreVar2=" + nombreVar;
  redireccion += "&precio=" + precio;

  var idMangos = seleccionador.options[seleccionador.selectedIndex].getAttribute('data-opc_idmangos');
  redireccion += "&idMangos=" + numFact;

  console.log(redireccion);
  document.getElementById("btn-insertar-linea").setAttribute("href", redireccion);
}

function calculaPrecioFinal() {
  console.log("Funcionando Poner Precio Total");
  var precioVar = document.getElementById('precio').value;
  console.log(precioVar);
  var cantidad = document.getElementById('cantidad').value;
  console.log(cantidad);
  document.getElementById("precioTotal").value = (precioVar * cantidad);
  //-- redireccion
  var redireccion = document.getElementById('btn-insertar-linea').getAttribute("href");
  redireccion += "&cantidad=" + cantidad;
  redireccion += "&precioTotal=" + (precioVar * cantidad);
  console.log(redireccion);
  document.getElementById("btn-insertar-linea").setAttribute("href", redireccion);
}


