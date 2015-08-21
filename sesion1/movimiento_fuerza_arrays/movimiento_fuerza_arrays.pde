Particula[] particulas = new Particula[10];
PVector gravedad;

void setup() {
  size(640,360);
//Creamos la partícula
  for(int i = 0; i < particulas.length; i++){
    particulas[i] = new Particula();
  }

  gravedad = new PVector(0, 1);

}
 
void draw() {
  background(255);
 
 for(int i = 0; i< particulas.length; i++){
 //Funciones o capacidades del objeto Particula.
  particulas[i].aplicarFuerza(gravedad);
  particulas[i].actualizar();
  particulas[i].comprobarLimites();
  particulas[i].dibujar();
 }

}




