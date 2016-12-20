class Vertebra{
  float   xpos, ypos, oldxpos, oldypos;
  float   direction, oldDirection;
  boolean head;

  Vertebra(float x, float y, float d){
    update(x,y,d);
  }
  void update(float x, float y, float d){
    oldxpos = xpos;
    oldypos = ypos;
    oldDirection = direction;
    xpos = x;
    ypos = y; 
    direction = d;
  }
  void draw(){
    stroke(0);
    pushMatrix();
    translate((1+xpos)*cellsize, (1+ypos)*cellsize);
    rotate(direction);
    rect(0, 0, cellsize, cellsize);
    popMatrix();
  }
}

