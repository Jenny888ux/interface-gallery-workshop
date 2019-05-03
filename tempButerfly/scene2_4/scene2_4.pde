import fisica.*;
import processing.video.*;

Movie movie;

FWorld world;

String[] lines;
FBox[] obstacle;
//obstacle1, obstacle2, obstacle3, obstacle4, obstacle5, obstacle6;

FCircle obstacleQ;
float qx, qy;

int onday = 635;
Bola[] bolas;
int countB = 21; //cantidad de bolas

int t = 1;

boolean onda1 = false;
boolean onda2 = false;
boolean onda3 = false;
boolean todo = false;
boolean lineas = false;
boolean dimobtc = false;
boolean impulse = false;

int r;
float per1, per2, per3, lon, amp1, amp2, amp3;

FLine[] joints;

boolean rastro = false;
ArrayList bolitas;
PGraphics pg;


//----------------------------------------------------------------------
void setup()
{
  size (1632, 962);             // OPENGL); // sólo en p5
  smooth(8); //8
  frameRate(24);

  Fisica.init(this);

  world = new FWorld();
  //world.setEdges(0);

  lines = loadStrings("importPositions.txt");    // importa posiciones de obstaculos
  obstacle = new FBox[lines.length];
  for (int i = 0; i < lines.length; i++) {
    // Split this line into pieces at each tab character
    String[] pieces = split(lines[i], '\t');
    // Take action only if there are two values on the line
    // (this will avoid blank or incomplete lines)
    if (pieces.length == 4) {

      float w = int(pieces[2])-2;
      float h = int(pieces[3]);
      float x = int(pieces[0]) + w/2;
      float y = int(pieces[1]) + h/2;

      obstacle[i] = new FBox(w, h);
      obstacle[i].setPosition(x, y);
      obstacle[i].setStatic(true);
      obstacle[i].setFill(255);
      obstacle[i].setRestitution(0);
      world.add(obstacle[i]);
    }
  }

  obstacleQ = new FCircle(75); // FBox(100, 75);
  qx = width-obstacleQ.getSize()/2;//qx = width-obstacleQ.getWidth()/2;
  qy = 28+obstacleQ.getSize()/2;
  obstacleQ.setPosition(qx, qy);
  obstacleQ.setStatic(true);
  obstacleQ.setFill(255);
  obstacleQ.setRestitution(0);
  world.add(obstacleQ);

  bolas = new Bola[countB];
  r = 20;
  per1 = 1*r;
  per2 = 1.3*r;
  per3 = .8*r;
  lon = width*.25;
  //amp = height*.06;

  for (int i = 0; i < countB; i++) {
    bolas[i] = new Bola(67, i);
  }

  joints = new FLine[countB-1];
  for (int i=0; i< joints.length; i++) {
    joints[i] = new FLine(bolas[i].b.getX(), bolas[i].b.getY(), bolas[i+1].b.getX(), bolas[i+1].b.getY());
    joints[i].setRestitution(0);
    //joints[i].setDamping(20);
    joints[i].setStroke(255);
    joints[i].setFill(255);
    world.add(joints[i]);
  }

  pg = createGraphics(width, height);
  bolitas = new ArrayList();
  
 // movie = new Movie(this, "/Users/mariana/Documents/Adobe/Premiere Pro/McLar/sphere/spheresBG-000006.mov");
  //movie.loop();
}

//----------------------------------------------------------------------
void movieEvent(Movie m) {
  m.read();
}

//----------------------------------------------------------------------
void draw() {
  // fill(0, 50);
  // rect(0, 0, width, height);
  background(0, 0, 255);
 //image(movie, 0, 0, width, height);

  if (obstacleQ.getX() > -obstacleQ.getSize()) {       //obstacleQ.getSize()/2) {
    qx -= 2;
    obstacleQ.setPosition(qx, qy);
  }

  if (obstacleQ.getX() < width- obstacleQ.getSize()) {                        //(frameCount % 1 == 0) {
    if (t < 1500) {
      bolitas.add(new Bolita());
    }
  }
  if (rastro) {
    pg.beginDraw();
    pg.smooth(8);
    pg.stroke(255);
    pg. strokeWeight(.2);

    for (int i = 0; i < bolitas.size(); i++) {
      Bolita bb = (Bolita) bolitas.get(i);
      bb.update();

      if (bb.pxpos>0 && bb.pypos>0) {
        pg.line(bb.xpos, bb.ypos, bb.pxpos, bb.pypos);
      }

      bb.display();
    }
    pg.endDraw();


    image(pg, 0, 0);
  }

  // suma olas
  if (onda1) {
    amp1 += .5;
    amp1 = constrain(amp1, -10, height*.06);
  }
  if (onda2) {
    amp2 += .5;
    amp2 = constrain(amp2, -10, height*.04);
  }
  if (onda3) {
    amp3 += .5;
    amp3 = constrain(amp3, -10, height*.03);
  }

  // redimensiona los obstáculos
  if (dimobtc) {
    for (int i = 0; i < lines.length; i++) {
      if (obstacle[i].getWidth() > 2) {
        obstacle[i].setWidth(obstacle[i].getWidth()-1);
      }
    }
  }

  // posicion bolas

  for (int i = 0; i < countB; i++) {

    if (todo) {
      if (!impulse) {
        bolas[i].b.setStatic(false);
        float impy = (100) * (random(-40, 20));
        float impx = (100) * (random(-10, 10));
        bolas[i].b.addImpulse(impx, impy);
        
        if(i == countB-1) impulse = true;    // espera a la última
        
      }
    }
    else {
      bolas[i].update();
    }

    bolas[i].display();
  }


  // borra las juntas si todo cae
  for (int i=0; i< joints.length; i++) {
    if (todo) {
      world.remove(joints[i]);
    }
    else {
      joints[i].setStart(bolas[i].b.getX(), bolas[i].b.getY());
      joints[i].setEnd(bolas[i+1].b.getX(), bolas[i+1].b.getY());
    }
  }

  // borra los límites del world


  world.draw();
  world.step();
  t++;
  println(t);
}

//----------------------------------------------------------------------
void keyPressed() {
  if (key == 'f') {
    onda1 = !onda1;
  }
  if (key == 'g') {
    onda2 = !onda2;
  }
  if (key == 'h') {
    onda3 = !onda3;
  }
  if (key == 't') {
    todo = !todo;
  }  
  if (key == 'l') {
    lineas = !lineas;
  }  
  if (key == 'd') {
    dimobtc = !dimobtc;
  }
  if (key == 'o') {
    rastro = !rastro;
  }
}
