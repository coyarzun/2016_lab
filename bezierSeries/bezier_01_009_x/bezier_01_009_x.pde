//cubic bezier dev
ArrayList d;
PFont     font;

void setup(){
  size(1920,1920/2);
  //frameRate(30);
  font = createFont("AndaleMono-8.vlw",8);
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
  stroke(200);
  line(a.x,a.y,c1.x,c1.y);
  line(b.x,b.y,c2.x,c2.y);
  line(c1.x,c1.y,c2.x,c2.y);
  
  stroke(0);
  bezier(a.x,a.y,c1.x,c1.y,c2.x,c2.y,b.x,b.y);
  
  int steps = 64*2;
  float t,sx,sy,sdiam;
  float tx, ty, sa;
  
  boolean itsMe;
  
  for(int i=0; i<steps+1; i++){
    itsMe = (frameCount)%steps==i;
    
    t = i/float(steps);
    sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    
    sdiam = i%16==0?8*2:5*2;
    if(itsMe) sdiam*=1.8;
     
//    stroke(220);
//    line(sx,0,sx,height);
//    line(0,sy,width,sy);
    float f = map(i,0,steps+1,0,1);
    color cc = lerpColor(color(255,0,255), color(255,255,0), f);

    stroke(!itsMe? cc:0);
    ellipse(sx, sy, sdiam, sdiam);
    
    tx = bezierTangent(a.x, c1.x, c2.x, b.x, t);
    ty = bezierTangent(a.y, c1.y, c2.y, b.y, t);
    sa = atan2(ty, tx);
    sa -= HALF_PI;
    line(sx, sy, 2*sdiam*cos(sa)+sx, 2*sdiam*sin(sa)+sy);
  }
  
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
    noFill();
    pushMatrix();
    translate(x,y);
    ellipse(0,0,diam,diam);
    fill(0);
    textSize(8);
    text("( "+x+", "+y+" )", diam*.8, diam*1.2);
    popMatrix();
  }
}
void keyPressed(){
  saveFrame("../../workshopRenders/bzr_01_009_x-####.png");
}
