//http://atduskgreg.github.io/opencv-processing/reference/

import gab.opencv.*;
import processing.video.*;

Movie video;
OpenCV opencv;
boolean bg;
ArrayList<PVector> points;  

void setup() {
  size(720, 480);

  video = new Movie(this, "blobs.mov");
  opencv = new OpenCV(this, 320, 240);

  //opencv.startBackgroundSubtraction(5, 3, 0.5);

  video.loop();
  video.play();

  points = new ArrayList<PVector>();

  noFill();
}

void draw() {
  background(0);
  image(video, 0, 0);  
  opencv.loadImage(video);

  //if(bg) {opencv.updateBackground();}

  opencv.gray();
  opencv.contrast(1.3);
  opencv.brightness(-50);
  opencv.threshold(60);
  opencv.blur(3);

  opencv.dilate();
  opencv.erode();

  image(opencv.getSnapshot(), opencv.width, 0);


  for (Contour contour : opencv.findContours()) {
    //contour.getConvexHull(); // Contour
    //contour.getBoundingBox(); // Rectangle java
    points = contour.getPoints();
    stroke(255, 0, 0);
    contour.draw();
    stroke(0, 255, 0);
    contour.getPolygonApproximation().draw();
  }
}

void movieEvent(Movie m) {
  m.read();
}

void mouseClicked() {
  bg = !bg;
}
