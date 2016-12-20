int steps;
float cycles;
float radio, da, ds;

void setup() {
  size(800, 400, P3D);
  //frameRate(10);
  steps = 36*2;
  cycles = 0.5*1;
  radio = 160;
  da = TWO_PI/float(steps);
  ds = radio*da;
}
void draw() {
  float frs = 1;
  background(196);
  translate(width/2, height/2);
  rotateX(radians(60));
  //rotateZ(radians(frameCount));
  //rotateY(radians(frameCount));
  //lights();
  for (int i=0; i<steps;i++) {
    pushMatrix();
    rotateZ(i*da);
    translate(radio, 0);
    rotateY(map(i, 0, steps, 0, cycles*TWO_PI));
    //fill(radians(frameCount)%TWO_PI-i*da<da?0:255);
    //if( int(radians(frameCount*frs)%TWO_PI/da) == i ) fill(0);
    //else 
    fill(i%2==0?255:0);
    box(5, ds, 40);
    popMatrix();
  }
  for (int i=0; i<steps; i+=steps/3) {
    float ang =radians(frameCount*frs)+i*da; 
    pushMatrix();
    rotateZ(ang);
    translate(radio, 0);
    rotateY(map(ang, 0, TWO_PI, 0, cycles*TWO_PI));
    translate(20, 0);
    float cellsize = 20;
    fill(255);//i%2==0?255:0);
    box(cellsize);
    box(cellsize*4, cellsize/5, cellsize/5 );
    popMatrix();
  }
  if (recording) {
    saveFrame("../animated/"+filename+"/"+filename+"_####.png");
    println("saving zqnce");
  }
}
boolean recording;
String filename = "moebius_011c";
void keyPressed() {
  if (keyCode==32)recording=!recording;
  if (key=='s') {
    saveFrame("../stills/"+filename+"_####.png");
    println("still saved");
  }
}


