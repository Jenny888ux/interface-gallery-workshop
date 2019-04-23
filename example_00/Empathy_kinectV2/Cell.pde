

class Cell {
  int x, y;
  float s = 0; // spin velocity
  float c = 0; // current angle
  int vx, vy, pvx, pvy;

  Cell(int x, int y) {
    this.x=x;
    this.y=y;
  }

  void sense() {
    vx = int(v1.x);
    vy = int(v1.y);

    if (vx != 0 || vy != 0)
      s += sp * det(x, y, pvx, pvy, vx, vy) / (dist(x, y, vx, vy) + 1);
    s *= sl;
    c += s;
    float d = bd * s + .001;
    line(x, y, x + d * cos(c), y + d * sin(c));
    pvx = vx;
    pvy = vy;
  }
}
