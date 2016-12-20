import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
BeatDetect beat;
BeatListener bl;

PGraphics offscreen;
int       scaleDiv;

float kickSize, snareSize, hatSize;

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
}
void draw() {
  if ( beat.isKick() )  kickSize  = 1.0f;
  if ( beat.isSnare() ) snareSize = 1.0f;
  if ( beat.isHat() )   hatSize   = 1.0f;
  kickSize  = constrain(kickSize  * 0.95f, 0.1f, 1.0f);
  snareSize = constrain(snareSize * 0.95f, 0.1f, 1.0f);
  hatSize   = constrain(hatSize   * 0.95f, 0.1f, 1.0f);
  
  background(196);
  
  pushMatrix();
  translate(width/2,height/2);
  scale(1+kickSize*0.5);
  stroke(0);strokeWeight(1);noFill();
  ellipse(0,0,360,360);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  scale(1+snareSize*0.5);
  stroke(0);strokeWeight(1);fill(255);
  drawShape((frameCount/10)%7);
  popMatrix();
  
  
  pushMatrix();
  translate(width/2,height/2);
  scale(1+hatSize*0.5);
  stroke(0);strokeWeight(1);noFill();
  ellipse(0,0,340,340);
  popMatrix();
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
void keyPressed() {
}
void stop() {
  minim.stop();
  super.stop();
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////

void drawShape(int i){
  if(i==0)  one();
  if(i==1)  two();
  if(i==2)  three();
  if(i==3)  four();
  if(i==4)  five();
  if(i==5)  six();
  if(i==6)  seven();
}
void one(){
  pushMatrix();
  box(10,220,10);
  box(60);
  endShape();
  popMatrix();
}
void two(){
  pushMatrix();
  
  box(10,220,10);
  
  translate(0,-70);
  box(40);
  translate(0, 70*2);
  box(40);
  popMatrix();
}
void three(){
  pushMatrix();
  
  box(10,220,10);
  box(60);
  translate(0,-70);
  box(40);
  translate(0, 70*2);
  box(40);
  popMatrix();
}
void four(){
  pushMatrix();
  
  box(10,220,10);
  box(220,10,10);
  
  translate(0,-70);
  box(40);
  translate(0, 70*2);
  box(40);
  translate(70,-70);
  box(40);
  translate(-70*2,0);
  box(40);
  popMatrix();
}
void five(){
  pushMatrix();
  
  box(10,220,10);
  box(220,10,10);
  box(60);
  translate(0,-70);
  box(40);
  translate(0, 70*2);
  box(40);
  translate(70,-70);
  box(40);
  translate(-70*2,0);
  box(40);
  popMatrix();
}
void six(){
  pushMatrix();
  
  box(10,220,10);
  box(220,10,10);
  box(10,10,220);
  
  translate(0,-70);
  box(40);
  translate(0, 70*2);
  box(40);
  translate(70,-70);
  box(40);
  translate(-70*2,0);
  box(40);
  translate(70,0,70);
  box(40);
  translate(0,0,-70*2);
  box(40);
  popMatrix();
}
void seven(){
  pushMatrix();
  box(10,220,10);
  box(220,10,10);
  box(10,10,220);
  box(60);
  translate(0,-70);
  box(40);
  translate(0, 70*2);
  box(40);
  translate(70,-70);
  box(40);
  translate(-70*2,0);
  box(40);
  translate(70,0,70);
  box(40);
  translate(0,0,-70*2);
  box(40);
  popMatrix();
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

