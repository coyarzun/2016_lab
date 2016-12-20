PGraphics pg;
PShader colorshader, feedbackShader;
PImage  curve;

void setup(){
  size(displayWidth,displayHeight/2,P3D);
  colorshader      = loadShader("colorShader_002.glsl");
  feedbackShader   = loadShader("feedbackShader_008.glsl");
  //curve       = loadImage("curve_001_updownz.png");//baseTexture.jpg");
  pg = createGraphics(width,height,P3D);
}
void draw(){
  colorshader.set("resolution", float(width), float(height));
  feedbackShader.set("resolution", float(width), float(height));
  feedbackShader.set("time", radians(millis()*0.005));//millis()));
  
  pg.beginDraw();
  //if(random(100)>50)
  pg.shader(colorshader);
  //else pg.resetShader();
  
  pg.background(196);
  //pg.blendMode(ADD);
  //pg.lights();
  pg.translate(width/2,height/2);
  
  //pg.stroke(random(255));pg.strokeWeight(random(1.0,10.0));
  //pg.noStroke();
  
  pg.pushMatrix();
  pg.translate(0,0,-600);
  pg.noFill(); pg.stroke(0); pg.strokeWeight(10);
  pg.ellipse(0,0,600,600);
  pg.popMatrix();
  
  pg.fill(255);pg.strokeWeight(1.0);//pg.noStroke();
  pg.rotateY(radians(frameCount));
  pg.rotateX(radians(frameCount));
  //pg.scale(2.5);
  pg.box(100);
  pg.box(20,400,20);
  pg.translate(200,0);pg.box(100);
  pg.endDraw();
  
  //if(random(100)>50)
  shader(feedbackShader);
  //else resetShader();
  background(196);
  image(pg,0,0);
}
