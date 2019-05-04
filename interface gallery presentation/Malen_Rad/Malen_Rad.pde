import KinectPV2.KJoint;
import KinectPV2.*;
KinectPV2 kinect;
ArrayList<PVector> hands;


int varH;
PImage Hintergrund;
PImage blume;

//___________________________________________________________
void setup() {

  size(1400, 840, P3D); //, P2D);
  Hintergrund = loadImage ("Hintergrund.jpg");
  Hintergrund.resize(width, height);
  image(Hintergrund, 0, 0);

  blume = loadImage("blume.png");
  blume.resize(60, 60);

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

  kinect.init(); //Initialisierung

  hands = new ArrayList<PVector>();
}


//________________________________________________________
void draw() {

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      //noFill();
      //noStroke();
      //drawBody(joints);

      noStroke();


      fill(varH, 100, 100, 80);
      colorMode(HSB, 100);
      varH ++;
      if (varH >100) {
        varH = 0;
      }

      ellipse(joints[KinectPV2.JointType_HandRight].getX(), joints[KinectPV2.JointType_HandRight].getY(), 50, 50); //rechte Hand


      image(blume, joints[KinectPV2.JointType_FootRight].getX(), joints[KinectPV2.JointType_FootRight].getY());

      fill(#FFFFFF, 100);
      ellipse(joints[KinectPV2.JointType_FootLeft].getX(), joints[KinectPV2.JointType_FootLeft].getY(), 30, 30); 

      float mx = joints[KinectPV2.JointType_HandLeft].getX();
      float my = joints[KinectPV2.JointType_HandLeft].getY();
      int l = 200;

      beginShape();
      texture(Hintergrund);
      vertex(mx, my, mx, my);
      vertex(mx+l, my, mx+l, my);
      vertex(mx+l, my+l, mx+l, my+l);
      vertex(mx, my+l, mx, my+l);
      endShape(CLOSE);
    }
  }
}
