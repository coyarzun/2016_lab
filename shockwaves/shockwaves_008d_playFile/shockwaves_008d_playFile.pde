import ddf.minim.*;
  int  hsteps = 36/2;
  int  vsteps = 18/2;

ArrayList <PVector> [][] p;
Minim minim;
//AudioInput in;
AudioPlayer in;

void setup() {
  size(800, 400, P3D);
  colorMode(HSB);
  minim = new Minim(this);
  //in = minim.getLineIn();
  in = minim.loadFile("marcus_kellis_theme.mp3");
  in.play();
  
  p  = new ArrayList[hsteps][vsteps];
  for(int i=0; i<hsteps; i++){
    for(int j=0; j<vsteps; j++){
      p[i][j] = new ArrayList();
    }
  }
}
void draw() {
  
  float amp = 16*1;
  for(int i=0; i<hsteps; i++){
    for(int j=0; j<vsteps; j++){
      p[i][j].add( new PVector(0, 0, 2*abs(in.left.get(0)*amp)) );
    }
  }
  
  background(0);
  translate(width/2, height/2);
  rotateX(radians(30));
  rotateY(radians(frameCount));
  for (int i=0; i<hsteps; i++){
    for (int j=0; j<vsteps; j++){
      float longa = i*TWO_PI/float(hsteps);
      float lat   = j*TWO_PI/float(vsteps);
      for(int k=0; k<p[i][j].size(); k++){
        pushMatrix();
        rotateY(longa);
        rotateZ(lat);
        float rrr = p[i][j].get(k).y*sin(0.5*lat);//*cos(1*longa);
        translate( 0, rrr );
        //ellipse(0, 0, p[i][j].get(k).z, p[i][j].get(k).z);
        float cellsize = p[i][j].get(k).z;
        //noFill();
        stroke(map(cellsize,0,amp,0,255),255,255);
        fill(0);
        box(cellsize);
        //box(cellsize/5,cellsize*4,cellsize/5);
        popMatrix();
        //}
        p[i][j].get(k).y+=8*4;
        if(p[i][j].get(k).y>300*2)p[i][j].remove(k);
      }
    }
  }
  if (recording) {
    saveFrame("../animated/"+filename+"/"+filename+"_"+nf(frameCount, 4)+"png");
    println("saving zqnce");
  }
}

boolean recording;
String filename = "shockwaves_008d";
void keyPressed() {
  if (keyCode==32)recording=!recording;
  if (key=='s') {
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
  //if(key=='z')zoom=!zoom;
}

