/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 
 KinectPV2, Kinect for Windows v2 library for processing
 
 Skeleton color map example.
 Skeleton (x,y) positions are mapped to match the color Frame
 */

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

ArrayList<PVector> hands;
ArrayList<FCircle> myCirc;

//_____________________________________________________________________
void setup() {
  size(1920, 1080, P3D);

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

  kinect.init();

  hands = new ArrayList<PVector>(); // for hands positions to use like mouse
  myCirc = new ArrayList<FCircle>();

  initFisica();
}

//_____________________________________________________________________
void draw() {
  background(0);

  image(kinect.getColorImage(), 0, 0, width, height);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  // hands = empty array
  for (int i = 0; i < hands.size(); i ++) {
    hands.remove(i);
  }
  // FCircle = empty array
 if (myCirc.size()>0) {
    for (int i = 0; i < myCirc.size(); i ++) {
      FBody c = myCirc.get(i);
      world.remove(c); 
      myCirc.remove(i);
    }
  }


  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      drawBody(joints);

      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);

      hands.add(new PVector(joints[KinectPV2.JointType_HandRight].getX(), joints[KinectPV2.JointType_HandRight].getY()));
      hands.add(new PVector(joints[KinectPV2.JointType_HandLeft].getX(), joints[KinectPV2.JointType_HandLeft].getY()));
    }
  }

  // now I have all the hands

  for (int i = 0; i < hands.size(); i ++) {
    PVector h = hands.get(i);
    FCircle b = new FCircle(80);
    b.setPosition(h.x, h.y);
    b.setRestitution(0.7);
    b.setDamping(0.01);
    b.setNoStroke();
    b.setFill(255, 200);
    world.add(b);
    myCirc.add(b);
  }

  updateFisica();

  fill(255, 0, 0);
  text(frameRate, 50, 50);
}
