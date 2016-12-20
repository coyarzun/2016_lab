import ddf.minim.*;
  int  hsteps = 36;
  int  vsteps = 18;

ArrayList <PVector> [][] p;
Minim minim;
AudioInput in;

void setup() {
  size(800, 400, P3D);
  minim = new Minim(this);
  in = minim.getLineIn();
  p  = new ArrayList[hsteps][vsteps];
  for(int i=0; i<hsteps; i++){
    for(int j=0; j<vsteps; j++){
      p[i][j] = new ArrayList();
    }
  }
}
void draw() {
  
  float amp = 32;
  for(int i=0; i<hsteps; i++){
    for(int j=0; j<vsteps; j++){
      p[i][j].add( new PVector(0, 0, 2*abs(in.left.get(0)*amp)) );
    }
  }
  
  background(196);
  translate(width/2, height/2);

  for (int i=0; i<hsteps; i++){
    for (int j=0; j<vsteps; j++){
      for(int k=0; k<p[i][j].size(); k++){
        pushMatrix();
        rotateY(i*TWO_PI/float(hsteps));
        rotateZ(j*TWO_PI/float(vsteps));
        translate( p[i][j].get(k).x, p[i][j].get(k).y );
        //ellipse(0, 0, p[i][j].get(k).z, p[i][j].get(k).z);
        box(p[i][j].get(k).z);
        popMatrix();
        //}
        p[i][j].get(k).y+=8;
        if(p[i][j].get(k).y>200)p[i][j].remove(k);
      }
    }
  }
  if (recording) {
    saveFrame("../animated/"+filename+"/"+filename+"_"+nf(frameCount, 4)+"png");
    println("saving zqnce");
  }
}

boolean recording;
String filename = "shockwaves_004";
void keyPressed() {
  if (keyCode==32)recording=!recording;
  if (key=='s') {
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
  //if(key=='z')zoom=!zoom;
}

