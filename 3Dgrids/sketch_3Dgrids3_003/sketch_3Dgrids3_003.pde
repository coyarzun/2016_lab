PVector[] pos;
int latres, lngres;
int cellsize;

void setup() {
  size(800, 400, P3D);
  colorMode(HSB);
  cellsize = 20;
  latres   = 36*2;
  lngres   = 18*2;
  int radio = width/2;
  pos = new PVector[latres*lngres];
  for (int i=0; i<latres; i++) {
    for (int j=0; j<lngres; j++) {
      int   k = j*latres+i;
      float lat = i*(TWO_PI/float(latres));//random(-PI,PI);
      float lng = -PI/2+j*(PI/float(lngres));//random(TWO_PI);
      float r   = radio;
      pos[k] = new PVector(lat, lng, r);
    }
  }
}
void draw() {
  background(196);//0);//,255,255);
  translate(width/2, height/2);
  //scale(.5);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  rotateX(radians(-10));
  float factor = 1.0;//1.1+0.8*sin(radians(frameCount));
  for (int i=0; i<latres; i++) {
    for (int j=0; j<lngres; j++) {
      int   k = j*latres+i;
      pushMatrix();
      rotateY(pos[k].y);
      rotateZ(pos[k].x);
      float r = 1+pos[i].z*sin(pos[i].x+radians(frameCount));//*tan(pos[i].y+radians(frameCount));
      translate(r, 0, 0);
      rotateZ(PI/2);//2);

      fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      //stroke(0,255,255);

      box(cellsize);
      box(cellsize/5, cellsize*4, cellsize/5);
      popMatrix();
    }
  }
}
void keyPressed(){
  if(keyCode==32){
    saveFrame("../render/3dgrids3_003_####.png");
  }  
}

