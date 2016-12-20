/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
import ddf.minim.*;

Minim      minim;
AudioInput in;
PImage     auxBuffer;

void setup()
{
  size(1024, 512, P3D);
  minim            = new Minim(this);
  in               = minim.getLineIn();
  auxBuffer        = createImage(in.bufferSize(),1,RGB);
}

void draw()
{
  doBuffer();
  //background(0);
  image(auxBuffer,0,0,width,height);
}
void doBuffer(){
  auxBuffer.loadPixels();
  for(int i = 0; i <auxBuffer.width; i++)
  {
   auxBuffer.set(i,0,color(in.left.get(i)*255));//, in.right.get(i)*255,0));
  }
  auxBuffer.updatePixels();
}
