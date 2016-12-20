class Snake{
  ArrayList <Vertebra> body;
  
  Snake(float x, float y, float d){
    body      = new ArrayList();
    body.add( new Vertebra(new PVector(x,y),d) );
  }
  void update(){
    for(int i=body.size()-1; i>0; i--){
      body.get(i).update(body.get(i-1).pos, body.get(i-1).direction);  
    }
        
    body.get(0).pos.x+=1*cos(body.get(0).direction);
    body.get(0).pos.y+=1*sin(body.get(0).direction);
    
    if (body.get(0).pos.x<0)      body.get(0).pos.x+=cols;
    if (body.get(0).pos.x>=cols-1) body.get(0).pos.x-=cols;
    if (body.get(0).pos.y<0)      body.get(0).pos.y+=rows;
    if (body.get(0).pos.y>=rows-1)   body.get(0).pos.y-=rows;
    
    if(frameCount<5)grow();
    
  }
  void draw(){
    for(int i=0; i<body.size(); i++){
      Vertebra v = (Vertebra)body.get(i);
      v.draw();
    }
    
  }
  void grow(){
    Vertebra last = (Vertebra)body.get(body.size()-1);
    body.add( new Vertebra(last.pos, last.direction));
  }
  
  
  
  
  void die(){
    println("i should die");
  }
  void turnLeft(){
    body.get(0).direction -=PI/2;
    body.get(0).direction%=TWO_PI;
  }
  void turnRight(){
    body.get(0).direction +=PI/2;
    body.get(0).direction%=TWO_PI;
  }
  void left(){
    if(body.get(0).direction==PI/2 || body.get(0).direction==3*PI/2){
      body.get(0).direction=PI;
    }else{
      die();
    }
  }
  void right(){
    if(body.get(0).direction==PI/2 || body.get(0).direction==3*PI/2){
      body.get(0).direction=0;
    }else{
      die();
    }
  }
  void up(){
    if(body.get(0).direction==0 || body.get(0).direction==PI){
      body.get(0).direction=3*PI/2;
    }else{
      die();
    }
  }
  void down(){
    if(body.get(0).direction==0 || body.get(0).direction==PI){
      body.get(0).direction=PI/2;
    }else{
      die();
    }
  }
}
