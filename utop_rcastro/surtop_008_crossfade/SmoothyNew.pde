class Smoothy{//Dumper
  float v, to, friction; 
  
  Smoothy(float val){
    v = val;
    to= val;
    friction = .2;
  }
  void setTo(float val){
    to = val;
  }
  float getVal(){
    v += (to-v)*friction;
    return(v);
  }
  
}
