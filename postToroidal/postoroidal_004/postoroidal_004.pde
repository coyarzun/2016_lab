int rows, cols;
float radioMayor, radioMenor;
boolean zoom;
PImage fbck;
void setup(){
  size(800,400,P3D);
  colorMode(HSB);
  cols = 36*2;
  rows = 18*2;
  radioMayor  = 200;
  radioMenor = 190;
  fbck = createImage(width,height,ARGB);
  
}
void draw(){
  background(0);//fbck);//196);//0);//196);//0);
  translate(width/2,height/2);
  if(zoom)scale(0.265);
  else scale(0.5);
  //rotateX(radians(30));
  //rotateX(-radians(30+frameCount));
  rotateY(radians(frameCount));
  float da = TWO_PI/cols;
  float db = TWO_PI/rows;
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      pushMatrix();
      rotateY(i*da);
      float radioMayorss = radioMayor*cos(frameCount*0.0125*j*db);//frameCount*0.0125
      translate(radioMayorss,0,0);
      rotateZ(j*db);
      rotateZ(map((i)%cols,0,cols,0,TWO_PI));
      float radioMenorsss = radioMenor*cos(frameCount*0.0125*i*da);//frameCount*0.0125
      translate(radioMenorsss,0,0);
      float cellsize = 20;
      
      
      rotateX(radians(8*frameCount));
      fill(240, 255, 255);
      
      stroke(0);
      //noStroke();
      //fill(255);
      fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0: color(map(i,0,cols,0,255),255,255));//color(240, 255, 255));
      
      box(cellsize/10,cellsize,cellsize);
      
      fill(0);
      stroke(color((map(i,0,cols,0,255)+frameCount)%256,255,255));//240, 255, 255);
      
      box(cellsize*2, cellsize/5, cellsize/5);
      popMatrix();
    }
  }

  if(recording){
    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
  int k = 16*4;
  fbck.copy(g,k,k,width-2*k,height-2*k,0,0,width,height);
  //fbck.updatePixels();
}
boolean recording;
String filename = "postoroidal_004";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
  if(key=='z')zoom=!zoom;
}
