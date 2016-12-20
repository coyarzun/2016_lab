int res, cellsize, gridsize;

void setup(){
  size(800,400,P3D);
  res      = 20;
  cellsize = 10;
  gridsize = res*cellsize; 
}
void draw(){
  translate(width/2,height/2);
  rotateX(radians(-30));
  translate(-gridsize/2, 0, -gridsize/2);
  for(int i=0; i<res; i++){
    for(int j=0; j<res; j++){
      pushMatrix();
      translate(i*cellsize,0,j*cellsize);
      box(cellsize);
      popMatrix();
    }
  }
}
void keyPressed(){
  if(keyCode==32){
    saveFrame("../render/3dgrids_001_####.png");
  }  
}
