PGraphics pg;
PShader colorshader, feedbackShader;
PImage  curves, xcurves;
Boolean usexShader = true;

void setup() {
  size(displayWidth, displayHeight/2, P3D);
  colorshader      = loadShader("colorShader_002.glsl");
  feedbackShader   = loadShader("feedbackShader_009.glsl");
  
  curves       = createImage(256, 256, RGB);//loadImage("_curves/curve_001_updownz.png");//baseTexture.jpg");
  xcurves      = createImage(256, 256, RGB);
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      //curves.set(i,j,color(map(i,0,curves.width,0,255)));///(j+1)));
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*8)%256, random(256)));//,255,255));///(j+1)));
      //float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;//+100;
      float v  = map(i, 0, curves.width, 0, 256);//+100;
      curves.set(i, j, color(v));//,255,255));//255));///(j+1)));
    }
  }
  
  pg = createGraphics(width, height, P3D);
}
void draw() {
  colorshader.set("resolution", float(width), float(height));
  feedbackShader.set("resolution", float(width), float(height));
  feedbackShader.set("time", radians(millis()*0.005));//millis()));
  feedbackShader.set("textureMap", usexShader?xcurves:curves);
  
  pg.beginDraw();
  //if(random(100)>50)
  pg.shader(colorshader);
  //else pg.resetShader();

  pg.background(196);
  //pg.blendMode(ADD);
  //pg.lights();
  pg.translate(width/2, height/2);

  //pg.stroke(random(255));pg.strokeWeight(random(1.0,10.0));
  //pg.noStroke();

  pg.pushMatrix();
  pg.translate(0, 0, -600);
  pg.noFill(); 
  pg.stroke(0); 
  pg.strokeWeight(10);
  pg.ellipse(0, 0, 600, 600);
  pg.popMatrix();

  pg.fill(255);
  pg.strokeWeight(1.0);//pg.noStroke();
  pg.rotateY(radians(frameCount));
  pg.rotateX(radians(frameCount));
  //pg.scale(2.5);
  pg.box(100);
  pg.box(20, 400, 20);
  pg.translate(200, 0);
  pg.box(100);
  pg.endDraw();

  //if(random(100)>50)
  shader(feedbackShader);
  //else resetShader();
  background(196);
  image(pg, 0, 0);
}
void keyPressed(){
  usexShader=!usexShader;
}
