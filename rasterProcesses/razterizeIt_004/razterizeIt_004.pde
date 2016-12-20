Cropped cimg;
PImage  src;

void setup(){
  size(400,400);
  src = loadImage("wiros_600x600.jpg");

  
  PImage tmp = new PImage(100,100,RGB);
  tmp.copy(src,(src.width-tmp.width)/2,(src.height-tmp.height)/2,tmp.width,tmp.height,0,0,tmp.width,tmp.height);
  cimg = new Cropped(tmp, 0);
}

void draw(){
  background(0);
  cimg.update();
  cimg.draw();
}
