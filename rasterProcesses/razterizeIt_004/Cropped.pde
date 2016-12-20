class Cropped{
  float  index;
  PImage img;
  float  friction;
  float  cx, cy, tox, toy, dx, dy, xoff, yoff;
  
  Cropped(PImage im, float ind){
    index = ind;
    img  = im;
    xoff = (width-img.width)/2;
    yoff = (height-img.height)/2;
    friction = map(index, 0, 100, 0.1, 0.6);
  }
  void update(){
    tox = map(mouseX, 0, width,  2*xoff, 0 );
    toy = map(mouseY, 0, height, 2*yoff, 0 );
    dx  = tox-cx;
    dy  = toy-cy;
    dx *= friction;
    dy *= friction;
    cx += dx;
    cy += dy;
  }
  void draw(){
    pushMatrix();
    translate(cx,cy);
    image(img,0,0);
    popMatrix();
  }
}
