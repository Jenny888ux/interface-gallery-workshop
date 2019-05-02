PImage bg;
PImage canvas;
PGraphics aux;

void setup() {
  size(1400, 840, P2D); 
  //frameRate(20);
  bg = loadImage("veste-coburg.jpg");
  bg.resize(width, height);
  bg.loadPixels();
  image(bg, 0, 0);
}

void draw() {
}

void mouseMoved() {
  fill(0, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseDragged() {
  int mx = mouseX;
  int my = mouseY;
  int l = 40;
  noStroke();
  beginShape();
  texture(bg);
  vertex(mx, my, mx, my);
  vertex(mx+l, my, mx+l, my);
  vertex(mx+l, my+l, mx+l, my+l);
  vertex(mx, my+l, mx, my+l);
  endShape(CLOSE);
  fill(255);
}
