import gab.opencv.*;

OpenCV opencv;
// scale to 1400, 840 //// kinect color 1920, 1080 // kscl = 0.777 // ktrlt = -47
float scl = 1.98;
int trns = 260;
void initCont() {
  opencv = new OpenCV(this, 512, 424);
}

void updateCont() {
  opencv.loadImage(kinect.getBodyTrackImage()); 
  opencv.invert();
  ArrayList<Contour> contours = opencv.findContours(false, false);
  noFill();
  stroke(255);
  if (contours.size() > 0) {
    pushMatrix();
    translate(trns, 0);
    scale(scl);
    for (Contour contour : contours) {

      contour.draw();
      /*
      beginShape();
       for (PVector point : contour.getPolygonApproximation().getPoints()) {
       vertex(point.x, point.y);
       }
       endShape();*/
    }

    popMatrix();
  }
}
