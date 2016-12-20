int steps;
float cycles;
float radio,da,ds;

void setup(){
  size(800,400,P3D);
  steps = 72;
  cycles = 0.5*1;
  radio = 160;
  da = TWO_PI/float(steps);
  ds = radio*da;
}
void draw(){
  background(196);
  translate(width/2,height/2);
  rotateX(radians(60));
  //rotateZ(radians(frameCount));
  lights();
  for(int i=0; i<steps;i++){
    pushMatrix();
    rotateZ(i*da);
    translate(radio,0);
    rotateY(map(i,0,steps,0,cycles*TWO_PI));
    box(5,ds,40);
    popMatrix();
  }
  pushMatrix();
  rotateZ(radians(frameCount));
  translate(radio,0);
  rotateY(map(frameCount,0,360,0,cycles*TWO_PI));
  translate(20,0);
  float cellsize = 20;
  box(cellsize);
  box(cellsize/5,cellsize*4,cellsize/5);
  popMatrix();
}
