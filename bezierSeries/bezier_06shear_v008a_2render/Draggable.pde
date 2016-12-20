class Draggable {
  float x, y;
  float xoff, yoff;
  float diam;
  boolean dragging = false;
  float   tolerance = 1.2;

  boolean auto;
  float   rot, drot, xpiv, ypiv, rradius;

  Draggable(float x, float y) {
    this.x=x;
    this.y=y;
    diam = 8;
  }
  boolean mousePressed() {
    dragging = dist(mouseX, mouseY, x, y)<=diam*tolerance;
    xoff     = mouseX-x;
    yoff     = mouseY-y;
    return dragging;
  }
  void mouseReleased() {
    dragging = false;
  }
  void move(float dx, float dy){
    x+=dx;
    y+=dy;
    if(x<0)x+=width;
    if(x>width)x-=width;
    if(y<0)y+=height;
    if(y>height)y-=height;
  }
  void update(){
    if(auto){
      x = xpiv + rradius*cos(rot);
      y = ypiv + rradius*sin(rot);
      rot+=drot;
    }else if (dragging) {
      x=mouseX-xoff;
      y=mouseY-yoff;
    }
  }
  void draw() {
    
    
    stroke(dragging?color(255, 0, 255):0);
    noFill();
    pushMatrix();
    translate(x, y);
    ellipse(0, 0, diam, diam);
    fill(0);
    textSize(8);
    text("( "+x+", "+y+" )", diam*.8, diam*1.2);
    popMatrix();
  }
  void setAuto(float xp, float yp, float dr){
    auto = true;
    xpiv = xp;
    ypiv = yp;
    rot  = atan2(ypiv-y, xpiv-x);
    rradius = dist(xpiv,ypiv,x,y);
    drot = dr;
  }
}
