//from https://processing.org/reference/noise_.html
//inspired by http://www.iquilezles.org/www/articles/warp/warp.htm
PImage img;

void setup(){
  img = loadImage("wiros_400x400.jpg");
  size(400*1,200*2,P3D);
  colorMode(HSB);
  background(0);
}
void draw() {
  //if(random(1000)>990)background(img);
  for (int i=0; i< width; i+=1) {
    for (int j=0; j< height; j+=1) {  
      float rr = dist(i,j,width/2,height/2);
      float a = atan2(j-height/2,i-width/2);
      float r = rr*cos(.125*0.5*2*a);//*sin(0.0125*a);//*cos(2*a);//*cos(a);
      
      set(i, j, truco(i,j+0)+color(    
      
      //fbm(new PVector(r              , a                 ),   .005),//0.02),
      0,
      fbm(new PVector(map(r,0,rr,0,100),map(a,0,TWO_PI,0,1)),   0.02)%256,
      
      
      fbm(new PVector(map(r,0,rr,0,width),map(a,0,TWO_PI,0,1)),   0.2)%256//+frameCount
      
      ));
    }
  }
}
color truco(int i, int j){
  j%=img.height;
  return img.pixels[i+j*img.width];
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
