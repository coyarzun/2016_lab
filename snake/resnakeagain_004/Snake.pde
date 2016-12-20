class Snake{
  int       todirecion;
  ArrayList <Vertebra> body;
  
  Snake(float x, float y, int d){
    body      = new ArrayList();
    body.add( new Vertebra(new PVector(x,y),d) );
  }
  void update(){
    for(int i=body.size()-1; i>0; i--){
      body.get(i).update(body.get(i-1).pos, body.get(i-1).direction);  
    }
    move();
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
  void move(){
    if(todirecion==0 && (body.get(0).direction==1 || body.get(0).direction==3) ){
      body.get(0).direction=2;
    }else if(todirecion==1 && (body.get(0).direction==1 || body.get(0).direction==3) ){
      body.get(0).direction=0;
    }else if(todirecion==2 && (body.get(0).direction==0 || body.get(0).direction==2) ){
      body.get(0).direction=3;
    }else if(todirecion==3 && (body.get(0).direction==0 || body.get(0).direction==2) ){
      body.get(0).direction=1;
    }else{
      die();
    }
    if(body.get(0).direction==0)body.get(0).pos.x++;
    if(body.get(0).direction==1)body.get(0).pos.y++;
    if(body.get(0).direction==2)body.get(0).pos.x--;
    if(body.get(0).direction==3)body.get(0).pos.y--;
    body.get(0).pos.x+=cols;body.get(0).pos.x%=cols;
    body.get(0).pos.y+=rows;body.get(0).pos.y%=rows; 
  }
}
