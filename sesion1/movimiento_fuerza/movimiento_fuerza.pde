Particula part;
PVector gravedad;
PVector drag;


void setup() {
  size(640,360);
//Creamos la partícula
  part = new Particula();
  gravedad = new PVector(0, 1);
  drag = new PVector(0, -0.3);

}
 
void draw() {
  background(255);
 
//Funciones o capacidades del objeto Particula.
  part.aplicarFuerza(gravedad);
  //part.aplicarFuerza(drag);
  part.actualizar();
  part.comprobarLimites();
  part.dibujar();
}




