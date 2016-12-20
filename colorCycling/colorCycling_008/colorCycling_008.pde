PImage img;

void setup(){
  size(400,400);
  colorMode(HSB);//,360,100,100);
  img = loadImage("mandy_400x400.jpg");
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
    hh = map(b,0,100,0,360);
    hh+=frameCount; hh%=360;
    pixels[i] = color(hh,100,100);
  }
  updatePixels();
}
