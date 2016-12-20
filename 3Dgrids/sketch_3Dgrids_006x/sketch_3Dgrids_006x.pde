int res, cellsize, cellspacing, gridsize;

void setup(){
  size(800,400,P3D);
  colorMode(HSB);
  res      = 30;
  cellsize = 10;
  cellspacing = 10;
  gridsize = res*cellsize+(res-1)*cellspacing;
 background(0); 
}
void draw(){
  
  translate(width/2,height/2);
  rotateY(radians(frameCount*1));
  rotateX(radians(-10));
  //scale(0.2);
  //rotateX(radians(frameCount));
  //noStroke();lights();
  translate(-gridsize/2, 0, -gridsize/2);
  for(int i=0; i<res; i++){
    for(int j=0; j<res; j++){
      float x = map(i,0,res,0,TWO_PI)+radians(frameCount*1);
      float z = map(j,0,res,0,TWO_PI)+radians(frameCount*1);
      float dy = 50*tan(x)*tan(z);
      //float dy = 50*sin(x)*cos(z);
      pushMatrix();
      translate(i*(cellsize+cellspacing),dy,j*(cellsize+cellspacing));
      //rotateY(radians(45));
      //fill(map(i,0,res,0,255),map(dy,-50,50,255,0),map(j,0,res,0,255));
      //stroke(map(i,0,res,0,255),map(dy,-50,50,255,0),map(j,0,res,0,255));noFill();
      box(cellsize);
      box(cellsize/5,cellsize*4,cellsize/5);
      popMatrix();
    }
  }
  //if(frameCount>23*4)autosave();
}
void keyPressed(){
  if(keyCode==32){
    saveFrame("../render/3dgrids_006x_####.png");
  }  
}
