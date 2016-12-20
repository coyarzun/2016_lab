PGraphics pg;
int rows, cols;
float radioMayor, radioMenor;
boolean zoom;

void setup(){
  size(800,400,P3D);
  cols = 36*2;
  rows = 18*2;
  radioMayor  = 200;
  radioMenor = 190;
  pg = createGraphics(width,height,P3D);
}
void drawToroid(PGraphics pg){
  pg.beginDraw();
  pg.background(196);//0);//196);//0);
  pg.translate(width/2,height/2);
  //pg.lights();noStroke();
  if(!zoom)pg.scale(.5);
  //rotateX(-radians(30+frameCount));
  //rotateY(radians(frameCount));
  pg.rotateY(PI/2);pg.rotateZ(-PI/2);
  pg.rotateX(radians(frameCount*1*1));
  float da = TWO_PI/cols;
  float db = TWO_PI/rows;
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pg.pushMatrix();
      pg.rotateY(i*da);
      pg.translate(radioMayor,0,0);
      pg.rotateZ(j*db);
      pg.rotateZ(map((i)%cols,0,cols,0,TWO_PI));
      float radioMenorsss = radioMenor*cos(0.5*i*da);
      pg.translate(radioMenorsss,0,0);
      float cellsize = 20;
      
      pg.fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      
      pg.box(cellsize);
      //box(cellsize/5, cellsize/5, cellsize*4);
      //box(cellsize/5, cellsize*4, cellsize/5);
      pg.box(cellsize*4, cellsize/5, cellsize/5);
      pg.popMatrix();
    }
  }
  pg.endDraw();
}
void glitchRoutine(){
  //copy(mouseX,0,1,height,mouseX,0,width-mouseX,height);
  for(int i=0; i<height; i++){
    stroke(get(mouseX,i));
    line(mouseX,i,mouseX+100,i);
  }
}
void draw(){
  drawToroid(pg);
  image(pg,0,0);
  glitchRoutine();
  if(recording){
    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}
boolean recording;
String filename = "toroid_020xc_glitched";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
  if(key=='z')zoom=!zoom;
}
