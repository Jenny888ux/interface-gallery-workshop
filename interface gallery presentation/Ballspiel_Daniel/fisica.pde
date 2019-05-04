import fisica.*;

FWorld world;
FPoly poly;
FBox obstacle;
int zaehler;
int highscore;
int colorhs;

void initFisica() {
  zaehler=0;
 
  Fisica.init(this);
  colorhs =0;
  world = new FWorld();
  world.setGravity(0, 400);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);
  world.remove(world.bottom);

  obstacle = new FBox(800,50);
  //obstacle.setRotation(PI/4);
  obstacle.setPosition(width/2, height);
  obstacle.setStatic(true);
  obstacle.setFill(255,255,0);
  obstacle.setRestitution(0);
  world.add(obstacle);

  world.setEdgesRestitution(0.4);
}

void updateFisica() {

  //balls
  if (frameCount % 40 == 0) {
    FCircle b = new FCircle(random(20, 40)); // diameter
    b.setPosition(random(0+10, width-10), -50); // initial position
    //b.setVelocity(0, 200);
    b.setRestitution(0.5);
    b.setNoStroke();
    b.setFill(random(0,255),random(0,255),random(0,255));
    world.add(b);
    zaehler++;
  }
//Bölle Löschen wenn ausserhalb
    //nicht möglich?!?
//zähler anzeigen
    textSize(50);
    fill(255,0,0);
    text(zaehler,100,100);
    text(highscore,100,150);
    colorhs = highscore*5;
    if (colorhs>255) colorhs = 255;
    fill(colorhs,60,60); //bodycolor
    
  world.step();
  world.draw(this);
  
}
void contactStarted(FContact c) {
  FBody ball = null;
  FBody ballc =null;
  if (c.getBody1() == obstacle&&c.getBody2().getName()==null) {
    ball = c.getBody2();
  } else if (c.getBody2() == obstacle&&c.getBody1().getName()==null) {
    ball = c.getBody1();
  }else if (c.getBody1().getName()==null){
   // println(c.getBody2().getName());
    ballc = c.getBody1();
    ballc.setFill(random(0,255),random(0,255),random(0,255));
    return;
  }else if (c.getBody2().getName()==null){
  //  println(c.getBody2().getName());
    ballc = c.getBody2();
    ballc.setFill(random(0,255),random(0,255),random(0,255));
    return;
  }
  if (ball == null) {
    return;
  }
  //GAME END++++++++++++++++++++++++++++++++++++++
  ball.setFill(0);
  world.clear();
  obstacle = new FBox(800,50);
  obstacle.setPosition(width/2, height);
  obstacle.setStatic(true);
  obstacle.setFill(255,255,0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  //textSize(100);
 // fill(255,0,0);
 // text("Game Over",200,200);
 //Highscore
   if(zaehler>highscore){
     highscore=zaehler;
   }
     
  zaehler=0;
}
