import KinectPV2.*;
import gab.opencv.*;

KinectPV2 kinect;
OpenCV opencv;

// kinect DepthMaskImg size = 512 x 424

boolean foundUsers = false;

void setup() {
  size(1024, 424);

  kinect = new KinectPV2(this);
  opencv = new OpenCV(this, 512, 424);

  kinect.enableBodyTrackImg(true);
  kinect.enableDepthMaskImg(true);

  kinect.init();
}

void draw() {
  background(255);

  //image(kinect.getBodyTrackImage(), 0, 0);

  opencv.loadImage(kinect.getBodyTrackImage()); 
  opencv.invert();
  // just to control
  image(opencv.getSnapshot(), 512, 0);

  ArrayList<Contour> contours = opencv.findContours(false, false);

  if (contours.size() > 0) {
    for (Contour contour : contours) {

      contour.setPolygonApproximationFactor(1);
      if (contour.numPoints() > 50) {

        stroke(0, 200, 200);
        strokeWeight(3);
        beginShape();

        for (PVector point : contour.getPolygonApproximation ().getPoints()) {
          vertex(point.x, point.y);
        }
        endShape();
      }
    }
  }
}
