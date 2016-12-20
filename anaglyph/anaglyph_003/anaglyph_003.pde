PGraphics leftBuffer, rightBuffer;
PImage    anaglyphx;
boolean recording;
String filename = "anaglyph_003";


void setup(){
  size(800,400,P3D);
  leftBuffer  = createGraphics(width,height,P3D);
  rightBuffer = createGraphics(width,height,P3D);
  anaglyphx    = createImage(width,height,ARGB);
}
void draw(){
  drawSome(leftBuffer, -10);
  drawSome(rightBuffer, 10);
  anaglyph(leftBuffer, rightBuffer, anaglyphx);
  image(anaglyphx,0,0);
  
  recRoutine();
}
void drawSome(PGraphics pg, float eye){
  pg.beginDraw();
  pg.background(0);//196);
  pg.lights();
  pg.translate(width/2,height/2);
  pg.translate(-eye,0,0);
  pg.rotateX(radians(-3+frameCount*0.2));
  pg.rotateY(radians(-frameCount));
  pg.box(100);
  pg.pushMatrix();
  pg.rotateY(PI/4.0);
  //pg.rotateX(PI/4.0);
  pg.rotateZ(PI/4.0);
  pg.box(100);
  pg.popMatrix();
  for(float i=0; i<TWO_PI; i+=radians(10)){
    for(float j=-PI/2; j<PI/2; j+=radians(10)){
    pg.pushMatrix();
    pg.rotateY(i);
    pg.rotateZ(j);
    pg.translate(300,0,0);
    pg.box(10);
    pg.box(40,2,2);
    pg.popMatrix();
    }
  }
  pg.endDraw();
}
void anaglyph(PGraphics l, PGraphics r, PImage img){
  img.loadPixels();
  l.loadPixels();
  r.loadPixels();
  for(int i=0; i<img.pixels.length; i++){
    float red  = brightness(l.pixels[i]);
    float cyan = brightness(r.pixels[i]);
    img.pixels[i]= color ( red, cyan, cyan  ) ;
  }
  img.updatePixels();
}


void recRoutine(){
  if(recording){
    saveFrame("../_animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../_stills/"+filename+"_####.png");
    println("still saved");
  }
//  if(key=='z')zoom=!zoom;
}
