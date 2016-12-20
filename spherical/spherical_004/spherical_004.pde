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
float  r, phi, azimut;
int    cols, rows;
float  cellw, cellh;
PImage img;
PFont  font;

void setup(){
  size(800,400,P3D);
  r    = 150;
  cols = 36;
  rows = 18;
  float equator = TWO_PI*r;
  cellw = equator/float(cols);
  cellh = equator/float(2*rows);
  img  = loadImage("../_data/earthspec__buzz.jpg");
  font = loadFont( "../_data/AndaleMono-8.vlw");
  textureMode(NORMAL);
  textFont(font,8);
}
void draw(){
  background(255);fill(0);
  text("helloworld", 8, 8);
  translate(width/2,height/2);
  noFill();
  noStroke();
  beginShape(QUAD_STRIP);
  texture(img);
  for(int j=0; j<rows; j+=1){
    for(int i=0; i<cols; i+=1){
      float x,y,z,tx,ty;
      x = map(i,0,cols,-cellw*cols/2.0,+cellw*cols/2.0);
      y = map(j,0,rows,-cellh*rows/2.0,+cellh*rows/2.0);
      z = 0;
      tx = map(i,0,cols,0,1);
      ty = map(j,0,rows,0,1);
      float x2,y2,z2,tx2,ty2;
      x2 = map(i,0,cols,-cellw*cols/2.0,+cellw*cols/2.0);
      y2 = map(j+1,0,rows,-cellh*rows/2.0,+cellh*rows/2.0);
      z2 = 0;
      tx2 = map(i,0,cols,0,1);
      ty2 = map(j+1,0,rows,0,1);
      vertex(x,y,z,tx,ty);
      vertex(x2,y2,z2,tx2,ty2);
    }
  }
  endShape(CLOSE);
}
