import KinectPV2.KJoint;
import KinectPV2.*;
KinectPV2 kinect;
ArrayList<PVector> hands;


int varH;
PImage Hintergrund;
PImage blume, eraser, foot;

PGraphics malen;

float kscl = 0.777;
int ktrlt = 47;

//___________________________________________________________
void setup() {

  size(1400, 840, P2D); //, P2D);
  malen = createGraphics(width, height, P2D);

  Hintergrund = loadImage ("Hintergrund.jpg");
  Hintergrund.resize(width, height);
  image(Hintergrund, 0, 0);

  blume = loadImage("blume.png");
  blume.resize(100, 100); //(60, 60);
  eraser = loadImage("eraser.png");
  foot =  loadImage("footL.png");

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true); // kinect color 1920, 1080 // kscl = 0.777 // ktrlt = -47
  kinect.enableColorImg(true);
  kinect.enableBodyTrackImg(true);

  kinect.init(); //Initialisierung

  hands = new ArrayList<PVector>();
  initCont();
}


//________________________________________________________
void draw() {

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      // color col  = skeleton.getIndexColor();
      malen.beginDraw();
      malen.noStroke();
      malen.fill(varH, 100, 100, 80);
      malen.colorMode(HSB, 100);
      varH ++;
      if (varH >100) {
        varH = 0;
      }

      malen.ellipse(joints[KinectPV2.JointType_HandRight].getX()*kscl-ktrlt, joints[KinectPV2.JointType_HandRight].getY()*kscl, 50, 50); //rechte Hand
      malen.image(blume, joints[KinectPV2.JointType_FootRight].getX()*kscl-ktrlt, joints[KinectPV2.JointType_FootRight].getY()*kscl);

      //malen.fill(#FFFFFF, 100);
      //malen.ellipse(joints[KinectPV2.JointType_FootLeft].getX()*kscl-ktrlt, joints[KinectPV2.JointType_FootLeft].getY()*kscl, 30, 30);
      malen.image(foot, joints[KinectPV2.JointType_FootLeft].getX()*kscl-ktrlt, joints[KinectPV2.JointType_FootLeft].getY()*kscl);

      /*
      float mx = joints[KinectPV2.JointType_HandLeft].getX();
       float my = joints[KinectPV2.JointType_HandLeft].getY();
       int l = 200;
       
       malen.beginShape();
       malen.texture(Hintergrund);
       malen.vertex(mx, my, mx, my);
       malen.vertex(mx+l, my, mx+l, my);
       malen.vertex(mx+l, my+l, mx+l, my+l);
       malen.vertex(mx, my+l, mx, my+l);
       malen.endShape(CLOSE);
       */
      malen.fill(0, 0, 0);
      malen.image(eraser, joints[KinectPV2.JointType_HandLeft].getX()*kscl-ktrlt, joints[KinectPV2.JointType_HandLeft].getY()*kscl);

      malen.endDraw();

      image(Hintergrund, 0, 0);
      //image(malen, 0, 0);
      blend(malen, 0, 0, width, height, 0, 0, width, height, ADD);
      
      updateCont();

    }
  }
}
