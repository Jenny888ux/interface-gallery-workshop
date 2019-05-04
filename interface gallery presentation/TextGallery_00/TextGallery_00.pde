import fisica.*;
import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;
import gab.opencv.*;

KinectPV2 kinect;
OpenCV opencv;

String msg = "";
FWorld world;
PFont font;

Texto[] nombres;
int countn = 0;
ArrayList<FCircle> circles;

float scl = 1.98; // from  kinectDepthImage 512 x 424 to screen Coburg 1400 X 840 (5:3) 
int tr = 193; //translate X + 193

void setup() {
  size(1400, 840, P2D); 
  frameRate(20);
  smooth();
  kinect = new KinectPV2(this);
  opencv = new OpenCV(this, 512, 424);
  kinect = new KinectPV2(this);

  //Enables depth and Body tracking (mask image)
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  kinect.enableBodyTrackImg(true);

  kinect.init();

  Fisica.init(this);
  circles = new ArrayList<FCircle>();

  font = loadFont("FreeMonoBold-24.vlw");
  textFont(font, 30);

  world = new FWorld();
  world.setEdges(this, color(120));
  world.remove(world.top);
  world.setGravity(0, 500);

  Texto t = new Texto("Type and ENTER");
  t.setPosition(width/2, height/2);
  t.setRotation(random(-1, 1));
  t.setFill(255);
  t.setNoStroke();
  t.setRestitution(0.75);
  world.add(t);

  nombres = new Texto[10];
  nombres[0] = new Texto("hello code");
  nombres[1] = new Texto("creapolis");
  nombres[2] = new Texto("interface.gallery");
  nombres[3] = new Texto("lorenz");
  nombres[4] = new Texto("daniel");
  nombres[5] = new Texto("annika");
  nombres[6] = new Texto("fabian");
  nombres[7] = new Texto("lucas");
  nombres[8] = new Texto("mariana");
  nombres[9] = new Texto("stephan");

  for (int i= 0; i < nombres.length; i++) {
    Texto tt = nombres[i];
    tt.setPosition(width/2, random(height/2));
    tt.setRotation(random(-1, 1));
    tt.setFill(255);
    tt.setNoStroke();
    tt.setRestitution(0.75);
    //world.add(tt);
  }

  FBox box = new FBox(800, 50);
  box.setPosition(width/2, height - 50);
  box.setStatic(true);
  box.setFill(0, 255, 0);
  box.setNoStroke();
  box.setRestitution(0);
  box.setDrawable(true);
  world.add(box);
}

void draw() {
  background(0);
  opencv.loadImage(kinect.getBodyTrackImage()); 
  opencv.invert();
  // FCircle = empty array
  if (circles.size()>0) {
    for (int i = 0; i < circles.size(); i ++) {
      FCircle c = circles.get(i);
      world.remove(c); 
      circles.remove(i);
    }
  }

  //get the skeletons as an Arraylist of KSkeletons
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

  //individual joints
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    //if the skeleton is being tracked compute the skleton joints
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      float cx = joints[KinectPV2.JointType_FootLeft].getX();
      float cy = joints[KinectPV2.JointType_FootLeft].getY();
      FCircle cir = new FCircle(60);
      cir.setPosition(cx*scl +tr, cy*scl);
      cir.setStatic(true);
      cir.setRestitution(0.7);
      cir.setDrawable(false);
      circles.add(cir);
      world.add(cir);

      cx = joints[KinectPV2.JointType_FootRight].getX();
      cy = joints[KinectPV2.JointType_FootRight].getY();
      FCircle cirr = new FCircle(60);
      cirr.setPosition(cx*scl +tr, cy*scl);
      cirr.setStatic(true);
      cirr.setRestitution(0.7);
      cirr.setDrawable(false);
      circles.add(cirr);
      world.add(cirr);
    }
  }
  ArrayList<Contour> contours = opencv.findContours(false, false);
  stroke(255);
  noFill();
  if (contours.size() > 0) {
    for (Contour contour : contours) {
      pushMatrix();
      translate(tr, 0);
      scale(scl);
      contour.draw();
      popMatrix();
    }
  }

  world.step();
  world.draw(this);
}

void mouseClicked() {
  if (countn < nombres.length) {
    Texto t = nombres[countn];
    world.add(t);
  }
  countn ++;
}


void keyPressed() {
  if (key == ENTER) {
    if (!msg.equals("")) {
      Texto t = new Texto(msg);
      t.setPosition(width/2, height/2);
      t.setRotation(random(-1, 1));
      t.setFill(255);
      t.setNoStroke();
      t.setRestitution(0.65);
      world.add(t);
      msg = "";
    }
  } else {
    msg+= key;
  }
}
