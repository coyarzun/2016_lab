#define PROCESSING_COLOR_SHADER

uniform float time;
uniform vec2 resolution;


void main(void) {
  vec2 position = gl_FragCoord.xy / resolution.xy;

  vec2 rr = abs(position);
  float r = length(rr);
  float a = atan(rr.y,rr.x);


  vec4 col = vec4 noise4(l);
  /*
  .0;
  col+=1.0*sin(time+.0*a+rr.y*0.);
  col+=cos(.9*rr.x*a*60.0+r*5.-time*2.);
  */

  gl_FragColor = (1.0)*(col);
}