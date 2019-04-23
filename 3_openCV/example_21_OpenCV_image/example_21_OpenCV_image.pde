/**
 * talleres CCE mariana carranza
 * OpenCV image + copy
 * basado en ejemplos OpenCV
 * by mariana carranza.
 * my two images: solutions.jpg (240×155), technicals-difficulties.jpg (240×155)  
 *
 *http://atduskgreg.github.io/opencv-processing/reference/
 */


import gab.opencv.*;

OpenCV opencv;
PImage img1, img2;
PFont font;

int xpos;

//_________________________________________________________________________________________________________
void setup() {

  size( 400, 300, P2D);        
  img1 = loadImage( "technical-difficulties.jpg" );
  img2 = loadImage( "solutions.jpg" );

  opencv = new OpenCV( this, img1 );             // initialize opencv
  opencv.useColor();                             // with color
  font = loadFont("Ayuthaya-40.vlw");            // use: Tools/ Create Font to create font in sketch
  textFont(font, 15);

  xpos = int((width-img1.width)/2);               // x coordenate for position image in screen
}


//_________________________________________________________________________________________________________
void draw() {
  background(0);

  if (mouseX < width/2) {
    opencv.loadImage(img1);                             // copy the entire image in background (allocate size)
    text("technical difficulties", xpos, 260);
    
  } else {
    opencv.loadImage(img2);                              // copy the entire image in background
    text("solutions", 235, 260);
  }


  image( opencv.getOutput(), xpos, 50 );                  // show the result
}
