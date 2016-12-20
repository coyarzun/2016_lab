import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
BeatDetect beat;
BeatListener bl;

PGraphics offscreen;
int       scaleDiv;

float kickSize, snareSize, hatSize;

PShader colorshader, feedbackShader;
PImage  curves, xcurves;
Boolean usexShader = true,  useShader = true, blinkShader = true;
void setup() {
  size(displayWidth, displayHeight/2, P3D);
  
  scaleDiv    = 1;
  offscreen = createGraphics(width/scaleDiv, height/scaleDiv, P3D);

  minim = new Minim(this);
  in = minim.getLineIn();
  beat = new BeatDetect(in.bufferSize(), in.sampleRate());
  beat.setSensitivity(30);  
  bl = new BeatListener(beat, in);
  kickSize = snareSize = hatSize = 100;
  
  textFont(createFont("SanSerif", 16));
  textAlign(CENTER);
  
  colorshader      = loadShader("colorShader_002.glsl");
  feedbackShader   = loadShader("leonorShader_001.glsl");
  
  doCurves();
}
void draw() {
  noCursor();
  if ( beat.isKick() )  kickSize  = 1.0f;
  if ( beat.isSnare() ) snareSize = 1.0f;
  if ( beat.isHat() )   hatSize   = 1.0f;
  kickSize  = constrain(kickSize  * 0.95f, 0.1f, 1.0f);
  snareSize = constrain(snareSize * 0.95f, 0.1f, 1.0f);
  hatSize   = constrain(hatSize   * 0.95f, 0.1f, 1.0f);
  
  
  colorshader.set("resolution", float(width), float(height));
  feedbackShader.set("resolution", float(width), float(height));
  feedbackShader.set("time", radians(millis()*0.005));//millis()));
  feedbackShader.set("textureMap", usexShader?xcurves:curves);

  useShader = !(random(100)>60) || frameCount%16==0;

  offscreen.beginDraw();
  offscreen.shader(colorshader);
  offscreen.background(196);
  offscreen.blendMode(ADD);
  offscreen.ortho();
  offscreen.pushMatrix();
  offscreen.translate(width/2,height/2);
  offscreen.scale(1+kickSize*0.5);
  offscreen.stroke(0);offscreen.strokeWeight(1);offscreen.noFill();
  offscreen.ellipse(0,0,360,360);
  offscreen.popMatrix();
  
  offscreen.pushMatrix();
  offscreen.translate(width/2,height/2);
  
  offscreen.stroke(0);offscreen.strokeWeight(1);offscreen.fill(255);
  
  offscreen.pushMatrix();
  offscreen.rotateY(radians(frameCount));
  offscreen.rotateX(radians(frameCount));
  offscreen.scale(1+snareSize*0.5);
  offscreen.scale(2);
  drawMetaDice((frameCount/10)%7);
  offscreen.popMatrix();
  
  offscreen.pushMatrix();
  offscreen.translate(-width/3,0);
    
  
  offscreen.pushMatrix();
  offscreen.rotateY(radians(frameCount));
  offscreen.rotateX(radians(frameCount));
  offscreen.scale(1+kickSize*0.5);
  offscreen.scale(2);
  //drawMetaDiceGrig();
  offscreen.popMatrix();
  
  
  offscreen.translate(2*width/3,0);
  
  offscreen.pushMatrix();
  offscreen.rotateY(radians(frameCount));
  offscreen.rotateX(radians(frameCount));
  offscreen.scale(1+hatSize*0.5);
  //drawDiceGrig();
  offscreen.popMatrix();
  
  offscreen.popMatrix();
  offscreen.popMatrix();
  
  offscreen.pushMatrix();
  offscreen.translate(width/2,height/2);
  offscreen.scale(1+hatSize*0.5);
  offscreen.stroke(0);offscreen.strokeWeight(1);offscreen.noFill();
  offscreen.ellipse(0,0,340,340);
  offscreen.popMatrix();
  
  offscreen.endDraw();
  
  if(useShader)
  shader(feedbackShader);
  else resetShader();

  image(offscreen,0,0);
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
void keyPressed() {
  if(key=='z')useShader=!useShader;
  if(key=='x')usexShader=!usexShader;
  if(key=='c')doCurves();
  if(key=='b')blinkShader=!blinkShader;
  //if(key=='m')domandy=!domandy;
  //if(key=='j')video.jump(random(video.duration()));
}
void stop() {
  minim.stop();
  super.stop();
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
void drawDiceGrig(){
  float grid = 60f;
  offscreen.translate(-1*grid/1.0,-1*grid/1.0,-1*grid/1.0);
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
      for(int k=0; k<3; k++){
        int m = (i+i*j+i*j*k);
        offscreen.pushMatrix();
        offscreen.translate(i*grid,j*grid,k*grid);
        offscreen.scale(0.3);//
        offscreen.scale(1.0+abs(in.left.get(m)));
        drawDice((m+(frameCount)/10)%7);
        offscreen.popMatrix();
      }
    } 
  }
}
void drawMetaDiceGrig(){
  float grid = 60f;
  offscreen.translate(-1*grid/1.0,-1*grid/1.0,-1*grid/1.0);
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
      for(int k=0; k<3; k++){
        int m = (i+i*j+i*j*k);
        offscreen.pushMatrix();
        offscreen.translate(i*grid,j*grid,k*grid);
        offscreen.scale(0.3);//
        offscreen.scale(1.0+abs(in.left.get(m)));
        drawMetaDice((m+(frameCount)/10)%7);
        offscreen.popMatrix();
      }
    } 
  }
}
void drawDice(int i){
  if(i==0)  one();
  if(i==1)  two();
  if(i==2)  three();
  if(i==3)  four();
  if(i==4)  five();
  if(i==5)  six();
  if(i==6)  seven();
}
void drawMetaDice(int i){
  if(i==0)  metaone();
  if(i==1)  metatwo();
  if(i==2)  metathree();
  if(i==3)  metafour();
  if(i==4)  metafive();
  if(i==5)  metasix();
  if(i==6)  metaseven();
}
void metaone(){
  offscreen.pushMatrix();
  offscreen.box(10,220,10);
  metabox(60);
  offscreen.endShape();
  offscreen.popMatrix();
}
void metatwo(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  
  offscreen.translate(0,-70);
  metabox(40);
  offscreen.translate(0, 70*2);
  metabox(40);
  offscreen.popMatrix();
}
void metathree(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  metabox(60);
  offscreen.translate(0,-70);
  metabox(40);
  offscreen.translate(0, 70*2);
  metabox(40);
  offscreen.popMatrix();
}
void metafour(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  
  offscreen.translate(0,-70);
  metabox(40);
  offscreen.translate(0, 70*2);
  metabox(40);
  offscreen.translate(70,-70);
  metabox(40);
  offscreen.translate(-70*2,0);
  metabox(40);
  offscreen.popMatrix();
}
void metafive(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  metabox(60);
  offscreen.translate(0,-70);
  metabox(40);
  offscreen.translate(0, 70*2);
  metabox(40);
  offscreen.translate(70,-70);
  metabox(40);
  offscreen.translate(-70*2,0);
  metabox(40);
  offscreen.popMatrix();
}
void metasix(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  offscreen.box(10,10,220);
  
  offscreen.translate(0,-70);
  metabox(40);
  offscreen.translate(0, 70*2);
  metabox(40);
  offscreen.translate(70,-70);
  metabox(40);
  offscreen.translate(-70*2,0);
  metabox(40);
  offscreen.translate(70,0,70);
  metabox(40);
  offscreen.translate(0,0,-70*2);
  metabox(40);
  offscreen.popMatrix();
}
void metaseven(){
  offscreen.pushMatrix();
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  offscreen.box(10,10,220);
  metabox(60);
  offscreen.translate(0,-70);
  metabox(40);
  offscreen.translate(0, 70*2);
  metabox(40);
  offscreen.translate(70,-70);
  metabox(40);
  offscreen.translate(-70*2,0);
  metabox(40);
  offscreen.translate(70,0,70);
  metabox(40);
  offscreen.translate(0,0,-70*2);
  metabox(40);
  offscreen.popMatrix();
}
void metabox(float s){
  offscreen.pushMatrix();
  offscreen.scale(s/100f);
  drawDice((frameCount/100)%7);
  offscreen.popMatrix();  
}
void one(){
  offscreen.pushMatrix();
  offscreen.box(10,220,10);
  offscreen.box(60);
  offscreen.endShape();
  offscreen.popMatrix();
}
void two(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  
  offscreen.translate(0,-70);
  offscreen.box(40);
  offscreen.translate(0, 70*2);
  offscreen.box(40);
  offscreen.popMatrix();
}
void three(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  offscreen.box(60);
  offscreen.translate(0,-70);
  offscreen.box(40);
  offscreen.translate(0, 70*2);
  offscreen.box(40);
  offscreen.popMatrix();
}
void four(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  
  offscreen.translate(0,-70);
  offscreen.box(40);
  offscreen.translate(0, 70*2);
  offscreen.box(40);
  offscreen.translate(70,-70);
  offscreen.box(40);
  offscreen.translate(-70*2,0);
  offscreen.box(40);
  offscreen.popMatrix();
}
void five(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  offscreen.box(60);
  offscreen.translate(0,-70);
  offscreen.box(40);
  offscreen.translate(0, 70*2);
  offscreen.box(40);
  offscreen.translate(70,-70);
  offscreen.box(40);
  offscreen.translate(-70*2,0);
  offscreen.box(40);
  offscreen.popMatrix();
}
void six(){
  offscreen.pushMatrix();
  
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  offscreen.box(10,10,220);
  
  offscreen.translate(0,-70);
  offscreen.box(40);
  offscreen.translate(0, 70*2);
  offscreen.box(40);
  offscreen.translate(70,-70);
  offscreen.box(40);
  offscreen.translate(-70*2,0);
  offscreen.box(40);
  offscreen.translate(70,0,70);
  offscreen.box(40);
  offscreen.translate(0,0,-70*2);
  offscreen.box(40);
  offscreen.popMatrix();
}
void seven(){
  offscreen.pushMatrix();
  offscreen.box(10,220,10);
  offscreen.box(220,10,10);
  offscreen.box(10,10,220);
  offscreen.box(60);
  offscreen.translate(0,-70);
  offscreen.box(40);
  offscreen.translate(0, 70*2);
  offscreen.box(40);
  offscreen.translate(70,-70);
  offscreen.box(40);
  offscreen.translate(-70*2,0);
  offscreen.box(40);
  offscreen.translate(70,0,70);
  offscreen.box(40);
  offscreen.translate(0,0,-70*2);
  offscreen.box(40);
  offscreen.popMatrix();
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioInput source;

  BeatListener(BeatDetect beat, AudioInput source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////


void doCurves(){
  curves       = createImage(256, 256, RGB);//loadImage("_curves/curve_001_updownz.png");//baseTexture.jpg");
  xcurves      = createImage(256, 256, RGB);
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      //curves.set(i,j,color(map(i,0,curves.width,0,255)));///(j+1)));
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*64)%256, random(256)));//,255,255));///(j+1)));
      float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;//+100;
      //float v  = map(i, 0, curves.width, 0, 256);//+100;
      curves.set(i, j, color(v));//,255,255));//255));///(j+1)));
    }
  }
}

