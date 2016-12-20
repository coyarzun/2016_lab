class Vertebra{
  PVector   pos;
  float     direction, speed;
  
  Vertebra(float x, float y, float d){
    pos = new PVector(x,y);
    direction = d;
  }
  void update(float x, float y, float d){
    pos.x = x; pos.y = y; direction = d;
    if(pos.x<0)    pos.x+=cols;
    if(pos.x>=cols) pos.x-=cols;
    if(pos.y<0)    pos.y+=rows;
    if(pos.y>=rows) pos.y-=rows;
  }
  void draw(){
    stroke(0);
    pushMatrix();
    translate(pos.x*cellsize,pos.y*cellsize);
    translate(cellsize/2,cellsize/2);
    rotate(direction);
    triangle(-cellsize/2,-cellsize/2,cellsize/2,0,-cellsize/2,cellsize/2);
    popMatrix();
  }
}
