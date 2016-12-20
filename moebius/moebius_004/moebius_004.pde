int steps;
float cycles;
float radio,da,ds;

void setup(){
  size(800,400,P3D);
  steps = 36;
  cycles = 0.5;
  radio = 160;
  da = TWO_PI/float(steps);
  ds = radio*da;
}
void draw(){
  background(196);
  translate(width/2,height/2);
  
  rotateY(radians(frameCount));
  lights();
  for(int i=0; i<steps;i++){
    pushMatrix();
    rotateZ(i*da);
    translate(radio,0);
    rotateY(map(i,0,steps,0,cycles*TWO_PI));
    box(10,ds,40);
    popMatrix();
  }
}
