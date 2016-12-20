//from https://processing.org/reference/noise_.html
//inspired by http://www.iquilezles.org/www/articles/warp/warp.htm
void setup(){
  size(800,400,P3D);
  //colorMode(HSB);
}
void draw() {
  for (int i=0; i< width; i++) {
    for (int j=0; j< height; j++) {  
      float rr = dist(i,j,width/2,height/2);
      float a = atan2(j-height/2,i-width/2);
      float r = rr*cos(0.125*a);//*cos(a);
      
      set(i, j, color(    
      
      fbm(new PVector(r              , a                 ),   0.02),
      fbm(new PVector(map(r,0,rr,0,1),map(a,0,TWO_PI,0,1)),   0.02),
      fbm(new PVector(map(r,0,rr,0,width),map(a,0,TWO_PI,0,1)),   .2)//+frameCount
      
      ));
    }
  }
  if (recording)record();
}
String  filename = "ppNoise_017";
boolean recording;

void record() {
  saveFrame("../_render/_animated/"+filename+"/"+filename+"_####.png");
  println("saving zqnce");
}
void keyPressed() {
  if (keyCode==32)recording=!recording;
  if (key=='s') {
    saveFrame("../_render/_stills/"+filename+"_####.png");
    println("still saved");
  }
}
  
float fbm(PVector p, float noiseScale){
  float noiseVal = noise((p.x+frameCount)*noiseScale, p.y*noiseScale);
  return(256*noiseVal);
}
