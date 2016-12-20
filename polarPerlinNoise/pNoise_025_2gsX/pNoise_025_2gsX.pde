//from https://processing.org/reference/noise_.html
//inspired by http://www.iquilezles.org/www/articles/warp/warp.htm
void setup(){
  size(400*1,200*1,P3D);
  colorMode(HSB);
  background(0);
}
void draw() {
  //if(random(1000)>990)background(0);
  int k=-1;
  for (int i=0; i< width; i+=1) {
    for (int j=0; j< height; j+=1) {  
      float rr = dist(i,j,width/2,height/2);
      float a = atan2(j-height/2,i-width/2);
      float r = rr*cos(.125*0.5*1*a);//*sin(0.0125*a);//*cos(2*a);//*cos(a);
      
      set(i, j, get(int(map(i,0,width,k,width-k)),
                    int(map(j,0,height,k,height-k)))
                    +color(    
      
      fbm(new PVector(r              , a                ),   .005),//0.02),
      fbm(new PVector(map(r,0,rr,0,100),map(a,0,TWO_PI,0,1)),   0.02),
      fbm(new PVector(map(r,0,rr,0,width),map(a,0,TWO_PI,0,1)),   0.2)//+frameCount
      
      ));
    }
  }
}
  
float fbm(PVector p, float noiseScale){
  float noiseVal = noise((p.x+frameCount)*noiseScale, p.y*noiseScale);
  return(256*noiseVal);
}
