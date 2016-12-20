int rows, cols;
float radioMayor, radioMenor;
boolean zoom;
PImage texture, texture2;
PImage fbck;

void setup(){
  size(800,400,P3D);
  colorMode(HSB);
  cols = 36*2;
  rows = 18*2;
  radioMayor  = 200;
  radioMenor = 190;
  texture = loadImage("../data/wirosk_800x800.jpg");
  texture2 = createImage(800,800,ARGB);
  fbck = createImage(width,height,ARGB);
}
void draw(){
  
  background(fbck);//196);//0);//196);//0);
  processImage(fbck, texture2);
  translate(width/2,height/2);
  if(!zoom)scale(0.75);
  
  lights();
  
  //rotateX(radians(30));
  rotateX(-radians(30+frameCount*0.1));
  
  rotateY(radians(frameCount));
  float da = TWO_PI/cols;
  float db = TWO_PI/rows;
  //noFill();
  stroke(240,(255),255);//random
  
  noStroke();
  strokeWeight(2);
  textureMode(NORMAL);
  beginShape(QUAD_STRIP);//strokeWeight(10);
  texture(texture2);//fbck);//);
  
  for(int i=0; i<cols+1; i++){
    for(int j=0; j<rows+1; j++){
      float cellsize = 20;
      float radioMayorss   = radioMayor;//*cos(frameCount*0.0125*j*db);//frameCount*0.0125
      float fff = 1+sin(radians(frameCount*0.125));
      float radioMenorsss  = radioMenor*cos(fff*i*da);//frameCount*0.0125//frameCount*0.0125
      float radioMenorsss2 = radioMenor*cos(fff*(i+1)*da);//frameCount*0.0125//frameCount*0.0125
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

  int k = 16/2;//16/2;
  int l = 0;//16/4;
  fbck.copy(g,k,l,width-2*k,height-2*l,0,0,width,height);
}
boolean recording;
String filename = "textured_014x";
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../_stills/"+filename+"_####.png");
    println("still saved");
  }
  if(key=='z')zoom=!zoom;
}

void processImage(PImage src, PImage dest){
  src.loadPixels();
  dest.loadPixels();
  float h,s,b,hh;
  for(int i=0; i<src.pixels.length; i++){
    h = hue(src.pixels[i]);
    s = saturation(src.pixels[i]);
    b = brightness(src.pixels[i]);
    hh = b;//map(b,0,100,0,360);
    hh+=frameCount*1; hh%=256;
    dest.pixels[i] = color(hh,255,255);
  }
  dest.updatePixels();
}
