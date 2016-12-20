int res, cellsize, cellspacing, gridsize;

void setup(){
  size(800,400,P3D);
  colorMode(HSB);
  res      = 30;
  cellsize = 20;
  cellspacing = 8;
  gridsize = res*cellsize+(res-1)*cellspacing; 
}
void draw(){
  background(0);//,255,255);
  translate(width/2,height/2);
  //rotateY(radians(frameCount));
  rotateX(radians(-20));
  //rotateX(radians(frameCount));
  //noStroke();lights();
  translate(-gridsize/2, 0, -gridsize/2);
  for(int i=0; i<res; i++){
    for(int j=0; j<res; j++){
      float x = map(i,0,res,0,TWO_PI)+radians(frameCount*1);
      float z = map(j,0,res,0,TWO_PI)+radians(frameCount*1);
      //float dy = 50*tan(x*1)*tan(z);
      float dy = 50*sin(x*1)*tan(z);
      pushMatrix();
      translate(i*(cellsize+cellspacing),dy,j*(cellsize+cellspacing));
      //rotateY(radians(45));
      fill( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
      box(cellsize);
      box(cellsize/5,cellsize*4,cellsize/5);
      popMatrix();
    }
  }
  //autosave();
}
void keyPressed(){
  if(keyCode==32){
    saveFrame("../render/3dgrids_005b_####.png");
  }  
}
