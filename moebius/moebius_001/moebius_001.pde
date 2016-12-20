int steps;
int cycles;
float radio,da,ds;

void setup(){
  size(800,400,P3D);
  steps = 36;
  cycles = 1;
  radio = 160;
  da = TWO_PI/float(steps);
  ds = radio*da;
}
void draw(){
  background(196);
  translate(width/2,height/2);
  
  for(int i=0; i<steps;i++){
    rotateY(i*da);
    translate(radio,0);
    box(10,ds,40);
  }
}
