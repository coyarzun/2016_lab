class Snake{
  PVector pos, oldPos;
  float   direction, oldDirection;
  int life;
  ArrayList body;
  
  Snake(PVector p, float d){
    pos       = p;
    direction = d;
    body      = new ArrayList();
    body.add( new Vertebra(p,d) );
  }
  void update(){
    Vertebra head = (Vertebra)body.get(0);
    head.update();
    for(int i=1; i<body.size(); i++){
      Vertebra v = (Vertebra)body.get(i);
      Vertebra w = (Vertebra)body.get(i-1);
      v.update(w.oldPos, w.oldDirection);
    }
    if(frameCount<20)grow();
    life++;
  }
  void draw(){
    for(int i=body.size()-1; i>=0; i--){
      //println(i);
      Vertebra v = (Vertebra)body.get(i);
      v.draw();
    }
  }
  void grow(){
    Vertebra last = (Vertebra)body.get(body.size()-1);
    body.add( new Vertebra(last.oldPos, last.oldDirection));
  }
}
