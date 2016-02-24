
//Creamos una lista de particulas con 30 lugares
Particula[] particulas = new Particula[5];
Atractor at;

void setup(){
  size(800, 600);
  
  //creamos las particulas y las guardamos en la lista
  for(int i = 0; i < particulas.length; i++){
    particulas[i] = new Particula(random(5), random(width),random(height));
  }
  
  at = new Atractor(width/2, height/2, 40);
}


void draw(){
  background(0);
 
  //aplicamos las fuerzas y calculamos el movimento
  //Hacemos esto por cada una de las particulas de la lista
  
  at.posicion = new PVector(mouseX, mouseY);
   
  for(int i = 0; i < particulas.length; i++){
    PVector a = at.atraer(particulas[i]);
    particulas[i].aplicaFuerza(a);
    particulas[i].actualiza();
    particulas[i].compruebaLimites();
    particulas[i].dibuja();
  }
  
  at.dibuja();
}

