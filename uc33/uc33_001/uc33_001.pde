import promidi.*;
PApplet p = this;
UC33 uc33;

void setup(){
  size(800,400,P3D);
  uc33 = new UC33();
}
void draw(){
  uc33.update();
  background(196);  
  uc33.draw();
}


