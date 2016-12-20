PGraphics pg;
PShader colorshader, feedbackShader;
PImage  curve;

void setup(){
  size(1920/2,1080/2,P3D);
  colorshader      = loadShader("colorShader_001.glsl");
  feedbackShader   = loadShader("feedbackShader_004.glsl");
  //curve       = loadImage("curve_001_updownz.png");//baseTexture.jpg");
  pg = createGraphics(width,height,P3D);
}
void draw(){
  colorshader.set("resolution", float(width), float(height));
  feedbackShader.set("resolution", float(width), float(height));
  
  pg.beginDraw();
  pg.shader(colorshader);
  
  pg.background(196);
  pg.translate(width/2,height/2);
  pg.rotateY(radians(frameCount));
  //pg.rotateX(radians(frameCount));
  //noStroke();
  pg.box(100);
  pg.box(20,400,20);
  pg.translate(200,0);pg.box(100);
  pg.endDraw();
  
  shader(feedbackShader);
  background(196);
  image(pg,0,0);
}
