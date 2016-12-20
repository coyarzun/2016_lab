PGraphics leftBuffer, rightBuffer;
PImage    anaglyphx;

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
}
void drawSome(PGraphics pg, float eye){
  pg.beginDraw();
  pg.background(0);//196);
  //pg.lights();
  pg.translate(width/2,height/2);
  pg.translate(-eye,0,0);
  pg.rotateX(radians(-3+frameCount*0.2));
  pg.rotateY(radians(-frameCount));
  pg.box(100);
  for(float i=0; i<TWO_PI; i+=radians(10)){
    pg.pushMatrix();
    pg.rotateY(i);
    pg.translate(300,0,0);
    pg.box(20);
    pg.popMatrix();
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
