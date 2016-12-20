import processing.video.*;

PGraphics pg;
PShader shader;
PImage  curves, xcurves;
Boolean usexShader = true,  useShader = true, blinkShader = true, domandy = true;

PImage mandy;// = loadImage("mandy_800x400.jpg");
Movie video;

void setup() {
  size(640, 480, P3D);
  shader   = loadShader("ccShader_003.glsl");doCurves();
  pg = createGraphics(width, height, P3D);
  mandy = loadImage("wiros_600x600.jpg");//loadImage("mandy_800x400.jpg");
  //video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/Ebony lesbos clit grinding - Pornhub.com.mp4");//
  //video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/4jPorn/IMG_4681.mp4");//
  video = new Movie(this, "/Users/coyarzun/ima/recreative/porn/Black Beauty Model has sex in whirlpool Redtube Free Public .mp4");
  video.loop();
  video.speed(0.5);
}
void draw() {

  shader.set("resolution", float(width), float(height));
  shader.set("time", radians(millis()*0.005));//millis()));
  shader.set("textureMap", usexShader?xcurves:curves);

  if(useShader)
  shader(shader);
  
  else resetShader();
  
  background(196);
  //image(video, 0, 0, width, height);
  image(domandy?mandy:video, 0, 0, width, height);
  if(blinkShader)usexShader=!usexShader;
}
void movieEvent(Movie m) {
  m.read();
}
void keyPressed(){
  if(key=='z')useShader=!useShader;
  if(key=='x')usexShader=!usexShader;
  if(key=='c')doCurves();
  if(key=='b')blinkShader=!blinkShader;
  if(key=='m')domandy=!domandy;
  if(key=='j')video.jump(random(video.duration()));
}
void doCurves(){
  curves       = createImage(256, 256, RGB);//loadImage("_curves/curve_001_updownz.png");//baseTexture.jpg");
  xcurves      = createImage(256, 256, RGB);
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      //curves.set(i,j,color(map(i,0,curves.width,0,255)));///(j+1)));
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*32)%256, random(256)));//,255,255));///(j+1)));
      float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;//+100;
      //float v  = map(i, 0, curves.width, 0, 256);//+100;
      curves.set(i, j, color(v));//,255,255));//255));///(j+1)));
    }
  }
}
