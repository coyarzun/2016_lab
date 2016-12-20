float cellsize = 16;
void setup(){
  size(800,400,P3D);
  colorMode(HSB);
}
void draw(){
  background(196);
  translate(width/2,height/2);
  rotateX(radians(-30));//+frameCount));
  rotateY(radians(30));//frameCount));
  
  //lights();
  pointLight(0, 255, 255, 16*cellsize, 16*cellsize, 16*cellsize);
  
  pushMatrix();
  rotateX(PI/2);
  rectMode(CENTER);
  rect(0,0,16*cellsize,16*cellsize);
  popMatrix();
  translate(0,-3*cellsize);
  box(cellsize,6*cellsize,cellsize);
}
