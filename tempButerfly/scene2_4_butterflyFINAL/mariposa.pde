class Mariposa {

  float xpos, ypos, mitx, mity, diam;

  PImage img1, img2, img3, img4, img5, img6, img7, img8, bg;
  float size;
  float timer = 0;
  float radi = 0;
  float aumento = .001;
  float decae = .001;
  int offset;
  int countimg = 0;

  //----------------------------------------------------------------------
  Mariposa() {

    img1 = m[1]; // loadImage() in setup()
    img2 = m[2];
    img3 = m[3];
    img4 = m[4];
    img5 = m[5];
    img6 = m[6];
    img7 = m[7];
    img8 = m[0];
    bg = butt;

    size = random(30, 50);   //(20, 40);
    diam = 3;
    offset = int(random(-20, 20));
    aumento = random(.6);
    decae = random(.6);

    xpos = qx+offset;
    ypos = qy-offset;
  }
  //----------------------------------------------------------------------
  void run() {
    update();
    display();
  }
  //----------------------------------------------------------------------
  void update() {

    xpos = qx+offset + radi*diam*cos(timer);
    ypos = qy-offset + radi*diam*sin(timer);

    if (radi < 0 || radi > 5*TWO_PI) {
      decae = -decae;
    }

    radi += decae;
    timer += aumento;
    countimg ++;
  }
  //----------------------------------------------------------------------
  void display() {


    if ( countimg % 8 == 0) {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img1, xpos, ypos, size, size);
    }
    else if (countimg % 8 == 1) {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img2, xpos, ypos, size, size);
    }
    else if (countimg % 8 == 2) {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img3, xpos, ypos, size, size);
    }
    else if (countimg % 8 == 3) {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img4, xpos, ypos, size, size);
    }
    else if (countimg % 8 == 4) {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img5, xpos, ypos, size, size);
    }
    else if (countimg % 8 == 5) {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img6, xpos, ypos, size, size);
    }
    else if (countimg % 8 == 6) {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img7, xpos, ypos, size, size);
    }
    else {
      image(bg, xpos-size, ypos-size, 3*size, 3*size);
      image(img8, xpos, ypos, size, size);
    }

    /*
    pushMatrix();
     
     translate(xpos, ypos);
     
     pushMatrix();
     rotateZ(radians(random(-30, 30)));
     translate(0, -size*0.8);
     image(img1, 0, 0, size, size);
     popMatrix();
     
     pushMatrix();
     rotateZ(radians(random(30,60)));
     translate(size*.2, 0);
     image(img1, 0, 0, size, size);
     popMatrix();
     
     popMatrix();
     
     
     
     if ( int(timer) % 2 == 0) {
     
     fill(255, 0, 0);
     ellipse(xpos, ypos, size, size);
     //b.attachImage(img1);
     }
     else {
     fill(0, 255, 0);
     ellipse(xpos, ypos, size, size);
     //b.attachImage(img2);
     }*/
  }
}

