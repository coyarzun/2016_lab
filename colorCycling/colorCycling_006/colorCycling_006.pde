PImage img;

void setup(){
  size(400,400);
  colorMode(HSB,360,100,100);
  img = loadImage("mandy_400x400.jpg");
}
void draw(){
  //
  processImage();
  //background(img);
  
}
void processImage(){
  img.loadPixels();
  loadPixels();
  float h,s,b;
  for(int i=0; i<img.pixels.length; i++){
    h = hue(img.pixels[i]);
    s = saturation(img.pixels[i]);
    b = brightness(img.pixels[i]);
    h+=frameCount;h%=360;
    s+=frameCount;s%=100;
    b+=frameCount;b%=100;
    //if(b>255)b-=256;
    pixels[i] = color(h,s,b);
    // = <<8;
  }
  updatePixels();
}
