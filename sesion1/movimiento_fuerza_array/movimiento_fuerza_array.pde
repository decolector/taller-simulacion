
//Creamos una lista de particulas con 30 lugares
Particula[] particulas = new Particula[30];

void setup(){
  size(800, 600);
  
  //creamos las particulas y las guardamos en la lista
  for(int i = 0; i < particulas.length; i++){
    particulas[i] = new Particula(random(10), random(width),random(height));
  }
}


void draw(){
  background(0);
  //creamos dos fuerzas
  PVector viento = new PVector(0.01, 0);
  PVector gravedad = new PVector(0, 0.1);
  //aplicamos las fuerzas y calculamos el movimento
  //Hacemos esto por cada una de las particulas de la lista
  for(int i = 0; i < particulas.length; i++){
    particulas[i].aplicaFuerza(gravedad);
    particulas[i].aplicaFuerza(viento);
    particulas[i].actualiza();
    particulas[i].dibuja();
    particulas[i].compruebaLimites();
  }
}



