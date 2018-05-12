/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function valFormComp(formulario) {
  console.log('Validando Formulario');
  //-- Buscar id del Formulario
  console.log(formulario);
  var idForm = formulario.getAttribute("id");
  console.log("idForm = "+idForm);

  //-- Selecciona el formulario
  var NIFComp = document.forms[idForm]["NIFComp"].value;
  console.log("NIFComp = " + NIFComp);
  var tlfComp = document.forms[idForm]["tlfComp"].value;
  console.log("tlfComp = " + tlfComp);

  console.log(NIFComp.length);
  if (NIFComp.length !== 9) {
    alert("El NIF es incorrecto.");
    return false;
  }
  if (tlfComp.length !== 9) {
    alert("El TLF es incorrecto.");
    return false;
  }
}

