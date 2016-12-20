import processing.video.*;
PImage img;
Movie video;

void setup(){
  size(480,240);
  colorMode(HSB);//,360,100,100);
  img = loadImage("deathstar_480x240.png");
}
void draw(){
  processImage();
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
