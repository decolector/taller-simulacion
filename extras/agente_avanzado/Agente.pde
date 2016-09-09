//Clase partícula:
//Aquí se definimos que es y que hace una partícula.

class Agente {
 
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;

  float radio;
 
  float max_vel;
  float  max_fuerza;
  
  float limite_variacion = 5;
  
  //Consturctor, funcion que crea el objeto
  Agente(float x , float y) {
      radio = 10;
      posicion = new PVector(x,y);
      velocidad = new PVector(0,0);
      aceleracion = new PVector(0,0);
      max_vel = 5;
      max_fuerza = 0.1;
      
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
    //vector.heading calcula el angulo al que apunta la velocidad.
    float theta = velocidad.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(posicion.x,posicion.y);
    rotate(theta);
    //dibujamos un triangulo con respecto a la posicion 
    beginShape();
    vertex(0, -radio*2);
    vertex(-radio, radio*2);
    vertex(radio, radio*2);
    endShape(CLOSE);
    popMatrix();
  }
}

