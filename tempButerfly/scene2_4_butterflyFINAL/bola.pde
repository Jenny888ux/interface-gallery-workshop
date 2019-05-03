class Bola {

  float xpos, ypos, diam;
  int id;
  FCircle b;

  boolean aparece = false;
  float noiseVal;
  float n = 0;


  //---------------------------------------------------------------------

  Bola (float dd, int iid) {
    diam = dd;
    id = iid;
    xpos = (id + 1) * width/(countB+1);
    ypos = onday;
    b = new FCircle(diam);
    b.setPosition(xpos, ypos);
    b.setStatic(true);
    //b.setFill(255);
    b.setDrawable(false);
    b.setRestitution(1);
    world.add(b);
  }

  //----------------------------------------------------------------------
  void update() {
    float x = b.getX();
    if (onda1) {
      ypos = onday - amp1*cos (radians((180*x/lon) - (180*t/per1)));
    }

    if (onda2) {
      //ypos = onday - amp*cos (radians((180*x/lon) - (180*t/per1))) - amp*cos (radians((180*x/(lon*.5)) - (180*t/per2)));
      ypos = ypos - amp2*cos (radians((180*x/(lon*.9)) - (180*t/per2)));
    }

    if (onda3) {
      //ypos = onday - amp*cos (radians((180*x/lon) - (180*t/per1))) - amp*cos (radians((180*x/(lon*1.3)) - (180*t/per2)))
      // + amp*cos (radians((180*x/(lon*.8)) - (180*t/per3)));
      ypos = ypos  + amp3*cos (radians((180*x/(lon*.8)) - (180*t/per3)));
    }

    b.setPosition(xpos, ypos);
  }

  //----------------------------------------------------------------------
  void display() {
    if (!aparece) {
      aparecen();
    }
    else {
      noiseDetail(7,0.35);

      noiseVal = noise(n+id);                   //*2;  influye en tamanyo de las bolas
      float x = b.getX();
      float y = b.getY();
      //stroke(255, noiseVal*7*10);
      //strokeWeight(8);
      //noFill();
     // ellipse(x, y, 200/(noiseVal*5), 200/(noiseVal*5));

      noStroke();
      fill(255, noiseVal*4*10);
      ellipse(x, y, 200/(noiseVal*4), 200/(noiseVal*4));
      //ellipse(x, y, 200/(noiseVal*4.3), 200/(noiseVal*4.3));
      ellipse(x, y, 200/(noiseVal*5), 200/(noiseVal*5));

     // fill(255, noiseVal*8*10);
      ellipse(x, y, 200/(noiseVal*6), 200/(noiseVal*6));
      ellipse(x, y, 200/(noiseVal*7), 200/(noiseVal*7));

      //fill(255, noiseVal*10*10);
      ellipse(x, y, 200/(noiseVal*9), 200/(noiseVal*9));

      //fill(255, noiseVal*14*10);
      ellipse(x, y, 200/(noiseVal*10), 200/(noiseVal*10));
      ellipse(x, y, 200/(noiseVal*15), 200/(noiseVal*15));
      ellipse(x, y, 200/(noiseVal*20), 200/(noiseVal*20));
      ellipse(x, y, 200/(noiseVal*25), 200/(noiseVal*25));

      //fill(255, noiseVal*20*10);
      ellipse(x, y, 200/(noiseVal*30), 200/(noiseVal*30));                          
      ellipse(x, y, 200/(noiseVal*40), 200/(noiseVal*40));                       

     // fill(255, noiseVal*20*10);
      ellipse(x, y, 200/(noiseVal*50), 200/(noiseVal*50));                          

      //fill(255, noiseVal*20*10);
      ellipse(x, y, 200/(noiseVal*80), 200/(noiseVal*80));
      ellipse(x, y, 200/(noiseVal*100), 200/(noiseVal*100));                        

      n += 0.009;   //*(id+1);
    }
  }

  //----------------------------------------------------------------------
  void aparecen() {
    int cond = int (7*(random(1, 11)));
    if (t%cond == 0) {
      aparece = true;
    }
  }
}

