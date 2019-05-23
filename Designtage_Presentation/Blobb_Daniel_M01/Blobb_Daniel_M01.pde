/*interface gallery workshop 2019
 * example using kinectv2, opencv, fisica
 */

import KinectPV2.*;
import gab.opencv.*;
import java.awt.Rectangle;

KinectPV2 kinect;
OpenCV opencv;

// kinect DepthMaskImg size = 512 x 424

boolean foundUsers = false;

ArrayList<FPoly> polys;




//_______________________________________________________________
void setup() {
  size(512, 424);
  // limit the frame rate
  frameRate(25);

  kinect = new KinectPV2(this);
  opencv = new OpenCV(this, 512, 424);

  kinect.enableBodyTrackImg(true);
  kinect.enableDepthMaskImg(true);
  kinect.enableDepthImg(true);
  kinect.enablePointCloud(true);

  opencv.startBackgroundSubtraction(5, 3, 0.5);
  opencv.useColor();

  kinect.init();

  initFisica();
  polys = new ArrayList<FPoly>();
}

//_______________________________________________________________
void draw() {
  background(0);


  //image(kinect.getDepthImage(), 0, 0);


  opencv.loadImage(kinect.getPointCloudDepthImage());
  opencv.gray();


  opencv.updateBackground();
  image(opencv.getSnapshot(), 0, 0); 
  PImage xx = opencv.getSnapshot();

  opencv.dilate();
  opencv.erode();
  noFill();
  stroke(255, 127, 0);
  strokeWeight(3);
  /* for (Contour contour : opencv.findContours()) {
   contour.draw();
   } */

  //image(kinect.getBodyTrackImage(), 0, 0);

  opencv.loadImage(kinect.getBodyTrackImage()); 
  opencv.invert();



  // just to control or you can use it ...
  // image(opencv.getSnapshot(), 0, 0);

  // FBlob = empty array
  if (polys.size()>0) {
    for (int i = 0; i < polys.size(); i ++) {
      FPoly c = polys.get(i);
      world.remove(c); 
      polys.remove(i);
    }
  }

  ArrayList<Contour> contours = opencv.findContours(false, false);

  if (contours.size() > 0) {
    for (Contour contour : contours) {

      contour.setPolygonApproximationFactor(5);
      if (contour.getPolygonApproximation().numPoints()> 30 && contour.getPolygonApproximation().area() > 2500) {  //(contour.numPoints() > 50) {

        // stroke(0, 200, 200);
        // strokeWeight(3);
        // beginShape();
        poly = new FPoly();
        poly.setStatic(true);
        poly.setRestitution(2); //0.7
        poly.setDrawable(false);

        for (PVector point : contour.getPolygonApproximation ().getPoints()) {
          try {
            poly.vertex(point.x, point.y);//hier skalieren
            //vertex(point.x, point.y);
          }          
          catch(Exception e) {
            return;
          }
        }
        //endShape();
        if (poly!=null) {
          try {
            polys.add(poly);
            world.add(poly);
          }
          catch(Exception e) {
            return;
          }
        }
        // I use the Poly for fisic simulation but I draw the opencv.contour
        contour.draw();
      }
    }
  }
    updateFisica(xx);
}
