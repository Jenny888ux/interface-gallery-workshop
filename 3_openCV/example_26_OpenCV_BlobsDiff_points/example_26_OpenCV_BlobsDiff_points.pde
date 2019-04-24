//http://atduskgreg.github.io/opencv-processing/reference/

import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

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
    stroke(255, 0, 0);
    contour.draw();
    stroke(0, 255, 0);
    contour.getPolygonApproximation().draw();
    stroke(0, 0, 255);
    contour.getConvexHull().draw();
    Rectangle rec = contour.getBoundingBox();
    stroke(0, 255, 255);
    rect((float)rec.getX(), (float)rec.getY(), (float) rec.getWidth(), (float)rec.getHeight());
    stroke(255, 255, 0);
    points = contour.getPolygonApproximation().getPoints(); //contour.getPoints();
    //beginShape();
    float centerx = (float)(rec.getX()+rec.getWidth()*.5);
    float centery = (float)(rec.getY()+rec.getHeight()*.5);
    
    for (PVector point : points) {
      //vertex(point.x, point.y);
      line(point.x, point.y, centerx, centery);
    }
    //endShape();
  }
}

void movieEvent(Movie m) {
  m.read();
}

void mouseClicked() {
  bg = opencv.getSnapshot(opencv.getR()); // imput RGBA
}
