class Vertebra{
  PVector pos, oldPos;//x,y
  float   direction, oldDirection;
  boolean head;

  Vertebra(PVector p, float d){
    pos = p; 
    direction = d;
  }
  void update() {
    oldPos = pos;
    oldDirection = direction;
    
    pos.x+=1*cos(direction);
    pos.y+=1*sin(direction);
    if (pos.x<0)pos.x+=cols;
    if (pos.x>=cols)pos.x-=cols;
    if (pos.y<0)pos.y+=rows;
    if (pos.y>=rows)pos.y-=rows;
  }
  void update(PVector p, float d){
    oldPos = pos;
    oldDirection = direction;
    pos = p; 
    direction = d;
  }
  void draw(){
    stroke(0);
    pushMatrix();
    translate(pos.x*cellsize, pos.y*cellsize);
    rotate(direction);
    rect(0, 0, cellsize, cellsize);
    popMatrix();
  }
}

