float  friction;
float  cx, cy, tox, toy, dx, dy, xoff, yoff;
PImage img, src;

void setup(){
  size(400,400);
  src = loadImage("wiros_600x600.jpg");
  img = createImage(src.width,src.height,RGB);
  img.copy(src,0,0,src.width,src.height,0,0,img.width,img.height);
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
  //img.blend(src,int(cx),int(cy),src.width,src.height,0,0,img.width,img.height,ADD);
  //image(src,cx,cy);
  image(img,cx,cy);
}
