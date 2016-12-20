int rows, cols;
float radioMayor, radioMenor;
boolean zoom;

void setup(){
  size(800,400,P3D);
  colorMode(HSB);
  cols = 36*2;
  rows = 18*2;
  radioMayor  = 200;
  radioMenor = 190;

}
void draw(){
  background(0);//196);//0);//196);//0);
  translate(width/2,height/2);
  if(!zoom)scale(0.5);
  //rotateX(radians(30));
  rotateX(-radians(30+frameCount));
  //rotateY(radians(frameCount));
  float da = TWO_PI/cols;
  float db = TWO_PI/rows;
  noFill();stroke(240,255,255);
  beginShape(QUAD_STRIP);//strokeWeight(10);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      float cellsize = 20;
      float radioMayorss = radioMayor;//*cos(frameCount*0.0125*j*db);//frameCount*0.0125
      float radioMenorsss = radioMenor*cos(0.5*i*da);//frameCount*0.0125//frameCount*0.0125
      float t = i*da;
      float u = j*db;//map((i)%cols,0,cols,0,TWO_PI);
      float x = radioMayor*cos(t)*sin(u);
      float z = radioMayor*sin(t);
      float y = 0;//radioMayor*sin(t)*sin(u);
      x+=radioMenorsss*cos(u);
      y+=radioMenorsss*sin(u);
      
      
      float t2 = (i+1)*da;
      float u2 = (j+1)*db;//map((i)%cols,0,cols,0,TWO_PI);
      float x2 = radioMayor*cos(t2)*sin(u2);
      float z2 = radioMayor*sin(t2);
      float y2 = 0;
      x2+=radioMenorsss*cos(u2);
      y2+=radioMenorsss*sin(u2);
      
      vertex(x,y,z);
      vertex(x2,y2,z2);
      //pushMatrix();
      //rotateY(i*da);
      //translate(radioMayorss,0,0);
      //rotateZ(j*db);
      //rotateZ(map((i)%cols,0,cols,0,TWO_PI));
      //translate(radioMenorsss,0,0);
      //popMatrix();
    }
  }
  endShape(CLOSE);
//  if(recording){
//    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
//    println("saving zqnce");
//  }
}
//boolean recording;
//String filename = "toroid_020";
//void keyPressed(){
//  if(keyCode==32)recording=!recording;
//  if(key=='s'){
//    saveFrame("../stills/"+filename+"_####.png");
//    println("still saved");
//  }
//  if(key=='z')zoom=!zoom;
//}
