//cubic bezier dev
ArrayList d;

void setup(){
  size(100,100);
  d = new ArrayList();//(20,20);
  d.add( new Draggable(10,10) );
  d.add( new Draggable(width-10,height-10) );
  d.add( new Draggable(10,width/2) );
  d.add( new Draggable(width-10,height/2) );
}
void draw(){
  Draggable a,b,c1,c2;
  
  background(255);
  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));
  
  noFill();
  stroke(0);
  bezier(a.x,a.y,c1.x,c1.y,c2.x,c2.y,b.x,b.y);
  
  
  for(int i=0; i<d.size(); i++){
    Draggable tmp = (Draggable)d.get(i);
    tmp.draw();
  }
}
void mousePressed(){
  for(int i=0; i<d.size(); i++){
    Draggable tmp = (Draggable)d.get(i);
    if(tmp.mousePressed()){
      for(int j=i+1; j<d.size();j++){
        Draggable tmp2 = (Draggable)d.get(j);
        tmp2.mouseReleased();
      }
      //break;
    }
  }
}
void mouseReleased(){
  for(int i=0; i<d.size(); i++){
    Draggable tmp = (Draggable)d.get(i);
    tmp.mouseReleased();
  }
}

class Draggable{
  float x, y;
  float xoff, yoff;
  float diam;
  boolean dragging = false;
  float   tolerance = 1.2;
  
  Draggable(float x, float y){
    this.x=x;this.y=y;
    diam = 8;
  }
  boolean mousePressed(){
    dragging = dist(mouseX,mouseY,x,y)<=diam*tolerance;
    xoff     = mouseX-x;
    yoff     = mouseY-y;
    return dragging;
  }
  void mouseReleased(){
    dragging = false;
  }
  void draw(){
    if(dragging){x=mouseX-xoff;y=mouseY-yoff;}
    stroke(dragging?color(255,0,255):0);
    pushMatrix();
    translate(x,y);
    ellipse(0,0,diam,diam);
    popMatrix();
  }
}
