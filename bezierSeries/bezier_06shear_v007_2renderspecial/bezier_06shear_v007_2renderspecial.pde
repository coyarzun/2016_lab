//cubic bezier dev
PImage img, pimg;
ArrayList d;
PFont     font;
boolean render = !true;

void setup() {
  size(800, 400, P3D);//displayWidth, displayHeight);
  //println(displayWidth+"x"+displayHeight);
  //frameRate(30);
  font = createFont("AndaleMono-8.vlw", 8);
  d = new ArrayList();//(20,20);
  d.add( new Draggable(0,height/2) );
  d.add( new Draggable(width, height/2) );
  d.add( new Draggable(width/2, height/4) );
  d.add( new Draggable(width/2, 3*height/4) );
  
  d.add( new Draggable(width/2, 0) );
  d.add( new Draggable(width/2, height) );
  d.add( new Draggable(width/4, height/2) );
  d.add( new Draggable(3*width/4, height/2) );

  img = loadImage("noisePattern_800x400.png");
  //img = loadImage("zebraPattern_800x400.png");
  pimg = createImage(width, height, RGB);
  arrayCopy(img.pixels,pimg.pixels);
}
void draw() {
  xyshear();

  background(pimg);

  if (!render) {
    Draggable a, b, c1, c2;
    Draggable aa, bb, cc1, cc2;
    
    a  = ((Draggable)d.get(0));
    b  = ((Draggable)d.get(1));
    c1 = ((Draggable)d.get(2));
    c2 = ((Draggable)d.get(3));
    
    aa  = ((Draggable)d.get(4));
    bb  = ((Draggable)d.get(5));
    cc1 = ((Draggable)d.get(6));
    cc2 = ((Draggable)d.get(7));


    noFill();
    stroke(236, 0, 140);
    strokeWeight(4);
    line(a.x, a.y, c1.x, c1.y);
    line(b.x, b.y, c2.x, c2.y);
    line(c1.x, c1.y, c2.x, c2.y);
    stroke(236, 0, 140);
    bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);
    
    line(aa.x, aa.y, cc1.x, cc1.y);
    line(bb.x, bb.y, cc2.x, cc2.y);
    line(cc1.x, cc1.y, cc2.x, cc2.y);
    stroke(236, 0, 140);
    bezier(aa.x, aa.y, cc1.x, cc1.y, cc2.x, cc2.y, bb.x, bb.y);

    for (int i=0; i<d.size(); i++) {
      Draggable tmp = (Draggable)d.get(i);
      tmp.draw();
    }
  }else{
    saveFrame("render/bezierShearFeedback_07_####.png");
  }
}
void keyPressed(){
  if(key==32){
    render=!render;
  }
  if(key=='a')arrayCopy(img.pixels,pimg.pixels);
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
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      pimg.pixels[k] = img.pixels[kk];
    }
  }
}
void xshear() {
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
      int jj = j+dX[j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      int ii = i+dY[j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      int kk = jj*width+ii;
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      pimg.pixels[k] = img.pixels[kk];
    }
  }
}
void wshear() {
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
    dX[i] = int(sx-i);//width/2);
    dY[i] = int(sy-height/2);
  }

  
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      
      int jj = j+dY[j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      
      int ii = i+dX[j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      
      int kk = jj*width+ii;
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      
      pimg.pixels[k] = pimg.pixels[kk];
    }
  }
}
void vshear() {
  int[] dX = new int[width];
  int[] dY = new int[width];
  Draggable a, b, c1, c2;

  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  int steps = width;
  for (int i=0; i<steps; i++) {
    float t = i/float(steps);
    float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    dX[i] = int(sx-i);//width/2);
    dY[i] = -int(sy-height/2);
  }

  
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      
      int ii = i+dX[i];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      
      int jj = j+dY[i];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      
      
      int kk = jj*width+ii;
      
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      
      pimg.pixels[k] = pimg.pixels[kk];
    }
  }
}
void xyshear() {
  int hsteps = width;
  int vsteps = height;
  
  int[][] dX = new int[hsteps][vsteps];
  int[][] dY = new int[hsteps][vsteps];
  
  Draggable a, b, c1, c2;
  Draggable aa, bb, cc1, cc2;

  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));
  
  aa  = ((Draggable)d.get(4));
  bb  = ((Draggable)d.get(5));
  cc1 = ((Draggable)d.get(6));
  cc2 = ((Draggable)d.get(7));

  
  for (int i=0; i<hsteps; i++) {
      float t = i/float(hsteps);
      float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
      float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
      float tdX = int(sx-i);//width/2);
      float tdY = -int(sy-height/2);
      for (int j=0; j<vsteps; j++) {
        float tt = j/float(vsteps);
        float ssx = bezierPoint(aa.x, cc1.x, cc2.x, bb.x, tt);
        float ssy = bezierPoint(aa.y, cc1.y, cc2.y, bb.y, tt);
        dX[i][j] = -int(ssx-width/2+tdX);;
        dY[i][j] = int(ssy-j+tdY);//height/2);
      }
  }

  
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      
      int ii = i+dX[i][j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      
      int jj = j+dY[i][j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      
      
      int kk = jj*width+ii;
      
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      
      pimg.pixels[k] = pimg.pixels[kk];
    }
  }
}

