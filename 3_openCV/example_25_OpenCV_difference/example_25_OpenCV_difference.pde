// http://atduskgreg.github.io/opencv-processing/reference/

import gab.opencv.*;
//import org.opencv.imgproc.Imgproc;
//import org.opencv.core.Core;
//import org.opencv.core.Mat;

import processing.video.*;

Capture video;       // capture
//Movie video;           //  movie
OpenCV opencv;

// cam 640, 480
// mov 320, 240

PImage bg;


//------------------------------------------
void setup() {

  size(640, 480);
  video = new Capture(this, 640/2, 480/2);      // open video capture
  //video = new Movie(this, "eye.mov");           // or load movie
  opencv = new OpenCV(this, 640/2, 480/2);

  bg = createImage(opencv.width, opencv.height, RGB);
  // opencv.useColor();

  video.start();       // capture
  //video.loop();           //  movie loop
  //video.play();           //  movie play one time
}

//------------------------------------------
void draw() {
  background(255);

  opencv.loadImage(video);           // grab frame from camera | read a new frame

  //image(video, 0, 0 );              // display image video processing
  //image(opencv.getInput(), 0, 0);   // display image video processing
  image(opencv.getSnapshot(), 0, 0);  // display image video openCV

  opencv.diff(bg);

  image(opencv.getOutput(), opencv.width, 0);
  image(bg, 0, opencv.height);
}

//------------------------------------------ capture
void captureEvent(Capture c) {
  c.read();
}

//------------------------------------------ movie
/*void movieEvent(Movie m) {
 m.read();
 }*/

void mouseClicked() {

  bg = opencv.getSnapshot(opencv.getR()); // imput RGBA
}
