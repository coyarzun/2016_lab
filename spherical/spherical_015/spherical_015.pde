/*
https://es.wikipedia.org/wiki/Coordenadas_esf%C3%A9ricas
r, radio
phi, azimut
theta, colatitud;
0<=r<infinito
0<=theta<=PI
0<=phi<=TWO_PI
x=r*sin(theta)*cos(phi);
y=r*sin(theta)*sin(phi);
z=r*cos(theta);
*/
//float  r, phi, azimut;
float r;
int    cols, rows;
float  cellw, cellh;
PImage img, buff1, buff2;
PFont  font;

void setup(){
  size(800,400,P3D);
  r    = 150;
  int m = 4, n=1;
  cols = m*36/n;
  rows = m*18/n;
  float equator = TWO_PI*r;
  cellw = equator/float(cols);
  cellh = equator/float(2*rows);
  //img  = loadImage("../_data/earthspec__buzz.jpg");
  //buff1  = loadImage("../_data/moon_map_002.jpg");
  buff1  = loadImage("../_data/Spec Mask.png");
  buff2  = loadImage("../_data/tc-earth_daymap_surface.jpg");
  //buff2  = loadImage("../_data/earthspec__buzz.jpg");
  font = loadFont( "../_data/AndaleMono-8.vlw");
  textureMode(NORMAL);
  textFont(font,8);
    img = buff1;//frameCount%2==0?buff1:buff2;
  img.filter(INVERT);
}
void draw(){

  background(0);fill(0);
  text("helloworld", 8, 8);
  translate(width/2,height/2);
  lights();
  directionalLight(255,255,255,-1,0,-1);
  rotateY(radians(frameCount));
  rotateX(radians(-30));
  noFill();
  //stroke(238,90,100);strokeWeight(4);//noStroke();
  noStroke();
  
  for(int j=0; j<rows; j++){
    beginShape(QUAD_STRIP);
    texture(img);
    for(int i=0; i<cols+1; i++){
      float x,y,z,tx,ty;
      float theta, phi;
      theta = map(j,0,rows,0,PI);
      phi   = map(i,0,cols,0,TWO_PI);
      x=r*sin(theta)*cos(phi);
      z=r*sin(theta)*sin(phi);
      y=r*cos(theta);
//      x = map(i,0,cols,-cellw*cols/2.0,+cellw*cols/2.0);
//      y = map(j,0,rows,-cellh*rows/2.0,+cellh*rows/2.0);
//      z = 0;
      tx = map(i,0,cols,1,0);
      ty = map(j,0,rows,1,0);
      
      float x2,y2,z2,tx2,ty2;
      float theta2, phi2;
      theta2 = map(j+1,0,rows,0,PI);
      phi2   = map(i,0,cols,0,TWO_PI);
      x2=r*sin(theta2)*cos(phi2);
      z2=r*sin(theta2)*sin(phi2);
      y2=r*cos(theta2);
//      x2 = map(i,0,cols,-cellw*cols/2.0,+cellw*cols/2.0);
//      y2 = map(j+1,0,rows,-cellh*rows/2.0,+cellh*rows/2.0);
//      z2 = 0;
      tx2 = map(i,0,cols,1,0);
      ty2 = map(j+1,0,rows,1,0);
      
      vertex(x,y,z,tx,ty);
      vertex(x2,y2,z2,tx2,ty2);
    }
    endShape(CLOSE);
  }
  
}
