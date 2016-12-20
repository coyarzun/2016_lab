PImage img;

void setup(){
  size(400,400);
  colorMode(HSB,360,100,100);
  img = loadImage("wiros_400x400.jpg");
}
void draw(){
  //
  processImage();
  background(img);
  
}
void processImage(){
  img.loadPixels();
  //loadPixels();
  float h,s,b;
  for(int i=0; i<img.pixels.length; i++){
    h = hue(img.pixels[i]);
    s = saturation(img.pixels[i]);
    b = brightness(img.pixels[i]);
    h+=1;h%=360;
    s+=2;s%=100;
    b+=4;b%=100;
    //if(b>255)b-=256;
    img.pixels[i] = color(h,s,b);
    // = <<8;
  }
  img.updatePixels();
}
