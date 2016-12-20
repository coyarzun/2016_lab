#define PROCESSING_COLOR_SHADER

uniform float time;
uniform vec2 resolution;


void main(void) {
  vec2 position = gl_FragCoord.xy / resolution.xy;
  vec2 uv = abs(-1. +2.*position);
  float l = length(uv);
  float a = atan(uv.y,uv.x);
  float col = .0;
  col+=1.5*sin(time+13.0*a+uv.y*20.);
  col+=cos(.9*uv.x*a*60.0+l*5.-time*2.);


  gl_FragColor = (10.2)*vec4(col);
}