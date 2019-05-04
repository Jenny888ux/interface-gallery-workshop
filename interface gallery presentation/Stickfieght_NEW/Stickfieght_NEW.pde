
import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;
import processing.video.*;

KinectPV2 kinect;
Movie movie;
//Skeleton [] skeleton;




float scl = 1.98; // from  kinectDepthImage 512 x 424 to screen Coburg 1400 X 840 (5:3) 
int tr = 193; //translate X + 193
PImage bg;//Joes_Garage.jpg
ArrayList<ParticleSystem> systems;

float xpos_left;
float ypos_left;

float xpos_right;
float ypos_right;



//______________________________________________________________________________________________
void setup() {
  // for Panasonic PT - DS 100X ::: 1400 X 1050 (4:3) 
  // 1400 X 840 (5:3) = screen Coburg
  size(1400, 840, P3D); 
  frameRate(20);
   systems = new ArrayList<ParticleSystem>();



  movie = new Movie(this, "Hintergrund.mp4");
  movie.loop();



  kinect = new KinectPV2(this);
  // map 2d joints positions with kinectDepthImage 512 x 424
  kinect.enableSkeletonDepthMap(true); 
  kinect.init();

 
}
void movieEvent(Movie m) {
  m.read();
}
//______________________________________________________________________________________________
void draw() {
  //background(bg); //(255);
  image(movie, 0, 0, width, height);
  translate(400, 300);
  //get the skeletons as an Arraylist of KSkeletons
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

 

 
  //individual joints
  for (int j = 0; j < skeletonArray.size(); j++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(j);
    //if the skeleton is being tracked compute the skleton joints
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      
  xpos_left  = joints[KinectPV2.JointType_WristLeft].getX();
  ypos_left  = joints[KinectPV2.JointType_WristLeft].getY();
  xpos_right  = joints[KinectPV2.JointType_WristRight].getX();
  ypos_right  = joints[KinectPV2.JointType_WristRight].getY();
   
   
      for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
   }

systems.add(new ParticleSystem(1, new PVector(xpos_left, ypos_left)));
systems.add(new ParticleSystem(1, new PVector(xpos_right, ypos_right)));



      color col  = skeleton.getIndexColor();
        fill(col);
        stroke(col);
        strokeWeight(35);
        drawBody(joints);

      }
    }
  }
