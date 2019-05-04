class Linea {

  float ax, ay, bx, by;

  Linea ( float aax, float aay, float bbx, float bby) {

    ax = aax;
    ay = aay;
    bx = bbx;
    by = bby;
  }

  void display() {
    
    if (bx > 0 && by > 0) {
      line(ax, ay, bx, by);
    }
  }
}
