/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mangoObjetos;

/**
 *
 * @author Ale Ruiz
 */
public class Linea {
  
  //Atributos
  
  private int numFact;
  private int codDetFact;
  private int idMangos;
  private String varMango;
  private float precio;
  private float cantidad;
  private float precioTotal;

  public int getCodDetFact() {
    return codDetFact;
  }

  public void setCodDetFact(int codDetFact) {
    this.codDetFact = codDetFact;
  }

  public int getIdMangos() {
    return idMangos;
  }

  public void setIdMangos(int idMangos) {
    this.idMangos = idMangos;
  }

  public int getNumFact() {
    return numFact;
  }

  public void setNumFact(int numFact) {
    this.numFact = numFact;
  }

  public float getCantidad() {
    return cantidad;
  }

  public void setCantidad(float cantidad) {
    this.cantidad = cantidad;
  }

  public String getVarMango() {
    return varMango;
  }

  public void setVarMango(String varMango) {
    this.varMango = varMango;
  }

  public float getPrecio() {
    return precio;
  }

  public void setPrecio(float precio) {
    this.precio = precio;
  }

  public float getPrecioTotal() {
    return precioTotal;
  }

  public void setPrecioTotal(float precioTotal) {
    this.precioTotal = precioTotal;
  }
  
  
}
