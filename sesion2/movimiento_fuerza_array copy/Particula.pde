//Clase partícula:
//Aquí se definimos que es y que hace una partícula.

class Particula {
 
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa; //masa del objeto
  float radio;

  //Consturctor, funcion que crea el objeto
  Particula(float m, float x , float y) {
      masa = m;
      radio = masa*8;
      posicion = new PVector(x,y);
      velocidad = new PVector(0,0);
      aceleracion = new PVector(0,0);
    }
 
  //Funcion que aplica la fuerza que se le diga
  void aplicaFuerza(PVector fuerza) {
    //Función que calcula la aplicacion de una fuerza
    //Recibimos la fuerza, dividims por masa y agregamos a aceleración.

    PVector f = PVector.div(fuerza,masa);
    aceleracion.add(f);
  }
  //funcion qu calcula el movimiento
  void actualiza() {
    //Calculamos el desplazamiento como lo venimos haciendo
    velocidad.add(aceleracion);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }
  
 //función que dibuja el objeto como un elipse
  void dibuja() {
    stroke(0);
    fill(175);
    //Usamos la masa para calcular el tamaño
    ellipse(posicion.x,posicion.y, radio*2 ,radio*2);
  }
  
  //El objeto rebota cuando encuentra los bordes del canvas
  void compruebaLimites() {
    if (posicion.x  > width - radio) {
      posicion.x = width - radio;
      velocidad.x *= -1;
    } else if (posicion.x < 0 + radio) {
      velocidad.x *= -1;
      posicion.x = 0 + radio;
    }
 
    if (posicion.y > height - radio) {
      velocidad.y *= -1;
      posicion.y = height - radio;
    }else if (posicion.y < 0 + radio) {
      velocidad.y *= -1;
      posicion.y = 0 + radio;
    }
  }
}

