//Aqui se define lo que es y puede hacer una particula (Clase)
class Particula {
 
//El objeto posee dos propiedades o variables de tipo PVector: posicion and velocidad.
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa;
  int radio;
 
  Particula() {
    masa = 1;
    posicion = new PVector(random(width),random(height));
    velocidad = new PVector(0,0);

    //aceleracion = new PVector(random(0.1), random(0.1));
    aceleracion = new PVector(0,0);
    //velocidad = new PVector(random(-2,2),random(-2,2));
    radio = 25;
  }
 
  void actualizar() {
//La posicion cambia al aplicar velocidad
    velocidad.add(aceleracion);
    //velocidad.limit(10);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }
 
  void dibujar() {
    stroke(0);
    fill(175);
    ellipse(posicion.x,posicion.y, radio, radio);
  }
 
 void aplicarFuerza(PVector fuerza){
   PVector nf = PVector.div(fuerza, masa);
   aceleracion.add(nf);
 }
 //Esta funcion comprueba que la posicion del objeto este dentro de los limites
 //del espacio, creando un espacio toroidal
 /*
  void comprobarLimites() {
    if (posicion.x > width) {
      posicion.x = 0;
    } else if (posicion.x < 0) {
      posicion.x = width;
    }
 
    if (posicion.y > height) {
      posicion.y = 0;
    } else if (posicion.y < 0) {
      posicion.y = height;
    }
  } 
  */
  
   //Esta funcion comprueba que la posicion del objeto este dentro de los limites
 //del espacio, rebotando en los bordes.
 /*
  void comprobarLimites() {
    //Verificamos que la posicion esté dentro de los limites
    //del espacio, usando los componentes individuales de cada vector.
    if ((posicion.x > width) || (posicion.x < 0)) {
      //si el objeto se encuentra por fuera, invertimos su direccion.
      velocidad.x *= -1;
    }
    if ((posicion.y > height) || (posicion.y < 0)) { 
      //si el objeto se encuentra por fuera, invertimos su direccion.
      velocidad.y *= -1;
    }
  }
 */
  
  void comprobarLimites() {
   if (posicion.x > width) {
      posicion.x = width;
      velocidad.x *= -1;
    } else if (posicion.x < 0) {
      posicion.x = 0;
      velocidad.x *= -1;
    }
 
    if (posicion.y > height) {
      posicion.y = height;
      velocidad.y *= -1;
    } else if (posicion.y < 0) {
      posicion.y = 0;
      velocidad.y *= -1;
    }
  } 
}
