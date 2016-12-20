#define PROCESSING_COLOR_SHADER

#define PI 3.14159265358979323846

uniform float time;
uniform vec2 resolution;


void main(void) {
  vec2 position = gl_FragCoord.xy / resolution.xy;

  vec2 rm = abs(position);
  float r = length(rm);
  float a = atan(rm.y,rm.x);


  float rr =r*1.0*sin(time*1.0*a);
  float gg =r*1.0*cos(position.y*time*1.0*a);
  float bb =r*1.0*tan(time*1.0*position.y);
  

  gl_FragColor = (1.0)*vec4(rr,gg,bb,1.0);
}