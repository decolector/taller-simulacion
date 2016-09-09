/*
Ejemplo de utilización de objetos estáticos
*/

import fisica.*;

FWorld world;

FBox piso;
FBox derecha;
FBox izquierda;

void setup(){
  size(600, 800);
  smooth();
  
  Fisica.init(this);
  
  world = new FWorld();
  
  // piso
  piso = new FBox(400, 20);
  piso.setPosition(width/2, (height/4) * 3);
  piso.setStatic(true); //establecemos el objeto com oestatico
  piso.setRestitution(0);
  piso.setFill(0);
  
  //derecha
  derecha = new FBox(20, 200);
  derecha.setPosition(500, ((height/4)*3) - 100 );
  derecha.setStatic(true);//objeto estatico
  derecha.setFill(0);
  derecha.setRestitution(0);

  //izquierda
  
  izquierda = new FBox(20, 200);
  izquierda.setPosition(100, ((height/4)*3) - 100);
  izquierda.setStatic(true);//objeto estatico
  izquierda.setFill(0);
  izquierda.setRestitution(0);
  
  world.add(piso);
  world.add(derecha);
  world.add(izquierda);
}


void draw(){
  background(255);

  //lista de objetos en el mundo
  ArrayList<FBody> bodies = world.getBodies();
  
  //por cada objeto de la simulacion
  for(FBody body : bodies){
    //si el objeto esta fuera de la pantalla
    if(body.getY() > height){
      //removemos el objeto de la simulacion
      world.remove(body);
    }
  }
  
  world.step();
  world.draw();
}

//al mover el mouse agregamos objetos a la simulacion
void mouseMoved(){
  FCircle b = new FCircle(10);//creamos un objeto 
  b.setPosition(mouseX, mouseY);//lo ubicamos en la posicion del mouse
  b.setNoStroke();
  b.setFill(176);
  b.setRestitution(0);
  world.add(b);//agregamos el objeto
}