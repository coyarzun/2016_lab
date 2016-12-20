void setup(){
  size(800,400,P3D);
}
void draw(){
  background(196);
  translate(width/2,height/2);
  
  double x,y,z;
  float a = 100;
  float v = 0;
  strokeWeight(2);
  beginShape();
  for(int t=0; t<TWO_PI; t+=radians(10)){
    for(int u=0; u<TWO_PI; u+=radians(10)){
      x = a*Math.sinh(v)*cos(t)/(Math.cosh(v)-cos(u));
      y = a*Math.sinh(v)*sin(t)/(Math.cosh(v)-cos(u));
      z = a*sin(u)/(Math.cosh(v)-cos(u));
      
      vertex((float)x,(float)y,(float)z);
    }
  }
  endShape(CLOSE);
}

