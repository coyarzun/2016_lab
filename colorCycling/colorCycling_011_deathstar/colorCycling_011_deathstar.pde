import processing.video.*;
PImage img;
Movie video;

void setup(){
  size(850,364,P3D);
  colorMode(HSB);//,360,100,100);
  img = loadImage("deathstar_850x364.jpg");
}
void draw(){
  processImage();
  sideShear();
  //background(img);
}
void processImage(){
  img.loadPixels();
  loadPixels();
  float h,s,b,hh;
  for(int i=0; i<img.pixels.length; i++){
    h = hue(img.pixels[i]);
    s = saturation(img.pixels[i]);
    b = brightness(img.pixels[i]);
    hh = b;//map(b,0,100,0,360);
    hh+=frameCount*4; hh%=256;
    pixels[i] = color(hh,255,255);
  }
  updatePixels();
}
void sideShear() {
  loadPixels();
  for (int i=0; i<width; i+=2) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      float amp = 200;
      int ii = i+(int)abs((sin(radians(frameCount)+map(j,0,height,0,TWO_PI)))*amp);//dX[i];//*random(-1,1)
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      int kk = j*width+ii;
      pixels[k] = pixels[kk];
    }
  }
  updatePixels();
}
void keyPressed(){
  saveFrame("deathStar_####.png");
}
