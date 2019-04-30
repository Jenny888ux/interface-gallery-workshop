import fisica.*;

FWorld world;
FPoly poly;
void initFisica() {

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 400);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);

  world.setEdgesRestitution(0.4);
}

void updateFisica() {

  //balls
  if (frameCount % 8 == 0) {
    FCircle b = new FCircle(random(5, 20)); // diameter
    b.setPosition(random(0+10, width-10), -50); // initial position
    //b.setVelocity(0, 200);
    b.setRestitution(0.5);
    b.setNoStroke();
    b.setFill(0, 0, 255);
    world.add(b);
  }

  world.step();
  world.draw(this);
}
