#define PROCESSING_COLOR_SHADER

uniform float time;
uniform vec2 resolution;


void main(void) {
  vec2 position = gl_FragCoord.xy / resolution.xy;

  vec2 rm = abs(position);
  float r = length(rm);
  float a = atan(rm.y,rm.x);


  float rr =1.0*sin(time*1.0);//position.x*
  float gg =1.0*cos(position.y*time*1.0);
  float bb =1.0*tan(position.y*time*1.0);
  

  gl_FragColor = (1.0)*vec4(rr,gg,bb,1.0);
}