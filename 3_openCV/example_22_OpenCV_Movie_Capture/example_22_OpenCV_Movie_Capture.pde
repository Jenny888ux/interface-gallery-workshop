/**
 * talleres CCE mariana carranza
 * Example 22: OpenCV_MovieCapture ::: template
 * by mariana carranza.   
 *
 *http://atduskgreg.github.io/opencv-processing/reference/ 
 */
import gab.opencv.*;
import processing.video.*;

//Capture video;       // capture
Movie video;           //  movie
OpenCV opencv;

// cam 640, 480
// mov 320, 240


//------------------------------------------
void setup() {

  size(640, 480);
  //video = new Capture(this, 640/2, 480/2);      // open video capture
  video = new Movie(this, "eye.mov");           // or load movie
  opencv = new OpenCV(this, 640/2, 480/2);

  opencv.useColor();

  //video.start();       // capture
  //video.loop();           //  movie loop
  video.play();           //  movie play one time
}

//------------------------------------------
void draw() {
  scale(2);
  opencv.loadImage(video);           // grab frame from camera | read a new frame

  //image(video, 0, 0 );              // display image video processing
  image(opencv.getOutput(), 0, 0);    // display image video openCV
}

//------------------------------------------ capture
/*void captureEvent(Capture c) {
 c.read();
 }*/

//------------------------------------------ movie
void movieEvent(Movie m) {
  m.read();
}
