import fisica.*;

FWorld world;

void setup(){
  size(800, 600);
  smooth();
  Fisica.init(this);
  
  world = new FWorld();
  world.setGravity(0, -300);

  //creamos un obstaculo concavo.
  FPoly obstacle = new FPoly();
  
  //primero los vertices de la cara interna
  int rad = 200;
  for(int i = 0; i <= 180; i+= 10){
    float angle = radians(i);
    float x = sin(angle)*rad;
    float y = cos(angle)*rad;
    obstacle.vertex(x,y);
  }
  
  //luego la cara externa.
  rad = 220;
  for(int i = 180; i >= 0; i-= 10){
    float angle = radians(i);
    float x = sin(angle)*rad;
    float y = cos(angle)*rad;
    obstacle.vertex(x,y);
  }
  
  obstacle.setPosition(width/2, height/2);
  obstacle.setRotation(radians(-90));
  obstacle.setStatic(true);
  //obstacle.setFill(0);
  obstacle.setDrawable(false);
  world.add(obstacle);
}

void draw(){
  background(255);
  fill(0);
  
  //vamos a contar la velocidad de procesamiento
  text("Frame rate: " + frameRate, 10, 20);
  world.step();
  world.draw();
}


//con el mouse agregamos un blob.
void mouseClicked(){
    FBlob b = new FBlob();
    b.setAsCircle(mouseX, mouseY, random(20, 50));
    b.setStroke(0);
    b.setStrokeWeight(2);
    b.setFill(255);
    b.setFriction(0);
    world.add(b);
}