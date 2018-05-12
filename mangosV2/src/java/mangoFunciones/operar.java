/*
 * @author: Ale Ruiz
 */
package mangoFunciones;

/* Importa todo dentro de Util */
import java.util.*;

/* IMPORTAR Mis Objetos */
import mangoObjetos.*;

public class operar {
  /**
   * Ale. comprobarVacio: Comprueba si un String viene o no vacio
   * un campo, variable...
   *
   * @param valor un variable String
   * @return <code>boolean</code> devuelve Verdadero o Falso
   */
  public static boolean compVacio(String valor) {
    boolean pregVacio = false;
    if ( valor == null || valor.trim().isEmpty() || valor.equals("0.00") ) {
      pregVacio = true;
    }
    return pregVacio;
  }
  
  /*Fin de operar*/
}
