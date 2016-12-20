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
//    xoff*= ind/100f;
//    yoff*= ind/100f;
    friction = map(index, 100, 0, 0.01, 0.6);
  }
  void update(){
    tox = map(mouseX, 0, width,  cimg[0].xoff, -cimg[0].xoff);
    toy = map(mouseY, 0, height, cimg[0].yoff, -cimg[0].yoff );
    dx  = tox-cx;
    dy  = toy-cy;
    dx *= friction;
    dy *= friction;
    cx += dx;
    cy += dy;
  }
  void draw(){
    pushMatrix();
    translate(cx+xoff,cy+yoff);
    pushMatrix();
    translate(img.width/2,img.height/2);
    rotateZ(radians(frameCount+index));
    translate(-img.width/2,-img.height/2);
    image(img,0,0);
    popMatrix();
    popMatrix();
  }
}
