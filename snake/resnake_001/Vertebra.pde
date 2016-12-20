class Vertebra{
  PVector pos, oldPos;//x,y
  float   direction;
  boolean head;
  Vertebra predecesor;
  
  Vertebra(PVector p, float d) {
    pos = p; 
    direction = d;
    isHead();
  }
  Vertebra(PVector p, float d, Vertebra v) {
    pos = p; 
    direction = d;
    predecesor = v;
    noHead();
  }
  void isHead(){
    head = true;
  }
  void noHead(){
    head = false;
  }
  void update(){
    oldPos = pos;
    if(!head)pos=predecesor.oldPos;
    else{
      pos.x+=1*cos(direction);
      pos.y+=1*sin(direction);
      if(pos.x<0)pos.x+=cols;
      if(pos.x>=cols)pos.x-=cols;
      if(pos.y<0)pos.y+=rows;
      if(pos.y>=rows)pos.y-=rows;
    }
  }
  void draw() {
    stroke(0);
    pushMatrix();
    translate(pos.x*cellsize, pos.y*cellsize);
    rotate(direction);
    rect(0, 0, cellsize, cellsize);
    popMatrix();
  }
  
}

