
void skeletonUpdate(Puppet robot, KJoint[] joints) {

  robot.pjoints[0].set((joints[KinectPV2.JointType_Head].getX())*scl, joints[KinectPV2.JointType_Head].getY()*scl);
  robot.pjoints[1].set((joints[KinectPV2.JointType_Neck].getX())*scl, joints[KinectPV2.JointType_Neck].getY()*scl);

  robot.pjoints[2].set((joints[KinectPV2.JointType_SpineShoulder].getX())*scl, joints[KinectPV2.JointType_SpineShoulder].getY()*scl);

  robot.pjoints[3].set((joints[KinectPV2.JointType_ShoulderLeft].getX())*scl, joints[KinectPV2.JointType_ShoulderLeft].getY()*scl);
  robot.pjoints[4].set((joints[KinectPV2.JointType_ElbowLeft].getX())*scl, joints[KinectPV2.JointType_ElbowLeft].getY()*scl);
  robot.pjoints[5].set((joints[KinectPV2.JointType_WristLeft].getX())*scl, joints[KinectPV2.JointType_WristLeft].getY()*scl);
  robot.pjoints[6].set((joints[KinectPV2.JointType_HandTipLeft].getX())*scl, joints[KinectPV2.JointType_HandTipLeft].getY()*scl);

  robot.pjoints[7].set((joints[KinectPV2.JointType_ShoulderRight].getX())*scl, joints[KinectPV2.JointType_ShoulderRight].getY()*scl);
  robot.pjoints[8].set((joints[KinectPV2.JointType_ElbowRight].getX())*scl, joints[KinectPV2.JointType_ElbowRight].getY()*scl);
  robot.pjoints[9].set((joints[KinectPV2.JointType_WristRight].getX())*scl, joints[KinectPV2.JointType_WristRight].getY()*scl);
  robot.pjoints[10].set((joints[KinectPV2.JointType_HandTipRight].getX())*scl, joints[KinectPV2.JointType_HandTipRight].getY()*scl);

  robot.pjoints[11].set((joints[KinectPV2.JointType_SpineBase].getX())*scl, joints[KinectPV2.JointType_SpineBase].getY()*scl);

  robot.pjoints[12].set((joints[KinectPV2.JointType_HipLeft].getX())*scl, joints[KinectPV2.JointType_HipLeft].getY()*scl);
  robot.pjoints[13].set((joints[KinectPV2.JointType_KneeLeft].getX())*scl, joints[KinectPV2.JointType_KneeLeft].getY()*scl);
  robot.pjoints[14].set((joints[KinectPV2.JointType_AnkleLeft].getX())*scl, joints[KinectPV2.JointType_AnkleLeft].getY()*scl);
  robot.pjoints[15].set((joints[KinectPV2.JointType_FootLeft].getX())*scl, joints[KinectPV2.JointType_FootLeft].getY()*scl);
  
  robot.pjoints[16].set((joints[KinectPV2.JointType_HipRight].getX())*scl, joints[KinectPV2.JointType_HipRight].getY()*scl);
  robot.pjoints[17].set((joints[KinectPV2.JointType_KneeRight].getX())*scl, joints[KinectPV2.JointType_KneeRight].getY()*scl);
  robot.pjoints[18].set((joints[KinectPV2.JointType_AnkleRight].getX())*scl, joints[KinectPV2.JointType_AnkleRight].getY()*scl);
  robot.pjoints[19].set((joints[KinectPV2.JointType_FootRight].getX())*scl, joints[KinectPV2.JointType_FootRight].getY()*scl);
}
