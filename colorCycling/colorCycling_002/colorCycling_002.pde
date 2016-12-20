PImage img;

void setup(){
  size(400,400);
  colorMode(HSB);
  img = loadImage("wiros_400x400.jpg");
}
void draw(){
  //
  processImage();
  background(img);
  
}
void processImage(){
  img.loadPixels();
  float h,s,b;
  for(int i=0; i<img.pixels.length; i++){
    h = hue(img.pixels[i]);
    s = saturation(img.pixels[i]);
    b = brightness(img.pixels[i]);
    h+=frameCount;h%=256;
    s++;s%=256;
    b++;b%=256;
    img.pixels[i] = color(h,s,b);
    // = <<8;
  }
  img.updatePixels();
}
