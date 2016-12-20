import processing.video.*;
PImage img;
Movie video;

void setup(){
  size(480,480);
  //size(320,576);//512,288);
  //size(360,466);//512,288);
  colorMode(HSB);//,360,100,100);
  //img = loadImage("wiros_400x400.jpg");
  //video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/4jPorn/IMG_4691.mp4");//mandyMorbid/Hospital_Mandy Morbid_part1 - Pornhub.com.mp4");
  //video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/4jPorn/video-1472710373.mp4");//dance//size(320,576);//512,288);
  video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/4jPorn/IMG_4681.mp4");//
  //video = new Movie(this, "/Users/coyarzun/ima/mine/porn/0497238.flv");//Epic Teen Cowgirl Sextape - Pornhub.com.mp4");
  video.loop();
  img = createImage(width,height,RGB);
}
void draw(){
  //processImage();
  background(img);
  //image(img,0,0);
}
void movieEvent(Movie m) {
  m.read();
  img = createImage(width, height, RGB);
  //video.loadPixels();
  //arrayCopy(video.pixels, img.pixels);
  //shear();
  processImage();
}
void processImage(){
  img.loadPixels();
  video.loadPixels();
  float h,s,b,hh;
  for(int i=0; i<video.pixels.length; i++){
    h = hue(video.pixels[i]);
    s = saturation(video.pixels[i]);
    b = brightness(video.pixels[i]);
    hh = b;//map(b,0,100,0,360);
    hh+=frameCount*4; hh%=256;
    img.pixels[i] = color(hh,255,255);
  }
  img.updatePixels();
}
