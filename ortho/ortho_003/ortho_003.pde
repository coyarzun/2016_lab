void setup() {
  size(400, 400, P3D);
}
void draw() {
  background(192);
  //frustum(0, width, 0, height, 10, 200);
  //float fov = PI/3.0;
  //float cameraZ = (height/2.0) / tan(fov/2.0);
  //perspective(fov, float(width)/float(height),cameraZ/10.0, cameraZ*10.0);
  if (!mousePressed)ortho();
  else perspective();
  translate(width/2, height/2);
  pushMatrix();
  rotateX(radians(-30));
  rotateY(radians(frameCount));
  
  box(20);
  box(4,80,4);
  for (int j=0; j<6; j++) {
    float r = (j+1)*40;
      for (int i=0; i<36; i++) {
      pushMatrix();
      rotateY((i*PI/18.0)+j*(PI/10.0));
      translate(r, 0, 0);
      box(10);
      box(2,40,2);
      popMatrix();
    }
  }

  popMatrix();
}

