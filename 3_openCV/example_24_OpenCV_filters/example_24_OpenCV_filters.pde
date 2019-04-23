/**
 * talleres CCE mariana carranza
 * Example 22: OpenCV_MovieCapture ::: template
 * by mariana carranza.   
 * brightness, contrast, blur, threshold, invert, convert and flip. 
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
  
  size(960, 720);
  //video = new Capture(this, 320, 240);      // open video capture
  video = new Movie(this, "eye.mov");           // or load movie
  opencv = new OpenCV(this, 320, 240);

  //opencv.useColor();

  //video.start();       // capture
  //video.loop();           //  movie loop
  video.play();           //  movie play one time
  
  initControls();
}

//------------------------------------------
void draw() {
  background(0);

  opencv.loadImage(video);           // grab frame from camera | read a new frame
  image(opencv.getSnapshot(), 0, 0);

  opencv.contrast(contrast);
  image(opencv.getSnapshot(), video.width, 0);      // display image video openCV

  opencv.brightness(bright); //((int)map(mouseX, 0, width, -255, 255));
  image(opencv.getSnapshot(), 2*video.width, 0);    // display image video openCV


  opencv.gray();                       // gray all the images kill all colors
  opencv.loadImage(video); 
  image(opencv.getSnapshot(), 0, video.height);

  opencv.threshold(threshold);
  //opencv.adaptiveThreshold(591, 1);  // adaptiveThreshold function only works on gray images
  
  opencv.blur(blur);  
  image(opencv.getSnapshot(), video.width, video.height);

  //opencv.loadImage(video);

  opencv.flip(flip); // 0 vertical, 1 horizontal
  
  opencv.invert();                     // invert function only works on gray 
  image(opencv.getSnapshot(), 2*video.width, video.height);
  
  opencv.useColor(RGB);                // use with gray() to revive
}

//------------------------------------------ capture
/*void captureEvent(Capture c) {
 c.read();
 }*/

//------------------------------------------ movie
void movieEvent(Movie m) {
  m.read();
}
