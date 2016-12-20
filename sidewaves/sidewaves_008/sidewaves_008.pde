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

  buffer = createImage(512,288, RGB);
}
void draw() {
  sideShear();
  //background(240, 240, 255);
  image(buffer, 0, 0, width, height);
  glitchRoutine();
}
void movieEvent(Movie m) {
  m.read();
  buffer = createImage(video.width, video.height, RGB);
  video.loadPixels();
  arrayCopy(video.pixels, buffer.pixels);
}
void sideShear() {
  buffer.loadPixels();
  for (int i=0; i<buffer.width; i+=2) {
    for (int j=0; j<buffer.height; j++) {
      int k  = j*buffer.width+i;
//
      float amp = 200;
      int ii = i+(int)abs(in.left.get((j/8)%in.bufferSize())*amp);//dX[i];
      if (ii<0)ii+=buffer.width;
      if (ii>buffer.width-1)ii-=buffer.width;
//
//      int jj = j+0;//dY[i];
//      if (jj<0)jj+=height;
//      if (jj>height)jj-=height;
//
//
      int kk = j*buffer.width+ii;
//
//      if (kk<0)kk+=buffer.pixels.length;
//      kk%=buffer.pixels.length;
//
      buffer.pixels[k] = buffer.pixels[kk]>>int(random(2));
    }
  }
  buffer.updatePixels();
}
void glitchRoutine(){
  //loadPixels();
  int w = mouseY;
  for(int i=0; i<height; i++){
    stroke(get(mouseX,i));
    line(0,i,mouseX,i);
    stroke(get(mouseX+w,i));
    line(mouseX+w ,i,width,i);
  }
  //pg.updatePixels();
}


