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
PImage  curve;

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
  feedbackShader   = loadShader("feedbackShader_008.glsl");
}
void draw() {
  if ( beat.isKick() )  kickSize  = 1.0f;
  if ( beat.isSnare() ) snareSize = 1.0f;
  if ( beat.isHat() )   hatSize   = 1.0f;
  kickSize  = constrain(kickSize  * 0.95f, 0.1f, 1.0f);
  snareSize = constrain(snareSize * 0.95f, 0.1f, 1.0f);
  hatSize   = constrain(hatSize   * 0.95f, 0.1f, 1.0f);
  
  
  colorshader.set("resolution", float(width), float(height));
  feedbackShader.set("resolution", float(width), float(height));
  feedbackShader.set("time", radians(millis()*0.005));//millis()));
  
  shader(colorshader);
  background(196);
  ortho();
  pushMatrix();
  translate(width/2,height/2);
  scale(1+kickSize*0.5);
  stroke(0);strokeWeight(1);noFill();
  ellipse(0,0,360,360);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  
  stroke(0);strokeWeight(1);fill(255);
  
  pushMatrix();
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  scale(1+snareSize*0.5);
  scale(2);
  drawMetaDice((frameCount/10)%7);
  popMatrix();
  
  pushMatrix();
  translate(-width/3,0);
    
  
  pushMatrix();
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  scale(1+kickSize*0.5);
  scale(2);
  //drawMetaDiceGrig();
  popMatrix();
  
  
  translate(2*width/3,0);
  
  pushMatrix();
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  scale(1+hatSize*0.5);
  //drawDiceGrig();
  popMatrix();
  
  popMatrix();
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
void drawDiceGrig(){
  float grid = 60f;
  translate(-1*grid/1.0,-1*grid/1.0,-1*grid/1.0);
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
      for(int k=0; k<3; k++){
        int m = (i+i*j+i*j*k);
        pushMatrix();
        translate(i*grid,j*grid,k*grid);
        scale(0.3);//
        scale(1.0+abs(in.left.get(m)));
        drawDice((m+(frameCount)/10)%7);
        popMatrix();
      }
    } 
  }
}
void drawMetaDiceGrig(){
  float grid = 60f;
  translate(-1*grid/1.0,-1*grid/1.0,-1*grid/1.0);
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
      for(int k=0; k<3; k++){
        int m = (i+i*j+i*j*k);
        pushMatrix();
        translate(i*grid,j*grid,k*grid);
        scale(0.3);//
        scale(1.0+abs(in.left.get(m)));
        drawMetaDice((m+(frameCount)/10)%7);
        popMatrix();
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
  pushMatrix();
  box(10,220,10);
  metabox(60);
  endShape();
  popMatrix();
}
void metatwo(){
  pushMatrix();
  
  box(10,220,10);
  
  translate(0,-70);
  metabox(40);
  translate(0, 70*2);
  metabox(40);
  popMatrix();
}
void metathree(){
  pushMatrix();
  
  box(10,220,10);
  metabox(60);
  translate(0,-70);
  metabox(40);
  translate(0, 70*2);
  metabox(40);
  popMatrix();
}
void metafour(){
  pushMatrix();
  
  box(10,220,10);
  box(220,10,10);
  
  translate(0,-70);
  metabox(40);
  translate(0, 70*2);
  metabox(40);
  translate(70,-70);
  metabox(40);
  translate(-70*2,0);
  metabox(40);
  popMatrix();
}
void metafive(){
  pushMatrix();
  
  box(10,220,10);
  box(220,10,10);
  metabox(60);
  translate(0,-70);
  metabox(40);
  translate(0, 70*2);
  metabox(40);
  translate(70,-70);
  metabox(40);
  translate(-70*2,0);
  metabox(40);
  popMatrix();
}
void metasix(){
  pushMatrix();
  
  box(10,220,10);
  box(220,10,10);
  box(10,10,220);
  
  translate(0,-70);
  metabox(40);
  translate(0, 70*2);
  metabox(40);
  translate(70,-70);
  metabox(40);
  translate(-70*2,0);
  metabox(40);
  translate(70,0,70);
  metabox(40);
  translate(0,0,-70*2);
  metabox(40);
  popMatrix();
}
void metaseven(){
  pushMatrix();
  box(10,220,10);
  box(220,10,10);
  box(10,10,220);
  metabox(60);
  translate(0,-70);
  metabox(40);
  translate(0, 70*2);
  metabox(40);
  translate(70,-70);
  metabox(40);
  translate(-70*2,0);
  metabox(40);
  translate(70,0,70);
  metabox(40);
  translate(0,0,-70*2);
  metabox(40);
  popMatrix();
}
void metabox(float s){
  pushMatrix();
  scale(s/100f);
  drawDice((frameCount/100)%7);
  popMatrix();  
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

