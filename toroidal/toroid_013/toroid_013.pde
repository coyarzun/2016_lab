int rows, cols;
float radioMayor, radioMenor;

void setup(){
  size(800,400,P3D);
  cols = 36*2;
  rows = 18*2;
  radioMayor  = 200;
  radioMenor = 200;

}
void draw(){
  background(196);//0);//196);//0);
  translate(width/2,height/2);
  //scale(.5);
  //rotateX(-radians(30+frameCount));
  rotateY(radians(frameCount));
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
      rotateZ(map((i)%cols,0,cols,0,TWO_PI));//4*radians(map(i,0,cols,0,radians(30))));
      translate(radioMenor,0,0);
      float cellsize = 20;
      //if(frameCount%2==0)
      fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      //else fill( ((i%2!=0&&j%2==0)||(i%2!=0&&j%2!=0))? 0:255);
      box(cellsize);
      //box(cellsize/5, cellsize/5, cellsize*4);
      //box(cellsize/5, cellsize*4, cellsize/5);
      box(cellsize*4, cellsize/5, cellsize/5);
      popMatrix();
    }
  }
  if(recording){
    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}
boolean recording;
String filename = "toroid_013";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
//  if(key=='z')zoom=!zoom;
}
