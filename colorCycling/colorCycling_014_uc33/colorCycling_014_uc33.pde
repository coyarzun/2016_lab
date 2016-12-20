import processing.video.*;
import promidi.*;
PApplet p = this;
UC33 uc33;

PImage img;
Movie video;

void setup(){
  size(400,400,P3D);
  colorMode(HSB);//,360,100,100);
  img = loadImage("mandy_400x400.jpg");
  uc33 = new UC33();
  background(img);
}
void draw(){
  uc33.update();
  processImage();
  if(uc33.player[0].boolVal)sideShear();
  if(uc33.player[1].boolVal)xyshear();
  if(uc33.player[2].boolVal)sideShear();
   //background(img);
}
void processImage(){
  //img.loadPixels();
  loadPixels();
  float h,s,b,hh;
  for(int i=0; i<img.pixels.length; i++){
    h = hue(img.pixels[i]);
    s = saturation(img.pixels[i]);
    b = brightness(img.pixels[i]);
    hh = b;//map(b,0,100,0,360);
    hh+=frameCount*map(uc33.faders[1].normVal,0,1,0,16); hh%=256;
    s+=frameCount*map(uc33.faders[2].normVal,0,1,0,16);s%=256;
    b+=frameCount*map(uc33.faders[3].normVal,0,1,0,16);b%=256;
    pixels[i] = color(hh,255,b);
  }
  updatePixels();
}
void sideShear() {
  loadPixels();
  for (int i=0; i<width; i+=2) {
    for (int j=0; j<height; j++) {
      float rr=1;
      //if(j%32==0)
      rr=map(uc33.faders[4].normVal,0,1,0,16);
      int k  = j*width+i;
      float amp = map(uc33.faders[5].normVal,0,1,0,1*width);
      int ii = i+(int)((sin(radians(frameCount)*rr+map(j,0,height,0,PI)))*amp);//dX[i];//*random(-1,1)
      if (ii<0)ii+=width;
      if (ii>width-1)ii%=width;
      int kk = j*width+ii;
      kk%=pixels.length;
      pixels[k] = pixels[kk];
    }
  }
  updatePixels();
}









void xyshear() {
  int hsteps = width;
  int vsteps = height;
  
  int[][] dX = new int[hsteps][vsteps];
  int[][] dY = new int[hsteps][vsteps];
  
  PVector a, b, c1, c2;
  PVector aa, bb, cc1, cc2;

  a  = new PVector(map(uc33.knobs[0].normVal,0,1,0,width),map(uc33.knobs[8].normVal,0,1,0,height));//((Draggable)d.get(0));
  b  = new PVector(map(uc33.knobs[1].normVal,0,1,0,width),map(uc33.knobs[9].normVal,0,1,0,height));//((Draggable)d.get(1));
  c1 = new PVector(map(uc33.knobs[2].normVal,0,1,0,width),map(uc33.knobs[10].normVal,0,1,0,height));//((Draggable)d.get(2));
  c2 = new PVector(map(uc33.knobs[3].normVal,0,1,0,width),map(uc33.knobs[11].normVal,0,1,0,height));//((Draggable)d.get(3));
  
  aa  = new PVector(map(uc33.knobs[4].normVal,0,1,0,width),map(uc33.knobs[12].normVal,0,1,0,height));//((Draggable)d.get(4));
  bb  = new PVector(map(uc33.knobs[5].normVal,0,1,0,width),map(uc33.knobs[13].normVal,0,1,0,height));//((Draggable)d.get(5));
  cc1 = new PVector(map(uc33.knobs[6].normVal,0,1,0,width),map(uc33.knobs[14].normVal,0,1,0,height));//((Draggable)d.get(6));
  cc2 = new PVector(map(uc33.knobs[7].normVal,0,1,0,width),map(uc33.knobs[15].normVal,0,1,0,height));//((Draggable)d.get(7));

  
  for (int i=0; i<hsteps; i++) {
      float t = i/float(hsteps);
      float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
      float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
      float tdX = int(sx-i);//width/2);
      float tdY = 0;//-int(sy-height/2);
      for (int j=0; j<vsteps; j++) {
        float tt = j/float(vsteps);
        float ssx = bezierPoint(aa.x, cc1.x, cc2.x, bb.x, tt);
        float ssy = bezierPoint(aa.y, cc1.y, cc2.y, bb.y, tt);
        dX[i][j] = -int(ssx-width/2+tdX);;
        dY[i][j] = int(ssy-j+tdY);//height/2);
      }
  }

  loadPixels();
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      
      int ii = i+dX[i][j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      
      int jj = j+dY[i][j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      
      
      int kk = jj*width+ii;
      
      if (kk<0)kk+=pixels.length;
      kk%=pixels.length;
      
      pixels[k] = pixels[kk];
    }
  }
  updatePixels();
}
