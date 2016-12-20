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
  textFont(font,8);
}
void draw(){
  background(255);fill(0);
  text("helloworld", 8, 8);
  translate(width/2,height/2);
  beginShape();
  for(int j=0; j<rows; j++){
    for(int i=0; i<cols; i++){
      float x,y,z;
      x = map(i,0,cols,-cellw*cols/2.0,+cellw*cols/2.0);
      y = map(j,0,rows,-cellh*rows/2.0,+cellh*rows/2.0);
      z = 0;
      vertex(x,y,z);
    }
  }
  endShape(CLOSE);
}
