//Clase partícula:
//Aquí se definimos que es y que hace una partícula.

class Agente {
 
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float radio;

  float max_vel;
  float  max_fuerza;
  //Consturctor, funcion que crea el objeto
  Agente(float x , float y) {
      radio = 30;
      posicion = new PVector(x,y);
      velocidad = new PVector(0,0);
      aceleracion = new PVector(0,0);
      max_vel = 5;
      max_fuerza = 1;
      
    }
 
  //Funcion que aplica la fuerza que se le diga
  void aplicaFuerza(PVector fuerza) {
    //Función que calcula la aplicacion de una fuerza

    aceleracion.add(fuerza);
  }
  
  //funcion qu calcula el movimiento
  void actualiza() {
    //Calculamos el desplazamiento como lo venimos haciendo
    velocidad.add(aceleracion);
    //nos aseguramos de no sobrepasar el limite de velocidad
    velocidad.limit(max_vel);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }
  
  
  void busca(PVector obj){
    PVector objetivo = PVector.sub(obj, posicion);
    objetivo.normalize();
    objetivo.mult(max_vel);
    PVector direccion = PVector.sub(objetivo, velocidad);
    direccion.limit(max_fuerza);
    aplicaFuerza(direccion);
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

