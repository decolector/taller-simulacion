ParticleSystem ps;
Attractor attractor;

void setup() {
  size(800,200);
  smooth();
  ps = new ParticleSystem(new PVector(width/2,50));
  attractor = new Attractor(width/2-20,height/2);
}

void draw() {
  background(255);
  ps.addParticle();
  
  // Apply gravity force to all Particles
  PVector gravity = new PVector(0,0.01);
  ps.applyForce(gravity);
  
  ps.applyAttractor(attractor);
  
  attractor.display();
  ps.run();
}
