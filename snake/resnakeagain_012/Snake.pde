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
    moveHead();
    if(frameCount<5 || eat())grow();
  }
  void draw(PGraphics pg){
    for(int i=0; i<body.size(); i++){
      body.get(i).draw(pg);
    }
  }
  void draw3D(PGraphics pg){
    for(int i=0; i<body.size(); i++){
      body.get(i).draw3D(pg);
    }
  }
  void grow(){
    Vertebra last = (Vertebra)body.get(body.size()-1);
    body.add( new Vertebra(last.pos, last.direction));
  }
  void die(){
    println("i should die");
  }
  void moveHead(){
    if(body.get(0).direction==0)body.get(0).pos.x++;
    if(body.get(0).direction==1)body.get(0).pos.y++;
    if(body.get(0).direction==2)body.get(0).pos.x--;
    if(body.get(0).direction==3)body.get(0).pos.y--;
    body.get(0).pos.x+=cols;body.get(0).pos.x%=cols;
    body.get(0).pos.y+=rows;body.get(0).pos.y%=rows; 
    //println(body.get(0).pos);
  }
  void setDirection(int dir){
    body.get(0).direction = dir;
  }
  boolean eat(){
    if(body.get(0).pos.x==egg.pos.x && body.get(0).pos.y==egg.pos.y){
      egg.rebirth();
      return (true);
    } else return (false); 
  }
}
