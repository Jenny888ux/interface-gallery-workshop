/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/151773*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage img;

 /* @pjs preload ="fridaKahlo.jpg"; */ 
  
void setup() {
  size (557, 396);
  smooth();
  img = loadImage ("fridaKahlo.jpg"); 
}
  
void draw()
{  
  int durchmesser = 40;
  img.loadPixels();

  image(img, 0, 0);
  int x = mouseX;
  int y = mouseY;
  color c = img.pixels[y * img.width + x];
  stroke(255);
  fill(c);
  ellipse (x, y, durchmesser, durchmesser);
}
