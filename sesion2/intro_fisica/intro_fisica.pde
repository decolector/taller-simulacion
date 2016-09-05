/*
Objetos Rigidos

Este programa muestra el uso de la libreria Fisica.
Esta es una librería de simulación de objetos rigidos, y sistemas mecánicos.
*/

import fisica.*;


FWorld world; //Variale que contiene el mundo, o dominio de la simulacion
int ballCount = 50;//numero de objetos en el mundo

void setup() {
  size(800, 600);
  smooth();

  Fisica.init(this);//inicializacion del motor de simulacion.

  world = new FWorld();//creacion del mundo
  world.setEdges();//establecimiento de los limites
 
 //Creacion de los objetos
  for (int i=0; i<ballCount; i++) {
    //el objeto se crea con tamanio (y masa) aleatorio
    FCircle b = new FCircle(random(10, 50));
    //posicion aleatoria
    b.setPosition(random(width-50), random(height-50));
    b.setFill(0);//relleno negro
    
    //el objeto es agregado al mundo
    world.add(b);
  }
}

void draw() {
  background(255);
  //avanzamos un paso en la simulacion
  world.step();
  
  //dibujamos los objetos de la simulacion
  world.draw();
}

//tambien es posible agregar objetos al hacer click
void mousePressed(){
    FCircle b = new FCircle(random(10, 50));
    //posicion aleatoria
    b.setPosition(mouseX, mouseY);
    b.setFill(0);//relleno negro
    
    //el objeto es agregado al mundo
    world.add(b);
}