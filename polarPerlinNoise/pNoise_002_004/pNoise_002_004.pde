
void setup(){
  size(400*1,200*2,P3D);
  colorMode(HSB);
  background(0);
}
void draw() {
  int k=8;
  for (int i=0; i< width; i+=1) {
    for (int j=0; j< height; j+=1) {  
      float rr = dist(i,j,width/2,height/2);
      float a = atan2(j-height/2,i-width/2);
      float r = rr;//*cos(0.125*16*0.5*a);
      
      set(i, j, 
               get(i,j)
               +color(    
      fbm(new PVector(i              , j                ),   .005),//,//0.02),
      fbm(new PVector(i              , j                ),   .005),//,//0.02),
      fbm(new PVector(i              , j                ),   .005)
      ));
    }
  }
}
  
float fbm(PVector p, float noiseScale){
  float noiseVal = noise((p.x+frameCount)*noiseScale, (p.y+0*frameCount)*noiseScale);
  return(255*noiseVal);
  //return random(255);
}
void keyPressed(){
  background(0);
}
