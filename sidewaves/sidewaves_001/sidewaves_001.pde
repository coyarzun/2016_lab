import ddf.minim.*;
import processing.video.*;

Minim minim;
AudioPlayer in;//AudioInput in;
Movie video;

PImage buffer;

void setup() {
  size(800, 400);//, P3D);
  colorMode(HSB);
  minim = new Minim(this);
  in = minim.loadFile("marcus_kellis_theme.mp3");//in = minim.getLineIn();
  in.loop();
  video = new Movie(this, "/Users/coyarzun/ima/mine/porn/Hospital_Mandy Morbid_part1 - Pornhub.com.mp4");
  video.loop();

  buffer = createImage(video.width, video.height, RGB);
}
void draw() {
  background(240, 240, 255);
  image(buffer, 0, 0, width, height);
}
void movieEvent(Movie m) {
  m.read();
  buffer = createImage(video.width, video.height, RGB);
  video.loadPixels();
  arrayCopy(video.pixels, buffer.pixels);
  sideShear();
}
void sideShear() {
  buffer.loadPixels();
//  for (int i=0; i<width; i++) {
//    for (int j=0; j<height; j++) {
//      int k  = j*width+i;
//
//      int ii = i+(int)abs(in.left.get(0)*50);//dX[i];
//      if (ii<0)ii+=width;
//      if (ii>width-1)ii-=width;
//
//      int jj = j+0;//dY[i];
//      if (jj<0)jj+=height;
//      if (jj>height)jj-=height;
//
//
//      int kk = jj*width+ii;
//
//      if (kk<0)kk+=buffer.pixels.length;
//      kk%=buffer.pixels.length;
//
//      buffer.pixels[k] = buffer.pixels[kk];
//    }
//  }
  buffer.updatePixels();
}

