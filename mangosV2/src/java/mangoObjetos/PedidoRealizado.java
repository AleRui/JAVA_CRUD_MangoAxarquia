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
public class PedidoRealizado {

  //Getter y Setter
  private int numFact;
  private String nombreComp;
  private String fechaFact;
  private float precioTotal;

  public int getNumFact() {
    return numFact;
  }

  public void setNumFact(int numFact) {
    this.numFact = numFact;
  }

  public String getNombreComp() {
    return nombreComp;
  }

  public void setNombreComp(String nombreComp) {
    this.nombreComp = nombreComp;
  }

  public String getFechaFact() {
    return fechaFact;
  }

  public void setFechaFact(String fechaFact) {
    this.fechaFact = fechaFact;
  }

  public float getPrecioTotal() {
    return precioTotal;
  }

  public void setPrecioTotal(float precioTotal) {
    this.precioTotal = precioTotal;
  }
  
  
}
