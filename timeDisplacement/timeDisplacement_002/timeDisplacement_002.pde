PImage[] zqnce;
//PGraphics pg;
int      steps;
float    dangle;

void setup(){
  size(400,400,P3D);
  steps  = 40;
  dangle = TWO_PI/float(steps);
  
  zqnce = new PImage[steps];
  PGraphics pg;//
  for(int i=0; i<steps; i++){
    pg = createGraphics(width,height,P3D);
    pg.loadPixels();
    pg.beginDraw();
    pg.background(196);
    pg.translate(width/2,height/2);
    pg.rotateY(-i*dangle);
    pg.box(100,300,100);
    pg.endDraw();
    pg.updatePixels();
    zqnce[i] = createImage(width,height,RGB);
    zqnce[i] = pg;
    //arrayCopy( zqnce[i].pixels, pg.pixels );
  }
}
void draw(){
  //println("i");
  //image(zqnce[frameCount%zqnce.length],0,0);
  int vsteps = height/steps;
  for(int i=0; i<steps; i++){
    //copy(zqnce[(i+frameCount)%zqnce.length],0,i*vsteps,width,(i+1)*vsteps,0,i*vsteps,width,(i+1)*vsteps);
   copy(zqnce[(i+frameCount)%zqnce.length],
               0, i*vsteps, width, vsteps,
               0, i*vsteps, width, vsteps); 
  }
}
