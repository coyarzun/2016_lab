class Vertebra{
  PVector pos,oldpos;
  float   direction,oldDirection;

  Vertebra(PVector p, float d){
    pos = new PVector(p.x,p.y);
    oldpos = new PVector(p.x,p.y);
    update(pos,d);
  }
  void update(PVector p, float d){
    oldpos.x = pos.x;
    oldpos.y = pos.y;
    oldDirection = direction;
    pos.x = p.x;
    pos.y = p.y; 
    direction = d;
  }
  void draw(){
    stroke(0);
    pushMatrix();
    translate((1+pos.x)*cellsize, (1+pos.y)*cellsize);
    rotate(direction);
    rect(0, 0, cellsize, cellsize);
    popMatrix();
  }
}

