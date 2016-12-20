//based on toroid:020xc_glitched

PGraphics pg;
int       rows, cols;
float     radioMayor, radioMenor;

void setup(){
  size(1024,512,P3D);//800,400,P3D);
  cols = 36*2*5;
  rows = 18*2*5;
  radioMayor  = 100;
  radioMenor  = 90;
  pg = createGraphics(width,height,P3D);
  s  = createShape();
  drawToroid(s);
}
void drawToroid(PShape s){
  float da = TWO_PI/cols;
  float db = TWO_PI/rows;
  s.beginShape(POINTS);
  s.colorMode(HSB);
  s.stroke(240,255,255);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*da);
      translate(radioMayor,0,0);
      rotateZ(j*db);
      rotateZ(map((i)%cols,0,cols,0,TWO_PI));
      float radioMenorsss = radioMenor*cos(0.5*i*da);
      //radioMenorsss += random(100);
      translate(radioMenorsss,0,0);
      float cellsize = 20;
      float x = modelX(0,0,0);
      float y = modelY(0,0,0);
      float z = modelZ(0,0,0);
      popMatrix();
      //s.stroke( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      s.vertex(x,y,z);
    }
  }
  s.endShape(CLOSE);
}
void glitchRoutine(){
  //copy(mouseX,0,1,height,mouseX,0,width-mouseX,height);
  int mouseX = (int)random(width);
  for(int i=0; i<height; i++){
    stroke(get(mouseX,i));
    line(mouseX,i,width-1,i);
  }
}
PShape s; 
void draw(){
  //drawToroid(s);
  colorMode(HSB);
  background(0);
  pushMatrix();
  translate(width/2,height/2);
  rotateY(PI/2);rotateZ(-PI/2);
  rotateX(radians(frameCount*1*1));
  scale(4);
  
  shape(s, 0,0);
  popMatrix();
  //image(pg,0,0);
  glitchRoutine();

  if(recording){
    saveFrame("../_render/_animated/"+sketchName+"/"+sketchName+"_####.png");
    framesToSave--;
    println("Remaining frames: "+framesToSave);
    if(framesToSave==0)recording = false;
  }
  
}

String      sketchName = getClass().getSimpleName();
boolean     recording;
int         framesToSave = 5*30;

void keyPressed() {
  if (keyCode==32)recording=true;
  if (key=='s') {
    saveFrame("../_render/_stills/"+sketchName+"_####.png");
    println("still saved");
  }
}
