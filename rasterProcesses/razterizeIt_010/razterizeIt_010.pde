Cropped[] cimg;
PImage  src;

void setup(){
  size(400,400,P3D);
  src = loadImage("wiros_600x600.jpg");
  int total = 32;
  int minsize = 64;
  int cell = (src.width-minsize)/total;
  cimg = new Cropped[total];
  
  for(int i=0; i<cimg.length; i++){
    PImage tmp = new PImage(minsize+i*cell,minsize+i*cell,RGB);
    tmp.copy(src,(src.width-tmp.width)/2,(src.height-tmp.height)/2,tmp.width,tmp.height,0,0,tmp.width,tmp.height);
    cimg[i] = new Cropped(tmp, map(i,0,cimg.length,0,100));
  }
}

void draw(){
  //background(0);
  for(int i=cimg.length-1; i>0; i--){
    cimg[i].update();
    cimg[i].draw();
  }
}
