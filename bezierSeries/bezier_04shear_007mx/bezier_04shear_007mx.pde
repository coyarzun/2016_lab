//cubic bezier dev
PImage img, pimg;
ArrayList d;
PFont     font;
boolean dorec;

void setup() {
  size(800,400,P3D);//displayWidth, displayHeight);
  //println(displayWidth+"x"+displayHeight);
  //frameRate(30);
  font = createFont("AndaleMono-8.vlw", 8);
  d = new ArrayList();//(20,20);
  d.add( new Draggable(width/2, 0) );
  d.add( new Draggable(width/2, height) );
  d.add( new Draggable(width/4, height/2) );
  d.add( new Draggable(3*width/4, height/2) );

  img = loadImage("preglitched_800x400.png");
  //img = loadImage("mandy_800x400.jpg");
  pimg = createImage(width, height, RGB);
}
void draw() {
  shear();
  background(img);
  
  
  Draggable a, b, c1, c2;
  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  if(!dorec){
  int steps = height/4;
  float t, sx, sy, sdiam;
  float tx, ty, sa;

  noFill();
  stroke(236, 0, 140);strokeWeight(4);
  line(a.x, a.y, c1.x, c1.y);
  line(b.x, b.y, c2.x, c2.y);
  line(c1.x, c1.y, c2.x, c2.y);

  stroke(236, 0, 140);
  bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);

  for (int i=0; i<d.size(); i++) {
    Draggable tmp = (Draggable)d.get(i);
    tmp.draw();
  }
  }else{
    println("rec!");
    saveFrame("render/ohShear-####.png");
    dorec = false;
  }
}
void mousePressed() {
  for (int i=0; i<d.size(); i++) {
    Draggable tmp = (Draggable)d.get(i);
    if (tmp.mousePressed()) {
      for (int j=i+1; j<d.size();j++) {
        Draggable tmp2 = (Draggable)d.get(j);
        tmp2.mouseReleased();
      }
      //break;
    }
  }
}
void mouseReleased() {
  for (int i=0; i<d.size(); i++) {
    Draggable tmp = (Draggable)d.get(i);
    tmp.mouseReleased();
  }
}
void keyPressed(){
  if(keyCode==32){
    dorec = true;
  }
}
class Draggable {
  float x, y;
  float xoff, yoff;
  float diam;
  boolean dragging = false;
  float   tolerance = 1.2;

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
  void draw() {
    if (dragging) {
      x=mouseX-xoff;
      y=mouseY-yoff;
    }
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
}







void shear() {
  int[] dX = new int[height];
  int[] dY = new int[height];
  Draggable a, b, c1, c2;

  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  int steps = height;
  for (int i=0; i<steps; i++) {
    float t = i/float(steps);
    float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    dX[i] = int(sx-width/2);
    dY[i] = int(sy-i);
  }

  for (int j=0; j<height; j++) {
    for (int i=0; i<width; i++) {
      int k  = j*width+i;
      int jj = j+dY[j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      int ii = i+dX[j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      int kk = jj*width+ii;
      if(kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      img.pixels[k] = img.pixels[kk];
    }
  }
}

