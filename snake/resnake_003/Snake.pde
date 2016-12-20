class Snake{
  float xpos, ypos, oldxpos, oldypos;
  float   direction, oldDirection;
  ArrayList body;
  
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
    if (xpos>=cols)xpos-=cols;
    if (ypos<0)    ypos+=rows;
    if (ypos>=rows)ypos-=rows;
    
    float px,py,opx,opy,d,od;
    px = xpos;
    py = ypos;
    d  = direction;
    for(int i=0; i<body.size(); i++){
      Vertebra v = (Vertebra)body.get(i);
      opx = v.oldxpos;
      opy = v.oldypos;
      od  = v.oldDirection;
      v.update(px,py, d);  
      px = opx; py = opy; od= d;   
    }
    if(frameCount<3)grow();
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
}
