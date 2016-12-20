int res, cellsize, gridsize;

void setup(){
  size(800,400,P3D);
  res      = 30;
  cellsize = 20;
  gridsize = res*cellsize; 
}
void draw(){
  background(0);
  translate(width/2,height/2);
  rotateX(radians(-20));
  translate(-gridsize/2, 0, -gridsize/2);
  for(int i=0; i<res; i++){
    for(int j=0; j<res; j++){
      float x = map(i,0,res,0,TWO_PI);
      float z = map(j,0,res,0,TWO_PI);
      float dy = 50*sin(x+radians(frameCount*1))*cos(z);
      pushMatrix();
      translate(i*cellsize,dy,j*cellsize);
      fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      box(cellsize);
      popMatrix();
    }
  }
  //autosave();
}
void keyPressed(){
  if(keyCode==32){
    saveFrame("../render/3dgrids_003b_####.png");
  }  
}
