import fisica.*;
FBlob[] blobbs = new FBlob[100];
FWorld world;
FPoly poly;

void initFisica() {

  Fisica.init(this);
  

  
  world = new FWorld();
  world.setGravity(0, 0);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);
  world.remove(world.bottom);

  world.setEdgesRestitution(0.4);
  
    for(int i=0; i<100;i++){
        FBlob b = new FBlob();
        b.setAsCircle(random(0+10, width-10), height-random(400), 20, 20);
        b.setRestitution(2); //0.5
        b.setStroke(0);
        b.setStrokeWeight(0);
        b.setDamping(4);
        b.setFill(random(0, 255),random(0, 255),random(0, 255));
        //b.setFriction(5);
        b.addForce(random(100, 500), random(1,1000));
        blobbs[i] = b;
        world.add(blobbs[i]);
  }
  
}

void updateFisica(PImage x) {

//Blobs

  for(int i=0; i<100;i++){
    
    if(blobbs[i].getX()>510) blobbs[i].setPosition(2,blobbs[i].getY());
    if(blobbs[i].getX()<2) blobbs[i].setPosition(510,blobbs[i].getY());
    if(blobbs[i].getY()>422) blobbs[i].setPosition(blobbs[i].getX(),2);
    if(blobbs[i].getY()<2) blobbs[i].setPosition(blobbs[i].getX(),422);
 // color c = mountains.get(60, 90);
 //if(x.get((int)blobbs[i].getX(),(int)blobbs[i].getY())==255)
// if(blobbs[i].getVelocityY()>2){ blobbs[i].setFill(255,0,0);}
//  else blobbs[i].setFill(0,random(0,255),0);
  blobbs[i].setFill(0,255,0);
  blobbs[i].addForce(random(-30, 30), random(-30,30));
  //blobbs[i].setFill(random(0, 255),random(0, 255),random(0, 255));
  }
  world.step();
  world.draw(this);
}
