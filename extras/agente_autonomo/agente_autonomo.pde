
//Creamos una lista de agentes con 30 lugares
Agente[] agentes = new Agente[30];

void setup(){
  size(800, 600);
  
  //creamos los y los guardamos en la lista
  for(int i = 0; i < agentes.length; i++){
    agentes[i] = new Agente( random(width),random(height));
  }
}


void draw(){
  background(0);
  //creamos dos fuerzas
  PVector viento = new PVector(0.1, 0);
  PVector gravedad = new PVector(0, 0.8);
  //aplicamos las fuerzas y calculamos el movimento
  //Hacemos esto por cada una de los agentes de la lista
  for(int i = 0; i < agentes.length; i++){
    agentes[i].busca(new PVector(mouseX, mouseY));
    agentes[i].actualiza();
    agentes[i].dibuja();
    agentes[i].compruebaLimites();
  }
}



