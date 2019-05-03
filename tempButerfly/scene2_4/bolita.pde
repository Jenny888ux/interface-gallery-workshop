class Bolita {

  float xpos, ypos, pxpos, pypos;
  FCircle b;
  //ArrayList lines;

  Bolita () {

    b = new FCircle(random(12));
    float bx = b.getSize() + qx + obstacleQ.getSize()/2;
    float by = random(qy-obstacleQ.getSize()/2, qy+obstacleQ.getSize()/2);
    b.setPosition(bx, by);
    int vy = int( random( -10, 10));
    int vx = int(random(200, 400));
    b.setVelocity(vx, vy);
    b.setRestitution(1); // repulsión o atracción al obstáculo
    b.setNoStroke();
    b.setFill(200);
    world.add(b);

    xpos = b.getX();
    ypos = b.getY();

    //lines = new ArrayList();
  }

  void update() {

    xpos = b.getX();
    ypos = b.getY();

    //lines.add(new Linea(xpos, ypos, pxpos, pypos));

    /* pxpos = xpos;
     pypos = ypos;
     
     if (lines.size() > 30) {
     lines.remove(0);
     }*/
  }

  void display() {
    /*
    float trdec = 0;
     for (int i = lines.size()-1; i > 0; i--) {
     
     float s = b.getSize()*.2;
     strokeWeight(s);
     
     trdec += 5;
     stroke(255, 200-trdec);
     
     Linea lin = (Linea) lines.get(i);
     lin.display();
     }

    pg.beginDraw();
    //pg.background(100);
    pg.stroke(255);
    pg.strokeWeight(.5);
    pg.line(xpos, ypos, pxpos, pypos);
    pg.endDraw();
    */
    
    //line(xpos, ypos, pxpos, pypos);

    pxpos = xpos;
    pypos = ypos;
  }
}

