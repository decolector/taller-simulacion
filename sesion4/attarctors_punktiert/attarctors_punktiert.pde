// Punktiert is a particle engine based and thought as an extension of Karsten Schmidt's toxiclibs.physics code. 
// This library is developed through and for an architectural context. Based on my teaching experiences over the past couple years. (c) 2012 Daniel Köhler, daniel@lab-eds.org

//here: global attractor force connected to mouse position

import punktiert.math.Vec;
import punktiert.physics.*;

// world object
VPhysics physics;


BWander wander;

VParticleGroup followers;

VParticle provider;

// number of particles in the scene
int amount = 200;
int interval = 10000;
int past = 0;

public void setup() {
  size(800, 600);
  noStroke();

//set up physics
  physics = new VPhysics();
  physics.setfriction(.4f);

  BWorldBox boxx = new BWorldBox(new Vec(), new Vec(width, height, 500));
  boxx.setBounceSpace(true);
  physics.addBehavior(boxx);
  
  followers = new VParticleGroup();
  
  for (int i = 0; i < amount; i++) {
    // val for arbitrary radius
    float rad = random(2, 20);
    // vector for position
    Vec pos = new Vec(random(rad, width - rad), random(rad, height - rad));
    // create particle (Vec pos, mass, radius)
    VParticle particle = new VParticle(pos, 4, rad);
    // add Collision Behavior
    particle.addBehavior(new BCollision());
    
    followers.addParticle(particle);
    // add particle to world
    physics.addParticle(particle);
    
  }
  provider = new VParticle(new Vec(width/3, height/3), 2, 30);
  //provider.addBehavior(new BCollision());
  provider.addBehavior(new BWander(0,1,1));
  provider.addForce(new Vec(5,5,0));
  physics.addParticle(provider);
}

public void draw() {

  background(255);

  physics.update();

  noFill();
  stroke(200, 0, 0);

  noStroke();
  fill(0, 255);
  for (VParticle p : followers.particles) {
    ellipse(p.x, p.y, p.getRadius() * 2, p.getRadius() * 2);
  }
  fill(255,0,0);
  ellipse(provider.x, provider.y, provider.getRadius()*2, provider.getRadius()*2);
  
  if( millis() - past > interval){
    past = millis();
    println("new attractor");
    BAttraction attr = new BAttraction(new Vec(provider.x, provider.y), provider.getRadius() *2, .1f );

    for(VParticle p: followers.particles){
      p.addBehavior(attr);
    }
  }
}