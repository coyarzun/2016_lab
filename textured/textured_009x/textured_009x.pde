int rows, cols;
float radioMayor, radioMenor;
boolean zoom;
PImage texture,texture2;

void setup(){
  size(800,400,P3D);
  colorMode(HSB);
  cols = 36*2*2;
  rows = 18*2*2;
  radioMayor  = 200;
  radioMenor = 190;
  texture = loadImage("../data/wirosk_800x800.jpg");
  texture2 = createImage(800,800,ARGB);
}
void draw(){
  background(0);//196);//0);//196);//0);
  translate(width/2,height/2);
  //if(!zoom)scale(0.5);
  //rotateX(radians(30));
  rotateX(-radians(30+frameCount*0.1));
  //rotateY(radians(frameCount));
  float da = TWO_PI/cols;
  float db = TWO_PI/rows;
  //noFill();
  stroke(240,255,255);
  strokeWeight(3);
  //noStroke();
  //strokeWeight(2);
  textureMode(NORMAL);
  beginShape(POINTS);//QUAD_STRIP);//strokeWeight(10);
  texture(texture2);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      float cellsize = 20;
      float radioMayorss = radioMayor;//*cos(frameCount*0.0125*j*db);//frameCount*0.0125
      float radioMenorsss = radioMenor*cos(1*i*da);//frameCount*0.0125//frameCount*0.0125
      float radioMenorsss2 = radioMenor*cos(1*(i+1)*da);//frameCount*0.0125//frameCount*0.0125
      float t = i*da;
      float u = j*db;//map((i)%cols,0,cols,0,TWO_PI);
      float t2 = (i+1)*da;
      float u2 = (j)*db;//map((i)%cols,0,cols,0,TWO_PI);

      
      float x,y,z;
      float x2,y2,z2;
      float tx, ty, tx2, ty2;
      
      tx = map(i,0,cols,0,1);
      tx2 = map(i+1,0,cols,0,1);
      ty = map(j,0,rows,0,1);
      ty2 = map(j,0,rows,0,1);
      
      pushMatrix();
      rotateY(t);
      translate(radioMayorss,0,0);
      rotateZ(u);
      translate(radioMenorsss,0,0);
      x = modelX(0, 0, 0);
      y = modelY(0, 0, 0);
      z = modelZ(0, 0, 0);
      popMatrix();
      pushMatrix();
      rotateY(t2);
      translate(radioMayorss,0,0);
      rotateZ(u2);
      translate(radioMenorsss2,0,0);
      x2 = modelX(0, 0, 0);
      y2 = modelY(0, 0, 0);
      z2 = modelZ(0, 0, 0);
      popMatrix();

      
      x-=width/2;x2-=width/2;
      y-=height/2;y2-=height/2;


      
      vertex(x,y,z,tx,ty);
      vertex(x2,y2,z2,tx2,ty2);
    }
  }
  endShape(CLOSE);
  if(recording){
    saveFrame("../_animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}
boolean recording;
String filename = "textured_009x";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
  if(key=='z')zoom=!zoom;
}
