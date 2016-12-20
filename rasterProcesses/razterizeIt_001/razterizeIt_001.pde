float  friction;
float  cx, cy, tox, toy, dx, dy, xoff, yoff;
PImage img;

void setup(){
  size(400,400);
  img = loadImage("wiros_600x600.jpg");
  xoff = (width-img.width)/2;
  yoff = (height-img.height)/2;
  friction = 0.1;
}
void draw(){
  tox = map(mouseX, 0, width,  0, 2*xoff);
  toy = map(mouseY, 0, height, 0, 2*yoff);
  dx  = tox-cx;
  dy  = toy-cy;
  dx *= friction;
  dy *= friction;
  cx += dx;
  cy += dy;
  //blend(
  image(img,cx,cy);
}
