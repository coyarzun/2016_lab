import processing.video.*;
//cubic bezier dev
PImage img, pimg;
PImage  buffer;
ArrayList d;
PFont     font;
Capture video;
Draggable a, b, c1, c2;

void setup() {
  size(640, 480);//displayWidth, displayHeight);
  //println(displayWidth+"x"+displayHeight);
  //frameRate(30);
  font = createFont("AndaleMono-8.vlw", 8);
  d = new ArrayList();//(20,20);
  d.add( new Draggable(width/2, 0) );
  d.add( new Draggable(width/2, height) );
  d.add( new Draggable(width/4, height/2) );
  d.add( new Draggable(3*width/4, height/2) );

  video = new Capture(this, width, height);
  video.start(); 

  img = createImage(width, height, RGB);
  //background(0);
}
void draw() {
  background(img);
  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  int steps = height/4;
  float t, sx, sy, sdiam;
  float tx, ty, sa;

  noFill();
  stroke(236, 0, 140);
  strokeWeight(4);
  line(a.x, a.y, c1.x, c1.y);
  line(b.x, b.y, c2.x, c2.y);
  line(c1.x, c1.y, c2.x, c2.y);

  stroke(236, 0, 140);
  bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);

  for (int i=0; i<d.size(); i++) {
    Draggable tmp = (Draggable)d.get(i);
    tmp.draw();
  }
}

void shear() {
  int[] dX = new int[height];
  int[] dY = new int[height];

  int steps = height;
  for (int i=0; i<steps; i++) {
    float t = i/float(steps);
    float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    dX[i] = int(sx-width/2);
    dY[i] = int(sy-i);
  }

  loadPixels();
  //video.loadPixels();

  for (int j=0; j<height; j++) {
    for (int i=0; i<width; i++) {
      int k  = j*width+i;
      k%=pixels.length;
      int jj = j+dY[j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      int ii = i+dX[j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      int kk = jj*width+ii;
      if (kk<0)kk+=pixels.length;
      kk%=pixels.length;
      if(random(50)>10)      img.pixels[k] = img.pixels[kk];
      else                   pixels[k] = video.pixels[kk];
    }
  }
  updatePixels();
}

void captureEvent(Capture camera) {
  camera.read();
  img = createImage(width, height, RGB);
  video.loadPixels();
  arrayCopy(video.pixels, img.pixels);

  shear();
}

