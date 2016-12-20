class Snake{
  int life;
  ArrayList body;
  
  Snake(PVector p, float d){
    body = new ArrayList();
    body.add( new Vertebra(p,d) );
  }
  void update(){
    for(int i=body.size()-1; i>=0; i--){
      Vertebra v = (Vertebra)body.get(i);
      v.update();
    }
    //if(frameCount<20)grow();
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
    body.add( new Vertebra(last.oldPos,last.direction));
  }
}
