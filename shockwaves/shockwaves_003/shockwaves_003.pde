import ddf.minim.*;
ArrayList <PVector> p;
Minim minim;
AudioInput in;

void setup(){
  size(800,400,P3D);
  minim = new Minim(this);
  in = minim.getLineIn();
  p  = new ArrayList();
}
void draw(){
  background(196);
  //stroke(255);
  float amp = 32;
  for(int i=0; i<2*amp; i++){
    //line( i, amp+in.left.get(i)*amp, i+1, amp+in.left.get(i+1)*amp );
    //line(amp+in.left.get(i)*amp, 2*amp-i, amp+in.left.get(i+1)*amp, 2*amp-i-1 );
  }
  p.add ( new PVector(0, 0, 2*abs(in.left.get(0)*amp) ));
  translate(width/2,height/2);
  int steps = 36;
  for(int i=0; i<p.size(); i++){
    for(int j=0; j<steps; j++){
      pushMatrix();
      rotateZ(j*TWO_PI/float(steps));
      translate( p.get(i).x, p.get(i).y );
      ellipse(0,0,p.get(i).z,p.get(i).z);
      popMatrix();
    }
    p.get(i).y+=8;
    if(p.get(i).y>height)p.remove(i);
  }
}
