int rows, cols;
float radioMayor, radioMenor;

void setup(){
  size(800,400,P3D);
  cols = 36;
  rows = 18;
  radioMayor  = 250;
  radioMenor = 120;

}
void draw(){
  background(196);
  translate(width/2,height/2);
  //rotateX(radians(30+frameCount*.2));
  rotateY(radians(frameCount*.5));
  float da = TWO_PI/cols;
  float db = TWO_PI/rows;
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*da);
      translate(radioMayor,0,0);
      float dx = radioMenor*cos(j*db);
      float dy = radioMenor*sin(j*db);
      rotateZ(j*db);
      translate(radioMenor,0,0);
      float cellsize = 10;
      fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      box(cellsize);
      box(cellsize/5, cellsize/5, cellsize*4);
      popMatrix();
    }
  }
  if(recording){
    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}
boolean recording;
String filename = "toroid_006";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
//  if(key=='z')zoom=!zoom;
}
