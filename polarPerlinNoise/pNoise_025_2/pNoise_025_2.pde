//from https://processing.org/reference/noise_.html
//inspired by http://www.iquilezles.org/www/articles/warp/warp.htm
void setup(){
  size(400*2,200*2,P3D);
  //colorMode(HSB);
  background(0);
}
void draw() {
  if(random(1000)>990)background(0);
  for (int i=0; i< width; i+=1) {
    for (int j=0; j< height; j+=1) {  
      float rr = dist(i,j,width/2,height/2);
      float a = atan2(j-height/2,i-width/2);
      float r = rr*cos(.125*0.5*2*a);//*sin(0.0125*a);//*cos(2*a);//*cos(a);
      
      set(i, j, get(i-0,j+0)+color(    
      
      fbm(new PVector(r              , a                 ),   .005),//0.02),
      fbm(new PVector(map(r,0,rr,0,100),map(a,0,TWO_PI,0,1)),   0.02),
      
      
      fbm(new PVector(map(r,0,rr,0,width),map(a,0,TWO_PI,0,1)),   0.2)//+frameCount
      
      ));
    }
  }
if (recording)record();
}
String  filename = "ppNoise_025_2";
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
