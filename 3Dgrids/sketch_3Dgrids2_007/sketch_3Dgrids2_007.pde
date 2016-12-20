PVector[] pos;
int cellsize;

void setup(){
  size(800,400,P3D);
  colorMode(HSB);
  cellsize = 20;
  int radio = width/2;
  pos = new PVector[1000];
  for(int i=0; i<pos.length; i++){
    float lat = random(-PI,PI);
    float lng = random(TWO_PI);
    float r   = radio;
    pos[i] = new PVector(lat,lng,r);
  }  
}
void draw(){
  background(196);//0);//,255,255);
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  rotateX(radians(-10));
  float factor = 1.0;//1.1+0.8*sin(radians(frameCount));
  for(int i=0; i<pos.length; i++){
    pushMatrix();
    rotateY(pos[i].y);
    rotateZ(pos[i].x);
    float r = 1+pos[i].z*tan(pos[i].x+radians(frameCount));
    translate(r,0,0);
    rotateZ(PI/2);//2);
    
    fill( (i%2==0)? 0:255);
    //stroke(0,255,255);
    
    box(cellsize);
    box(cellsize/5,cellsize*4,cellsize/5);
    popMatrix();
  }
}
void keyPressed(){
  if(keyCode==32){
    saveFrame("../render/3dgrids2_007_####.png");
  }  
}

