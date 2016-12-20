class Egg{
  PVector pos;
  
  Egg(){
  }
  void setup(float x, float y){
    pos = new PVector(x,y);
  }
  void draw(){
    pushMatrix();
    translate(pos.x*cellsize,pos.y*cellsize);
    translate(cellsize/2,cellsize/2);
    ellipse(0,0,cellsize,cellsize);
    popMatrix();
  }
}
