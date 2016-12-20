import processing.video.*;

PGraphics pg;
PShader shader;
PImage  curves, xcurves;
Boolean usexShader = true;

PImage img;
Movie video;

void setup() {
  size(640, 480, P3D);
  shader   = loadShader("ccShader_002.glsl");doCurves();
  pg = createGraphics(width, height, P3D);
  video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/Ebony lesbos clit grinding - Pornhub.com.mp4");//
  //video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/4jPorn/IMG_4681.mp4");//
  video.loop();
}
void draw() {

  shader.set("resolution", float(width), float(height));
  shader.set("time", radians(millis()*0.005));//millis()));
  shader.set("textureMap", usexShader?xcurves:curves);

  shader(shader);
  background(196);
  image(video, 0, 0);
  
  usexShader=!usexShader;
}
void movieEvent(Movie m) {
  m.read();
}
void keyPressed(){
  usexShader=!usexShader;
}
void doCurves(){
  curves       = createImage(256, 256, RGB);//loadImage("_curves/curve_001_updownz.png");//baseTexture.jpg");
  xcurves      = createImage(256, 256, RGB);
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      //curves.set(i,j,color(map(i,0,curves.width,0,255)));///(j+1)));
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*8)%256, random(256)));//,255,255));///(j+1)));
      float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;//+100;
      //float v  = map(i, 0, curves.width, 0, 256);//+100;
      curves.set(i, j, color(v));//,255,255));//255));///(j+1)));
    }
  }
}
