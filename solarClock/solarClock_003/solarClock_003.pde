float cellsize = 24;
void setup(){
  size(800,400,P3D);
  colorMode(HSB);
}
void draw(){
  background(110,128,255);
  translate(width/2,height/2);
  rotateX(radians(-30));//+frameCount));
  rotateY(radians(30));//frameCount));
  
  //lights();
  ambientLight(240,120,64);
  pushMatrix();
  float r = 16*cellsize;
  float a = radians(frameCount);
  float x = r*cos(a);
  float y = r*sin(a);
  float z = 0;
  translate(x, y, 0);
  pointLight(240, 255, 255, 0,0,0);
  popMatrix();
  
  pushMatrix();
  rotateX(PI/2);
  rectMode(CENTER);
  rect(0,0,16*cellsize,16*cellsize);
  popMatrix();
  
  translate(0,-3*cellsize);
  box(cellsize,6*cellsize,cellsize);
  rotateY(PI/4);
  box(cellsize,6*cellsize,cellsize);
}
