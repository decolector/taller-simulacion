int angle = 0;
int angle2 = 0;

void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));
  fill(255);
  rectMode(CENTER);
  rect(0, 0, 250, 250);
  popMatrix();
  
  angle++;
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle2));
  fill(0);
  rect(0, 0, 100, 100);
  popMatrix();
  
  angle2--;
  
}
