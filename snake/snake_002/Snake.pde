class Snake{
  ArrayList body;
  PVector   pos;
  float     direction, speed;
  
  Snake(float x, float y){
    pos  = new PVector(x,y);
    body = new ArrayList();
    direction = 0;  
    speed     = 1.0;
  }
  void die(){
    println("i should die");
  }
  void turnLeft(){
    direction -=PI/2;
    direction%=TWO_PI;
  }
  void turnRight(){
    direction +=PI/2;
    direction%=TWO_PI;
  }
  void left(){
    if(direction==PI/2 || direction==3*PI/2){
      direction=PI;
    }else{
      die();
    }
  }
  void right(){
    if(direction==PI/2 || direction==3*PI/2){
      direction=0;
    }else{
      die();
    }
  }
  void up(){
    if(direction==0 || direction==PI){
      direction=3*PI/2;
    }else{
      die();
    }
  }
  void down(){
    if(direction==0 || direction==PI){
      direction=PI/2;
    }else{
      die();
    }
  }
  void update(){
    pos.x+=speed*cos(direction);
    pos.y+=speed*sin(direction);
    if(pos.x<0)    pos.x+=cols;
    if(pos.x>cols) pos.x-=cols;
    if(pos.y<0)    pos.y+=rows;
    if(pos.y>rows) pos.y-=rows;
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
