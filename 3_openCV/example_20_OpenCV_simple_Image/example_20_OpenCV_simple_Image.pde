/**
 * talleres CCE mariana carranza
 * OpenCV image + copy
 * basado en ejemplos OpenCV
 * by mariana carranza.
 * my images: Spindel.jpg (320×480) 
 *
 *http://atduskgreg.github.io/opencv-processing/reference/
 * int[] matToARGBPixels(Mat m)
 */


import gab.opencv.*;

OpenCV opencv;
int[] pix;
//___________________________________________________________________
void setup() {
  PImage src = loadImage("Spindel.jpg");
  //src.resize(640, 0);
  size(640, 960);                   

  // initialize opencv
  opencv = new OpenCV( this, src );                    // my image is in opencv 
  //int numofpix = opencv.width*opencv.height;
  //pix = new int[numofpix];
  pix = opencv.matToARGBPixels(opencv.getColor());
  println(pix.length);
}

//____________________________________________________________________
void draw() {

  image(opencv.getOutput(), 0, 0, width, height);       // show the result

  loadPixels();
  for (int i = 0; i < pix.length; i++) {
    pixels[i] = pix[i];
  }
  updatePixels();
}
