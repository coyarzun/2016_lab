import ddf.minim.*;
int  hsteps = 36/2;
int  vsteps = 18/2;
float amp = 16*1;
ArrayList <PVector> [][] p;
Minim minim;
//AudioInput in;
AudioPlayer in;

PGraphics pg;

void setup() {
  size(1920, 1920/2, P3D);
  colorMode(HSB);
  minim = new Minim(this);
  //in = minim.getLineIn();
  in = minim.loadFile("marcus_kellis_theme.mp3");
  in.loop();
  
  p  = new ArrayList[hsteps][vsteps];
  for(int i=0; i<hsteps; i++){
    for(int j=0; j<vsteps; j++){
      p[i][j] = new ArrayList();
    }
  }
  pg = createGraphics(width,height,P3D);
  
}
void update() {
  for(int i=0; i<hsteps; i++){
    for(int j=0; j<vsteps; j++){
      p[i][j].add( new PVector(0, 0, 2*abs(in.left.get(0)*amp)) );
    }
  }
}
void drawInBuffer(PGraphics pg){
  pg.beginDraw();
  pg.colorMode(HSB);
  pg.background(0);
  pg.translate(width/2, height/2);
  pg.rotateX(radians(60));
  pg.rotateY(radians(frameCount));
  for (int i=0; i<hsteps; i++){
    for (int j=0; j<vsteps; j++){
      float longa = i*TWO_PI/float(hsteps);
      float lat   = j*TWO_PI/float(vsteps);
      for(int k=0; k<p[i][j].size(); k++){
        pg.pushMatrix();
        pg.rotateY(longa);
        pg.rotateZ(lat);
        float rrr = p[i][j].get(k).y*sin(0.5*lat);//*cos(1*longa);
        pg.translate( 0, rrr );
        float cellsize = p[i][j].get(k).z;
        pg.fill(map(cellsize,0,amp,0,255),255,255);
        pg.stroke(0);
        pg.box(cellsize);
        pg.popMatrix();
        p[i][j].get(k).y+=8*4;
        if(p[i][j].get(k).y>300*2)p[i][j].remove(k);
      }
    }
  }
  pg.endDraw();
  pg.updatePixels();
}
void glitchRoutine(PGraphics pg){
  //loadPixels();
  pg.beginDraw();
  int w = mouseY;
  for(int i=0; i<height; i++){
    pg.stroke(pg.get(mouseX,i));
    pg.line(0,i,mouseX,i);
    pg.stroke(pg.get(mouseX+w,i));
    pg.line(mouseX+w ,i,width,i);
  }
  pg.endDraw();
}
void glitchRoutinex(){
  //loadPixels();
  int w = mouseY;
  for(int i=0; i<height; i++){
    stroke(get(mouseX,i));
    line(0,i,mouseX,i);
    stroke(get(mouseX+w,i));
    line(mouseX+w ,i,width,i);
  }
  //pg.updatePixels();
}

void draw(){ 
  background(0);
  update();
  drawInBuffer(pg);
  
  glitchRoutine(pg);
  image(pg,0,0);

  if(recording){
    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}

boolean recording;
String filename = "shockwaves_009_playFileX";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../../workshopRenders/"+filename+"_####.png");
    println("still saved");
  }
  //if(key=='z')zoom=!zoom;
}
