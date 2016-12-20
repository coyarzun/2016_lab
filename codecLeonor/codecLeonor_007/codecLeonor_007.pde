import ddf.minim.*;
import ddf.minim.analysis.*;
/////////////////////////////////////////////////
Minim minim;
AudioInput in;
BeatDetect beat;
BeatListener bl;
/////////////////////////////////////////////////
PGraphics offscreen;
int       scaleDiv;
/////////////////////////////////////////////////
float     kickSize, snareSize, hatSize;
/////////////////////////////////////////////////
PShader   colorshader, feedbackShader;
PImage    curves, xcurves;
/////////////////////////////////////////////////
int       screen;
int       dice1, dice2, dice3;
boolean   soundReactive;
boolean   doRandomColor;
boolean   doColorShader, doFeedbackShader;
boolean   doXCurves;
boolean   blinkDoColor, blinkDoFeedback;
boolean   doAdd, doGlitch;
boolean   doOrtho;
boolean   doXRot, doYRot;
boolean   doScale;
boolean   doBGWhite = true;

/////////////////////////////////////////////////
void keyPressed() {
  if(key=='1') screen = 0;
  if(key=='2') screen = 1;
  if(key=='3') screen = 2;
  //if(key=='4') screen = 3;
  if(key=='4') screen = 4;
  if(key=='5') screen = 5;
  if(key=='6') screen = 6;
  //if(key=='8') screen = 7;

  if(key=='s') soundReactive=!soundReactive;
  if(key=='r') doRandomColor=!doRandomColor;
  if(key=='q') doColorShader=!doColorShader;
  if(key=='f') doFeedbackShader=!doFeedbackShader;
  if(key=='w') doBGWhite=!doBGWhite;
  if(key=='e') doXCurves=!doXCurves;
  if(key=='d') blinkDoColor=!blinkDoColor;
  if(key=='v') blinkDoFeedback=!blinkDoFeedback;
  //if(key=='a') doAdd=!doAdd;
  if(key=='g') doGlitch=!doGlitch;
  if(key=='o') doOrtho=!doOrtho;
  if(key=='x') doXRot=!doXRot;
  if(key=='y') doYRot=!doYRot;
  if(key=='z') doScale=!doScale;  

  if(key=='c')doCurves();
}
void setup() {
  size(displayWidth, displayHeight/2, P3D);
  colorMode(HSB);
  offscreen = createGraphics(width, height, P3D);
  offscreen.colorMode(HSB);

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
  doBeatStuff();
  doShadersStuff();
  noCursor();
  switch(screen){
    case 0: default: scene01(); break;
    case 1: scene02(); break;
    case 2: scene03(); break;
    case 3: scene04(); break;
    case 4: scene05(); break;
    case 5: scene06(); break;
    case 6: scene07(); break;
    case 7: scene08(); break;
  }
  if(doFeedbackShader)
  shader(feedbackShader);
  else resetShader();
  image(offscreen,0,0);
}

///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////

void doShadersStuff(){
  colorshader.set("resolution", float(width), float(height));
  feedbackShader.set("resolution", float(width), float(height));
  feedbackShader.set("time", radians(millis()*0.005));//millis()));
  feedbackShader.set("textureMap", doXCurves?xcurves:curves);
  //feedbackShader.set("leftGlitch",  doGlitch?random(width/2):0);
  feedbackShader.set("rightGlitch", doGlitch?random(1.0):1.0);
  if(blinkDoColor)    doColorShader    = !(random(100)>60) || frameCount%16==0;
  if(blinkDoFeedback) doFeedbackShader = !(random(100)>60) || frameCount%16==0;
}
void doBeatStuff(){
  if ( beat.isKick() )  {
    kickSize  = 1.0f;
    dice1 = (int)random(7);
  }
  if ( beat.isSnare())  {
    snareSize = 1.0f;
    dice2 = (int)random(7);
  }
  if ( beat.isHat() )   {
    hatSize   = 1.0f;
    dice3 = (int)random(7);
  }
  kickSize  = constrain(kickSize  * 0.95f, 0.1f, 1.0f);
  snareSize = constrain(snareSize * 0.95f, 0.1f, 1.0f);
  hatSize   = constrain(hatSize   * 0.95f, 0.1f, 1.0f);
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////

void scene01(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawADice(width/2,height/2, dice2);
  
  offscreen.endDraw();
}
void scene02(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawAMetaDice(width/2,height/2, dice1);
  
  offscreen.endDraw();
}
void scene03(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawAGrid(width/2,height/2, dice2);
  
  offscreen.endDraw();
}
void scene04(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawAMetaGrid(width/2,height/2, dice3);
  
  offscreen.endDraw();
}
void scene05(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawADice(width/6,height/2, dice2);
  drawADice(width/2,height/2, dice1);
  drawADice(5*width/6,height/2, dice3);
  offscreen.endDraw();
}
void scene06(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawAMetaDice(width/6,height/2, dice2);
  drawAMetaDice(width/2,height/2, dice1);
  drawAMetaDice(5*width/6,height/2, dice3);
  offscreen.endDraw();
}
void scene07(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawAGrid(width/6,height/2, dice2);
  drawAGrid(width/2,height/2, dice1);
  drawAGrid(5*width/6,height/2, dice3);
  offscreen.endDraw();
}
void scene08(){
  offscreen.beginDraw();
  if(doColorShader)offscreen.shader(colorshader);
  else offscreen.resetShader();
  offscreen.colorMode(HSB);
  offscreen.background(doBGWhite?255:0);
  offscreen.blendMode(doAdd?ADD:NORMAL);
  if(doOrtho)offscreen.ortho();
  else       offscreen.perspective();
  drawCircles(width/2,height/2);
  drawAMetaGrid(width/6,height/2, dice2);
  drawAMetaGrid(width/2,height/2, dice1);
  drawAMetaGrid(5*width/6,height/2, dice3);
  offscreen.endDraw();
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////

void drawADice(float x, float y, int dice){
  offscreen.pushMatrix();
  offscreen.translate(x,y);
  
  offscreen.stroke(doRandomColor ? color (random(255),255,255) : 255);
  offscreen.strokeWeight(1);
  offscreen.fill(0);
  
  offscreen.pushMatrix();
  offscreen.rotateY(doYRot?radians(frameCount):0);
  offscreen.rotateX(doXRot?radians(frameCount):0);
  offscreen.scale(soundReactive?1+snareSize*0.5:1.0);
  offscreen.scale(doScale?2:1.0);
  //drawMetaDice((frameCount/10)%7);
  //drawDiceGrig();
  drawDice(dice);
  offscreen.popMatrix();
  offscreen.popMatrix();
}
void drawAMetaDice(float x, float y, int dice){
  offscreen.pushMatrix();
  offscreen.translate(x,y);
  
  offscreen.stroke(doRandomColor ? color (random(255),255,255) : 255);
  offscreen.strokeWeight(1);
  offscreen.fill(0);
  
  offscreen.pushMatrix();
  offscreen.rotateY(doYRot?radians(frameCount):0);
  offscreen.rotateX(doXRot?radians(frameCount):0);
  offscreen.scale(soundReactive?1+snareSize*0.5:1.0);
  offscreen.scale(doScale?2:1.0);
  drawMetaDice(dice);
  offscreen.popMatrix();
  offscreen.popMatrix();
}
void drawAGrid(float x, float y, int dice){
  offscreen.pushMatrix();
  offscreen.translate(x,y);
  
  offscreen.stroke(doRandomColor ? color (random(255),255,255) : 255);
  offscreen.strokeWeight(1);
  offscreen.fill(0);
  
  offscreen.pushMatrix();
  offscreen.rotateY(doYRot?radians(frameCount):0);
  offscreen.rotateX(doXRot?radians(frameCount):0);
  offscreen.scale(soundReactive?1+snareSize*0.5:1.0);
  offscreen.scale(doScale?2:1.0);
  
  drawDiceGrig(dice);
  
  offscreen.popMatrix();
  offscreen.popMatrix();
}
void drawAMetaGrid(float x, float y, int dice){
  offscreen.pushMatrix();
  offscreen.translate(x,y);
  
  offscreen.stroke(doRandomColor ? color (random(255),255,255) : 255);
  offscreen.strokeWeight(1);
  offscreen.fill(0);
  
  offscreen.pushMatrix();
  offscreen.rotateY(doYRot?radians(frameCount):0);
  offscreen.rotateX(doXRot?radians(frameCount):0);
  offscreen.scale(soundReactive?1+snareSize*0.5:1.0);
  offscreen.scale(doScale?2:1.0);
  
  drawMetaDiceGrig(dice);
  
  offscreen.popMatrix();
  offscreen.popMatrix();
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
void drawCircles(float x, float y){
  offscreen.strokeWeight(4);
  offscreen.noFill();
  offscreen.stroke(doRandomColor ? color (random(255),255,255) : !doBGWhite?255:0);
  
  offscreen.pushMatrix();
  offscreen.translate(x,y);
  offscreen.scale(soundReactive?1+kickSize*0.5:1.0);
  offscreen.ellipse(0,0,360,360);
  
  offscreen.stroke(doRandomColor ? color (random(255),255,255) : !doBGWhite?255:0);
  
  offscreen.scale(soundReactive?1+hatSize*0.5:1.0);
  offscreen.ellipse(0,0,340,340);
  offscreen.popMatrix();

}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
void stop() {
  minim.stop();
  super.stop();
}
///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////

///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
void drawDiceGrig(int dice){
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
        drawDice((m+dice)%7);//(m+(frameCount)/10)%7);
        offscreen.popMatrix();
      }
    } 
  }
}
void drawMetaDiceGrig(int dice){
  float grid = 60f;
  offscreen.translate(-1*grid/1.0,-1*grid/1.0,-1*grid/1.0);
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
      for(int k=0; k<3; k++){
        int m = (i+i*j+i*j*k);
        offscreen.pushMatrix();
        offscreen.translate(i*grid,j*grid,k*grid);
        offscreen.scale(0.3);//
        offscreen.scale(soundReactive?1.0+abs(in.left.get(m)):1.0);
        drawMetaDice((m+dice)%7);//(m+(frameCount)/10)%7);
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
  drawDice(dice3);//(frameCount/100)%7);
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
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*32)%256, random(256)));//,255,255));///(j+1)));
      float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;//+100;
      //float v  = map(i, 0, curves.width, 0, 256);//+100;
      curves.set(i, j, color(v));//,255,255));//255));///(j+1)));
    }
  }
}

