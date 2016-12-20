//from https://processing.org/reference/noise_.html
//inspired by http://www.iquilezles.org/www/articles/warp/warp.htm
void setup(){
  size(400,400,P3D);
}
void draw() {
  for (int i=0; i< width; i++) {
    for (int j=0; j< height; j++) {  
      set(i, j, color(    
      fbm(new PVector(i,j),            0.02/4.0),
      fbm(new PVector(width-i+1,j),      0.02/2.0),
      fbm(new PVector(i,j+frameCount), 0.02*8.0)
      ));
    }
  }
}
  
float fbm(PVector p, float noiseScale){
  float noiseVal = noise((p.x-frameCount)*noiseScale, p.y*noiseScale);
  return (255*noiseVal);
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
