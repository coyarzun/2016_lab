PGraphics pg;
PShader colorshader, feedbackShader;
PImage  curve;

void setup(){
  size(1920/2,1080/2,P3D);
  colorshader      = loadShader("colorShader_001.glsl");
  feedbackShader   = loadShader("feedbackShader_001.glsl");
  //curve       = loadImage("curve_001_updownz.png");//baseTexture.jpg");
  pg = createGraphics(width,height,P3D);
}
void draw(){
  pg.beginDraw();
  //shader.set("time", frameCount*0.1*.3);  //500.0
  //pg.resetShader();
  //image(sample,0,0,width,height/2);
  pg.shader(colorshader);
  //shader.set("textureMap", curve);
  colorshader.set("resolution", float(width), float(height));
  //image(sample,0,0);//,height*0.0/2,width*0,height/2);
  pg.background(196);
  pg.translate(width/2,height/2);
  pg.rotateY(radians(frameCount));
  pg.rotateX(radians(frameCount));
  //noStroke();
  pg.box(100);//pg.translate(100,0);
  pg.box(20,400,20);
  //pg.translate(200,0);box(100);
  pg.endDraw();
  feedbackShader.set("resolution", float(width), float(height));
  shader(feedbackShader);
  background(196);
  image(pg,0,0);
}
