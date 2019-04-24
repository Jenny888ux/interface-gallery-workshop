// http://atduskgreg.github.io/opencv-processing/reference/

import gab.opencv.*;
import processing.video.*;

Movie video;
OpenCV opencv;
boolean bg;

void setup() {
  size(720, 480);
  video = new Movie(this, "blobs.mov");
  opencv = new OpenCV(this, 320, 240);

  // parameter cv::BackgroundSubtractorMOG
  // (int history-Frames, int nMixtures-Gaussian blur, double backgroundRatio-Segmentation)
  //opencv.startBackgroundSubtraction(5, 3, 0.5);

  video.loop();
  video.play();
}

void draw() {
  background(0);
  image(video, 0, 0);  
  opencv.loadImage(video);

  //if(bg) {opencv.updateBackground();}
  //opencv.dilate();
  //opencv.erode();

  opencv.gray();
  opencv.contrast(1.3);
  opencv.brightness(-50);
  opencv.threshold(60);
  opencv.blur(3);
  opencv.dilate();
  opencv.erode();

  image(opencv.getSnapshot(), opencv.width, 0);

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void movieEvent(Movie m) {
  m.read();
}

void mouseClicked() {
  bg = !bg;
}
