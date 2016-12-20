#define PROCESSING_COLOR_SHADER
#define PI 3.14159265358979323846

uniform float     time;
uniform vec2      resolution;
uniform sampler2D audioMap;

void main(void) {
  vec2 p = gl_FragCoord.xy / resolution.xy;
  vec2 rm = p;//-0.5+1.0*p;

  float aspectRatio = resolution.x/resolution.y;
  rm.x *= aspectRatio;
  rm*=1.0;
  float r = length(rm);
  float a = atan(rm.y,rm.x);


  
  	//(1.0)*vec4(rr,gg,bb,1.0)
  vec4 color = texture2D(audioMap, p);

  float rr =a*1.0+sin(time*PI/20.0);
  float gg =p.y*1.0+cos(time*PI/20.);
  float bb =1.0*p.x*sin(time*PI/30.);
  

 	color.r*=rr;
    color.g+=gg;
    color.b+=bb;
    //
    color.r *= 2.2;
    //color2.g *= 3.0;
    color.b *= -1.2;

  gl_FragColor = color;
}