float cellsize = 16;
void setup(){
  size(800,400,P3D);
}
void draw(){
  translate(width/2,height/2);
  rotateX(radians(-30));
  rotateY(radians(30));
  pushMatrix();
  rotateX(PI/2);
  rectMode(CENTER);
  rect(0,0,16*cellsize,16*cellsize);
  popMatrix();
  translate(0,-3*cellsize);
  box(cellsize,6*cellsize,cellsize);
}
