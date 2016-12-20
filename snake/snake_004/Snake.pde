class Snake{
  ArrayList body;
  PVector   pos,oldPos;
  float     direction, oldDirection, speed;
  
  Snake(float x, float y){
    pos  = new PVector(x,y);
    body = new ArrayList();
    direction = 0;  
    speed     = 1.0;
    for(int i=0; i<1; i++){
      addVertebra(pos.x-(i+1), pos.y, direction);
    }
  }
  void addVertebra(float x, float y, float d){
    body.add( new Vertebra(x,y,d));
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
    updateHead(false);
    updateBody();
  }
  void updateHead(boolean eat){
    oldPos = pos;
    oldDirection = direction;
    pos.x+=speed*cos(direction);
    pos.y+=speed*sin(direction);
    
    if(eat)eat=false;
    else
    if(pos.x==egg.pos.x&&pos.y==egg.pos.y){
      //oldPos = pos;
      updateHead(true);
      body.add( new Vertebra(oldPos.x,oldPos.y,oldDirection));
      egg.setup(int(random(cols)), int(random(rows)));
    }
    
    if(pos.x<0)    pos.x+=cols;
    if(pos.x>=cols) pos.x-=cols;
    if(pos.y<0)    pos.y+=rows;
    if(pos.y>=rows) pos.y-=rows;
  }
  void updateBody(){
    for(int i=body.size()-1; i>=0; i--){
      Vertebra v = (Vertebra)body.get(i);
      if(i==0)v.update(oldPos.x,oldPos.y,oldDirection);
      else{
        Vertebra pv = (Vertebra)body.get(i-1);
        v.update(pv.pos.x,pv.pos.y,pv.direction); 
      }
    }
  }
  void draw(){
    drawHead();
    drawBody();
  }
  void drawHead(){
    stroke(0);
    pushMatrix();
    translate(pos.x*cellsize,pos.y*cellsize);
    //translate(cellsize/2,cellsize/2);
    //rotate(direction);
    //triangle(-cellsize/2,-cellsize/2,cellsize/2,0,-cellsize/2,cellsize/2);
    rect(0,0,cellsize,cellsize);
    popMatrix();
  }
  void drawBody(){
    for(int i=0; i<body.size(); i++){
      Vertebra v = (Vertebra)body.get(i);
      v.draw();
    }
  }
}
