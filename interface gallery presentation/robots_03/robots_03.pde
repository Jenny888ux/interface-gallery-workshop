
import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
//Skeleton [] skeleton;

Puppet[] robots; 
PImage[][] pieces; 
int cols = 9; //head, neck, body, upperarm, arm, hand, thigth, lowerleg, feet
int rows = 3; // number of robots diferents
int[] robotsId = { -65536, -16711936, -16776961, -256, -16711681, -65281};

float scl = 1.98; // from  kinectDepthImage 512 x 424 to screen Coburg 1400 X 840 (5:3) 
int tr = 193; //translate X + 193
PImage bg;//Joes_Garage.jpg

//______________________________________________________________________________________________
void setup() {
  // for Panasonic PT - DS 100X ::: 1400 X 1050 (4:3) 
  // 1400 X 840 (5:3) = screen Coburg
  size(1400, 840, P3D); 
  frameRate(20);
    
  bg = loadImage("Joes_Garage.jpg");
  //bg.resize(width, height);

  kinect = new KinectPV2(this);
  // map 2d joints positions with kinectDepthImage 512 x 424
  kinect.enableSkeletonDepthMap(true); 
  kinect.init();

  // load images in array
  pieces = new PImage[cols][rows];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      pieces[j][i] = loadImage("cosa" + j + i + ".png");  // or something so
    }
  }

  robots = new Puppet [6]; // la misma cantidad de alass que de esquelos = 6 KinectPV2.JointType_HipRight
  for (int i = 0; i < robots.length; i ++) {
    robots[i] = new Puppet();
    robots[i].id = robotsId[i];
  }
}

//______________________________________________________________________________________________
void draw() {
  background(bg); //(255);
  translate(tr, 0);

  //get the skeletons as an Arraylist of KSkeletons
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

  //individual joints
  for (int j = 0; j < skeletonArray.size(); j++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(j);
    //if the skeleton is being tracked compute the skleton joints
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      for (int i = 0; i < robots.length; i++) {
        if ( robots[i].id == col) {   //skeleton.getIndexColor()) {
          robots[i].isalive = true;
          skeletonUpdate(robots[i], joints);

          for (int k = 0; k < robots[i].pjoints.length; k++) {
            // ellipse(robots[i].pjoints[k].x, robots[i].pjoints[k].y, 10, 10);
          }
          robots[i].update();
          robots[i].display();
        }

        //fill(col);
        //stroke(col);
        //drawBody(joints);
      }
    }
  }
}
