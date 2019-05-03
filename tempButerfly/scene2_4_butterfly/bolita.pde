class Bolita {

  float xpos, ypos, pxpos, pypos;
  FCircle b;
  //ArrayList lines;
  PImage imgf;

  Bolita () {

   int temp = int(random(12));
   imgf = createImage(temp, temp, ARGB);
   imgf.copy(ttx, 0, 0, butt.width, butt.height, 0, 0, temp, temp);
   
    b = new FCircle(temp);  //(random(12));
    
    float bx = b.getSize() + qx + obstacleQ.getSize()/2;
    float by = random(qy-obstacleQ.getSize()/2, qy+obstacleQ.getSize()/2);
    b.setPosition(bx, by);
    int vy = int( random( -10, 10));
    int vx = int(random(200, 400));
    b.setVelocity(vx, vy);
    b.setRestitution(1); // repulsión o atracción al obstáculo
   // b.setNoStroke();
   // b.setFill(200);
    b.attachImage(imgf);
    world.add(b);

    xpos = b.getX();
    ypos = b.getY();

  }

  void update() {

    xpos = b.getX();
    ypos = b.getY();

  }

  void display() {


    pxpos = xpos;
    pypos = ypos;
  }
}

