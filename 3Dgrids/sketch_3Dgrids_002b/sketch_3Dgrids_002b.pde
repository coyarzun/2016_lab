int res, cellsize, gridsize;

void setup(){
  size(800,400,P3D);
  res      = 20;
  cellsize = 10;
  gridsize = res*cellsize; 
}
void draw(){
  background(196);
  translate(width/2,height/2);
  rotateX(radians(-30));
  translate(-gridsize/2, 0, -gridsize/2);
  for(int i=0; i<res; i++){
    for(int j=0; j<res; j++){
      float x = map(i,0,res,0,TWO_PI);
      float z = map(j,0,res,0,TWO_PI);
      float dy = 20*sin(x+radians(frameCount))*cos(z);
      fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      pushMatrix();
      translate(i*cellsize,dy,j*cellsize);
      box(cellsize);
      popMatrix();
    }
  }
  //autosave();
}

void keyPressed(){
  if(keyCode==32){
    saveFrame("../render/3dgrids_002b_####.png");
  }  
}
