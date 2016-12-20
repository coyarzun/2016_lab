import ddf.minim.*;
  int  hsteps = 36/2;
  int  vsteps = 18/2;

ArrayList <PVector> [][] p;
Minim minim;
AudioInput in;

void setup() {
  size(displayWidth, displayHeight, P3D);//800, 400, P3D);
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
  //scale(width/1200);
  float amp = 16*4;
  for(int i=0; i<hsteps; i++){
    for(int j=0; j<vsteps; j++){
      p[i][j].add( new PVector(0, 0, 2*abs(in.left.get(0)*amp)) );
    }
  }
  
  background(0);
  translate(width/2, height/2);
  //rotateX(radians(60));
  rotateY(radians(frameCount));
  for (int i=0; i<hsteps; i++){
    for (int j=0; j<vsteps; j++){
      float longa = i*TWO_PI/float(hsteps);
      float lat   = j*TWO_PI/float(vsteps);
      for(int k=0; k<p[i][j].size(); k++){
        pushMatrix();
        rotateY(longa);
        rotateZ(lat);
        float rrr = p[i][j].get(k).y;//*sin(0.5*lat)*cos(1*longa);
        translate( 0, rrr );
        //ellipse(0, 0, p[i][j].get(k).z, p[i][j].get(k).z);
        float cellsize = p[i][j].get(k).z;
        box(cellsize);
        //box(cellsize/5,cellsize*4,cellsize/5);
        popMatrix();
        //}
        p[i][j].get(k).y+=8;
        if(p[i][j].get(k).y>300)p[i][j].remove(k);
      }
    }
  }
  if (recording) {
    saveFrame("../animated/"+filename+"/"+filename+"_"+nf(frameCount, 4)+"png");
    println("saving zqnce");
  }
}

boolean recording;
String filename = "shockwaves_008";
void keyPressed() {
  if (keyCode==32)recording=!recording;
  if (key=='s') {
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
  //if(key=='z')zoom=!zoom;
}

