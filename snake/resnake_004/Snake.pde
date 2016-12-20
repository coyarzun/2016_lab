class Snake{
  float xpos, ypos, oldxpos, oldypos;
  float   direction, oldDirection;
  ArrayList <Vertebra> body;
  
  Snake(float x, float y, float d){
    xpos       = x;
    ypos       = y;
    direction = d;
    body      = new ArrayList();
    body.add( new Vertebra(xpos,ypos,d) );
  }
  void update(){
    oldxpos = xpos;
    oldypos = ypos;
    oldDirection = direction;
    
    xpos+=1*cos(direction);
    ypos+=1*sin(direction);
    if (xpos<0)    xpos+=cols;
    if (xpos>cols-1) xpos-=cols;
    if (ypos<0)    ypos+=rows;
    if (ypos>rows) ypos-=rows;
    
    float px,py,opx,opy,d,od;
    px = xpos;
    py = ypos;
    d  = direction;
    for(int i=0; i<body.size(); i++){
      //Vertebra v = (Vertebra)body.get(i);
     
       body.get(i).update(px,py, d);
      opx =  body.get(i).oldxpos;//v.oldxpos;
      opy =  body.get(i).oldypos;//v.oldypos;
      od  =  body.get(i).oldDirection;  
      px = opx; py = opy; od= d;   
    }
    //if(frameCount<5)grow();
  }
  void draw(){
    for(int i=0; i<body.size(); i++){
      Vertebra v = (Vertebra)body.get(i);
      v.draw();
    }
    
  }
  void grow(){
    Vertebra last = (Vertebra)body.get(body.size()-1);
    body.add( new Vertebra(last.xpos, last.ypos, last.direction));
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
}
