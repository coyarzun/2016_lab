
void setup(){
  size(400*1,200*1,P3D);
  colorMode(HSB);
  background(0);
}
void draw() {
  int k=8;
  for (int i=0; i< width; i+=1) {
    for (int j=0; j< height; j+=1) {  
      float rr = dist(i,j,width/2,height/2);
      float a = atan2(j-height/2,i-width/2);
      float r = rr*cos(0.125*frameCount*a);
      
      set(i, j, 
      /*get(int(map(i,0,width,k,width-k)),
                    int(map(j,0,height,k,height-k)))*/
                    get(i,j)
                    +color(    
      
      fbm(new PVector(r              , a                ),   .005),//,//0.02),
      255,255
      //fbm(new PVector(r              , a                ),   .005),//0.02),
      //fbm(new PVector(r              , a                ),   .005)//0.02),
      //fbm(new PVector(map(r,0,rr,0,1),map(a,0,TWO_PI,0,1)),   0.01)
      //fbm(new PVector(map(r,0,rr,0,width),map(a,0,TWO_PI,0,1)),   0.2)//+frameCount
      ));
    }
  }
}
  
float fbm(PVector p, float noiseScale){
  float noiseVal = noise((p.x+frameCount)*noiseScale, p.y*noiseScale);
  return(255*noiseVal);
  //return random(255);
}
