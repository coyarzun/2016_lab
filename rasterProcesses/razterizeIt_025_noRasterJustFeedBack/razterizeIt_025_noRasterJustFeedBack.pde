CCropped[] cimg;
PImage  src;
PImage  fdbck;

void setup() {
  size(800, 400, P3D);
  colorMode(HSB);
  
  fdbck = createImage(width,height,RGB);
  //src = loadImage("/Users/coyarzun/ima/mine/porn/mandyMorbid/mandy4_large.jpg");//
  src = loadImage("wiros_600x600.jpg");
  int total = 32;
  int minsize = 64;
  int cell = (src.width-minsize)/total;
  cimg = new CCropped[total];

  for (int i=0; i<cimg.length; i++) {
    PImage tmp = new PImage(minsize+i*cell, minsize+i*cell, RGB);
    tmp.copy(src, (src.width-tmp.width)/2, (src.height-tmp.height)/2, tmp.width, tmp.height, 0, 0, tmp.width, tmp.height);
    cimg[i] = new CCropped(tmp, map(i, 0, cimg.length, 0, 100));
  }
}

void draw() {
  background(fdbck);
  
//  pushMatrix();
//  translate(width/2,height/2);
//  rotateZ(radians(2));scale(1.1);
//  translate(-width/2,-height/2);
//  image(fdbck,0,0);
//  popMatrix();

  //if(frameCount%2==0)filter(INVERT);
  //scale(0.5);
  for (int i=cimg.length-1; i>0; i--) {
    cimg[i].update();
    cimg[i].draw();
  }
  //fdbck.copy(g,0,0,width,height,1,1,width-2,height-2);
  int stp = 4;
  fdbck.copy(g,stp,stp,width-2*stp,height-2*stp,0,0,width,height);
  //fdbck.copy(g,0,0,width,height,stp,stp,width-2*stp,height-2*stp);
  
}

