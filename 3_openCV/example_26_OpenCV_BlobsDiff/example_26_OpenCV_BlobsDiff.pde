//http://atduskgreg.github.io/opencv-processing/reference/

import gab.opencv.*;
import processing.video.*;

Movie video;
OpenCV opencv;

ArrayList<PVector> points; 

PImage bg;

void setup() {
  size(720, 480);

  video = new Movie(this, "blobs.mov");
  opencv = new OpenCV(this, 320, 240);

  bg = createImage(opencv.width, opencv.height, RGB);

  video.loop();
  video.play();

  points = new ArrayList<PVector>();

  noFill();
  strokeWeight(2);
}

void draw() {
  background(0);
  image(video, 0, 0);  
  opencv.loadImage(video);
  image(bg, 0, opencv.height);

  opencv.diff(bg);
  image(opencv.getSnapshot(), opencv.width, 0);

 // opencv.gray();
  opencv.contrast(1.3);
  opencv.brightness(-50);
  opencv.threshold(60);
  opencv.blur(3);

  opencv.dilate();
  opencv.erode();

  image(opencv.getSnapshot(), opencv.width, opencv.height);


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

  bg = opencv.getSnapshot(opencv.getR()); // imput RGBA
}
