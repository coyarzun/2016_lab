#define PROCESSING_COLOR_SHADER

uniform float time;
uniform vec2 resolution;


void main(void) {
  vec2 position = gl_FragCoord.xy / resolution.xy;

  vec2 rm = abs(position);
  float r = length(rm);
  float a = atan(rm.y,rm.x);


  float col = .0;
  float rr =1.0*sin(position.x*time);
  float gg =1.0*cos(position.y*time*a);
  float bb =1.0*cos(position.y*time*r);
  //col+=cos(.9*rr.x*a*60.0+r*5.-time*2.);
  

  gl_FragColor = (1.0)*vec4(rr,gg,bb,1.0);
}