/**
 * http://www.ricardmarxer.com/fisica/reference/index.html
 *  ContactRemove
 *
 *  by Ricard Marxer
 *
 *  This example shows how to use the contact events in order to remove bodies.
 */

import fisica.*;

FWorld world;

// in setup()
void initFisica() {

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 100);
  world.setEdges();
}
// in draw()
void updateFisica() {
  if (frameCount % 50 == 0) {
    float sz = random(50, 100);
    FCircle b = new FCircle(sz);
    b.setPosition(random(0+30, width-30), 50);
    b.setVelocity(0, 100);
    b.setRestitution(0.7);
    b.setDamping(0.01);
    b.setNoStroke();
    b.setFill(178, 255, 227);
    world.add(b);
  }

  world.draw();
  world.step();
}

void contactEnded(FContact c) {  
  if (!c.getBody1().isStatic()) {
    FCircle b = (FCircle)c.getBody1();
    if (b.getSize()>10) {
      b.setSize(b.getSize()*0.9);
    }else{
     world.remove(b);
    }
  } 

  if (!c.getBody2().isStatic()) {
    FCircle b = (FCircle)c.getBody2();
    if (b.getSize()>10) {
      b.setSize(b.getSize()*0.9);
    }else{
     world.remove(b);
    }
  }
}
