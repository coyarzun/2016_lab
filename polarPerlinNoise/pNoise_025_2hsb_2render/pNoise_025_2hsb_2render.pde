//from https://processing.org/reference/noise_.html
//inspired by http://www.iquilezles.org/www/articles/warp/warp.htm

int torender = 30*60;//1 min

void setup(){
  size(400*1,200*1,P3D);
  colorMode(HSB);
  background(0);
}
void draw() {
  if(random(1000)>990)background(0);
  for (int i=0; i< width; i+=1) {
    for (int j=0; j< height; j+=1) {  
      float rr = dist(i,j,width/2,height/2);
      float a = atan2(j-height/2,i-width/2);
      float r = rr*cos(.125*0.5*1*a);//*sin(0.0125*a);//*cos(2*a);//*cos(a);
      
      set(i, j, get(i-0,j+0)+color(    
      
      fbm(new PVector(r              , a +PI/2                ),   .005),//0.02),
      fbm(new PVector(map(r,0,rr,0,100),map(a+PI,0,TWO_PI,0,1)),   0.02),
      
      
      fbm(new PVector(map(r,0,rr,0,width),map(a,0,TWO_PI,0,1)),   0.2)//+frameCount
      
      ));
    }
  }
  if(frameCount<=torender){
    println("rendering "+frameCount);
    saveFrame("render/pNoise_025_2_hsb_####.png");
  }else{
    noLoop();
  }
}
  
float fbm(PVector p, float noiseScale){
  float noiseVal = noise((p.x+frameCount)*noiseScale, p.y*noiseScale);
  return(256*noiseVal);
}
/*
A simple fbm is displayed in the first image to the right. The code looks like this:

  float pattern( in vec2 p )
  {
      return fbm( p );
  }

We can now add a first domain warping (second image to the right):


  float pattern( in vec2 p )
  {
      vec2 q = vec2( fbm( p + vec2(0.0,0.0) ),
                     fbm( p + vec2(5.2,1.3) ) );

      return fbm( p + 4.0*q );
  }

And then we add the second wraping (third image to the right):


  float pattern( in vec2 p )
  {
      vec2 q = vec2( fbm( p + vec2(0.0,0.0) ),
                     fbm( p + vec2(5.2,1.3) ) );

      vec2 r = vec2( fbm( p + 4.0*q + vec2(1.7,9.2) ),
                     fbm( p + 4.0*q + vec2(8.3,2.8) ) );

      return fbm( p + 4.0*r );
  }
Of course those particular offset values in the fbm calls don't have any special meaning, they are used to get different fbm values by using one single function.
*/
