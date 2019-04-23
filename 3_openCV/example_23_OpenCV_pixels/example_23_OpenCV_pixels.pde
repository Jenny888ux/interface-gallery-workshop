/**
 * talleres CCE mariana carranza
 * Example 23: OpenCV_MovieCapture ::: template
 * by mariana carranza.  
 * my cam 640 x 480,  my mov 320 x 240  
 *
 *http://atduskgreg.github.io/opencv-processing/reference/
 */

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

//Capture video;       // capture
Movie video;           //  movie
OpenCV opencv;

void setup() {
  size(320, 240);
  //video = new Capture(this, 640/2, 480/2);      // open video capture
  video = new Movie(this, "eye.mov");           // or movie
  opencv = new OpenCV(this, 640/2, 480/2);

  //video.start();       // capture
  //video.loop();           //  movie loop
  video.play();           //  movie play one time
}

//------------------------------------------
void draw() {
  opencv.loadImage(video);           // grab frame from camera | read a new frame
  image(opencv.getOutput(), 0, 0); 
  PVector loc = opencv.max();

  stroke(255, 0, 0);
  strokeWeight(4);
  noFill();
  ellipse(loc.x, loc.y, 10, 10);
}

//------------------------------------------ capture
/*void captureEvent(Capture c) {
 c.read();
 }*/

//------------------------------------------ movie
void movieEvent(Movie m) {
  m.read();
}
