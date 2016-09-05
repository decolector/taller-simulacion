
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
  int distx = mouseX - width/2;
  //la direccion del viento depende de la posicion del mouse
  float windx = map(distx, -width/2, width/2, -0.5, 0.5 );
  PVector viento = new PVector(windx, 0);
 
  //aplicamos las fuerzas y calculamos el movimento
  //Hacemos esto por cada una de las particulas de la lista
 
  for(int i = 0; i < particulas.length; i++){
    PVector fricc = particulas[i].velocidad.get();
    float m = particulas[i].masa;
    //gravedad de 0.8
    PVector g = new PVector(0,0.8*m);
    fricc.mult(-1);
    fricc.normalize();
    fricc.mult(0.01);
    particulas[i].aplicaFuerza(fricc);
    particulas[i].aplicaFuerza(g);
    particulas[i].aplicaFuerza(viento);
    particulas[i].actualiza();
    particulas[i].dibuja();
    particulas[i].compruebaLimites();
  }
}



