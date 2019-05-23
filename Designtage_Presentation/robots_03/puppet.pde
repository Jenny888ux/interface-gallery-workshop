
class Puppet {

  PVector[] pjoints;
  Puppbone[] pbones;
  int id;
  boolean isalive, isnew;


  Puppet() {
    pjoints = new PVector[20];
    pbones = new Puppbone[15]; 

    for (int i = 0; i < pjoints.length; i ++) {
      pjoints[i] = new PVector(0, 0);
    }
    // I change the position of arms and body in the array because draw order

    // images: head, neck, body, upperarm, arm, hand, thigth, lowerleg, feet
    // head = 0
    PImage iaux = pieces[0][(int)random(rows)]; 
    pbones[0] = new Puppbone(iaux, pjoints[0], pjoints[1], 3.5, 0.75, width/2);
    // neck = 1
    iaux = pieces[1][(int)random(rows)]; 
    pbones[1] = new Puppbone(iaux, pjoints[1], pjoints[2], 1, 0.5, width/6);
    // upperarm = 3 L
    iaux = pieces[3][(int)random(rows)]; 
    pbones[2] = new Puppbone(iaux, pjoints[3], pjoints[4], 1.1, 0.1, width/2);
    // arm = 4 L
    iaux = pieces[4][(int)random(rows)]; 
    pbones[3] = new Puppbone(iaux, pjoints[4], pjoints[5], 1.1, 0.1, width/2);
    // hand = 5 L
    iaux = pieces[5][(int)random(rows)]; 
    pbones[4] = new Puppbone(iaux, pjoints[5], pjoints[6], 2, 0.1, width/3);
    // body = 2
    iaux = pieces[2][(int)random(rows)]; 
    pbones[5] = new Puppbone(iaux, pjoints[2], pjoints[11], 1.4, 0.1, width/1.2);
    // upperarm = 3 R
    iaux = pieces[3][(int)random(rows)]; 
    pbones[6] = new Puppbone(iaux, pjoints[7], pjoints[8], 1.1, 0.1, width/2);
    // arm = 4 R
    iaux = pieces[4][(int)random(rows)]; 
    pbones[7] = new Puppbone(iaux, pjoints[8], pjoints[9], 1.1, 0.1, width/2);
    // hand = 5 R
    iaux = pieces[5][(int)random(rows)]; 
    pbones[8] = new Puppbone(iaux, pjoints[9], pjoints[10], 2, 0.1, width/2);
    // thigth = 6 L
    iaux = pieces[6][(int)random(rows)]; 
    pbones[9] = new Puppbone(iaux, pjoints[12], pjoints[13], 1.1, 0.1, width/2);
    // lowerleg = 7 L
    iaux = pieces[7][(int)random(rows)]; 
    pbones[10] = new Puppbone(iaux, pjoints[13], pjoints[14], 1.1, 0.1, width/2);
    // feet = 8 L
    iaux = pieces[8][(int)random(rows)]; 
    pbones[11] = new Puppbone(iaux, pjoints[14], pjoints[15], 2, 0.1, width/3);
    // thigth = 6 R
    iaux = pieces[6][(int)random(rows)]; 
    pbones[12] = new Puppbone(iaux, pjoints[16], pjoints[17], 1.1, 0.1, width/2);
    // lowerleg = 7 R
    iaux = pieces[7][(int)random(rows)]; 
    pbones[13] = new Puppbone(iaux, pjoints[17], pjoints[18], 1.1, 0.1, width/2);
    // feet = 8 R
    iaux = pieces[8][(int)random(rows)]; 
    pbones[14] = new Puppbone(iaux, pjoints[18], pjoints[19], 2, 0.1, width/3);
  }

  void update() {
    for (Puppbone b : pbones) {
      b.update();
    }
  }
  void display() {
    for (int i = pbones.length-1; i >= 0; i--) {
      pbones[i].dibuja();
    }
  }
  void reset() {
  }
}
