class Atractor{
  PVector posicion;
  float masa;
  
  Atractor(float x, float y, float m){
    posicion = new PVector(x, y);
    masa = m;
  }
  
  PVector atraer(Particula p){
    PVector fuerza = PVector.sub(posicion, p.posicion);
    float distancia = fuerza.mag();
    distancia = constrain(distancia, 5, 25);
    fuerza.normalize();
    float intensidad = (0.4 * masa * p.masa)/(distancia * distancia);
    fuerza.mult(intensidad);
    return fuerza;
  }
  
  void dibuja(){
    fill(255);
    ellipse(posicion.x, posicion.y, masa*8, masa*8);
  }
}
