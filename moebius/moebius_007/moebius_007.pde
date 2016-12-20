int steps;
float cycles;
float radio,da,ds;

void setup(){
  size(800,400,P3D);
  //frameRate(10);
  steps = 36*2;
  cycles = 0.5*1;
  radio = 160;
  da = TWO_PI/float(steps);
  ds = radio*da;
}
void draw(){
  float frs = 1;
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
    //fill(radians(frameCount)%TWO_PI-i*da<da?0:255);
    if( int(radians(frameCount*frs)%TWO_PI/da) == i ) fill(0);
    else fill(255);
    box(5,ds,40);
    popMatrix();
  }
  pushMatrix();
  rotateZ(radians(frameCount*frs));
  translate(radio,0);
  rotateY(map(frameCount*frs,0,360,0,cycles*TWO_PI));
  translate(20,0);
  float cellsize = 20;
  fill(255);
  box(cellsize);
  box(cellsize/5,cellsize*4,cellsize/5);
  popMatrix();
}
