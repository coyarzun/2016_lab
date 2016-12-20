int rows, cols;
float radioMayor, radioMenor;
float cellwidth, cellheight;

void setup(){
  size(400,400,P3D);
  cols = 36;
  rows = 18;
  radioMayor  = 150;
  radioMenor = 60;
  
}
void draw(){
  background(196);
  translate(width/2,height/2);
  rotateX(radians(30));
  float da = TWO_PI/cols;
  for(int i=0; i<cols; i++){
    pushMatrix();
    rotateY(i*da);
    translate(radioMayor,0,0);
    noFill();ellipse(0,0,2*radioMenor,2*radioMenor);
    popMatrix();
  }
  float db = TWO_PI/rows;
  for(int i=0; i<rows; i++){
    float r = radioMayor+radioMenor*cos(i*db);
    float z = radioMenor*sin(i*db);
    pushMatrix();
    rotateX(PI/2);
    translate(0,0,z);
    noFill();ellipse(0,0,2*r,2*r);
    popMatrix();
  }
  if(recording){
    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}
boolean recording;
String filename = "toroid_002";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
//  if(key=='z')zoom=!zoom;
}
