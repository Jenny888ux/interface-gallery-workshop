
class Puppbone {
  float h, w, ang, pscl, sm, offY, posy, maxh;
  PImage im;
  PVector vp1, vp2;


  Puppbone(PImage i, PVector p1, PVector p2, float mult, float off, float mh) {  // VerletParticle2D p1, VerletParticle2D p2) {
    im = i;
    vp1 = p1;
    vp2 = p2;
    w = im.width;
    h = im.height;
    pscl = w/h; //(float)im.width/ im.height;
    sm = mult;
    offY = off;
    maxh = mh;
  }

  void update() {
    // draw pupp_piece 
    h = vp1.dist(vp2) * sm;
    h = min(h,maxh); // constrain
    w = h*pscl;
    PVector temp = new PVector(vp1.x, vp1.y);
    ang = temp.sub(vp2).heading();
    posy = lerp(0, h, offY);
  }

  void dibuja() {
    //fill(0);
    //ellipse(vp1.x, vp1.y, 20, 20);
    //line(vp1.x, vp1.y, vp2.x, vp2.y);
    pushMatrix();
    translate(vp1.x, vp1.y);
    rotate(PI/2+ang);
    image(this.im, -this.w/2, -posy, this.w, this.h );
    //noFill();
    //rect(0,0,w, h);
    popMatrix();
  }
}
