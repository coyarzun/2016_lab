class Vertebra{
  PVector pos;
  int   direction;

  Vertebra(PVector p, int d){
    pos = new PVector(p.x,p.y);
    update(pos,d);
  }
  void update(PVector p, int d){
    pos.x = p.x;
    pos.y = p.y; 
    direction = d;
  }
  void draw(){
    stroke(0);
    pushMatrix();
    translate((pos.x)*cellsize, (pos.y)*cellsize);
    rotate(direction*HALF_PI);
    rect(0, 0, cellsize, cellsize);
    popMatrix();
  }
}

