/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
import ddf.minim.*;

Minim      minim;
AudioInput in;

PImage     image;
PImage     auxBuffer;
PShader    shader;

void setup()
{
  //size(1024, 512, P3D);
  size(displayWidth, displayHeight, P3D);
  minim            = new Minim(this);
  in               = minim.getLineIn();
  auxBuffer        = createImage(in.bufferSize(), 1, RGB);
  shader           = loadShader("lineInShader_014.glsl");//"lineInTexShader_010.glsl");
//  image            = loadImage(
//  "/Users/coyarzun/ima/recreative/porn/4jPorn/IMG_4027.JPG"//IMG_4726.JPG"//
//  );
}  

void draw()
{
  noCursor();
  doBuffer();
  shader.set("resolution", float(width), float(height));
  shader.set("time", (frameCount)*0.1*0.5);//frameCount*0.1);//millis()/1000f);  //500.0
  shader.set("audioMap", auxBuffer);
  shader.set("rightGlitch", random(1.0));
  shader(shader);
  noStroke();
  //image(image, 0, 0,width,height);
  rect(0,0,width,height);
}
void doBuffer() {
  auxBuffer.loadPixels();
  for (int i = 0; i <auxBuffer.width; i++)
  {
    auxBuffer.set(i, 0, color(in.left.get(i)*255));//, in.right.get(i)*255,0));
  }
  auxBuffer.updatePixels();
}

