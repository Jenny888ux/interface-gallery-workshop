
/**
 kyle mc donald
 <p>Don't move too fast &mdash; you might scare it. Click to forgive and forget.</p>
 +  
 Daniel Shiffman and Thomas Sanchez Lengeling
 Tracking the average location beyond a given depth threshold
 Thanks to Dan O'Sullivan
 
 https://github.com/shiffman/OpenKinect-for-Processing
 http://shiffman.net/p5/kinect/
 **/

import org.openkinect.processing.*;

// Showing how we can farm all the kinect stuff out to a separate class
KinectTracker tracker;


PVector v1;

//*****************************
int n = 5000; // number of cells
float bd = 37; // base line length
float sp = 0.004; // rotation speed step
float sl = .97; // slow down rate

Cell[] all = new Cell[n];


void setup() {
  size(512, 424, P2D); 

  background(#00AFCB);
  stroke(255, 50);

  tracker = new KinectTracker(this);

  for (int i = 0; i < n; i++) {
    float a = i + random(0, PI / 9);
    float r = ((i / (float) n) * (width / 2) * (((n-i) / (float) n) * 3.3)) + random(-3, 3) + 3;
    all[i] = new Cell(int(r*cos(a)) + (width/2), int(r*sin(a)) + (height/2));
  }
}

void draw() {
  //background(255);


  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();
  
  noStroke();
  fill(#00AFCB, 80);
  rect(0, 0, width, height);
  
  // Let's draw the raw location
  v1 = tracker.getPos();
  
  stroke(255, 50);
  for (int i = 0; i < n; i++)
    all[i].sense();


  ellipse(v1.x, v1.y, 20, 20);
  //println(frameRate);

}

void mousePressed() {
  for (int i=0; i<n; i++)
    all[i].c = 0;
}

float det(int x1, int y1, int x2, int y2, int x3, int y3) {
  return (float) ((x2-x1)*(y3-y1) - (x3-x1)*(y2-y1));
}

void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}
