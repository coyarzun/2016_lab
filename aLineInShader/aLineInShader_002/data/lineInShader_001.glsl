#define PROCESSING_COLOR_SHADER
#define PI 3.14159265358979323846

uniform float     time;
uniform vec2      resolution;
uniform sampler2D audioMap;

void main(void) {
  vec2 p = gl_FragCoord.xy / resolution.xy;
  
  // vec2 rm = -1.0+2.0*p;
  // rm = abs(rm);
  // float r = length(rm);
  // float a = atan(rm.y,rm.x);


  	// float rr =a*1.0+sin(time*PI/20.0);
  	// float gg =p.x*1.0+cos(time*PI/20.);
  	// float bb =1.0*p.x*sin(time*PI/30.);
  
  	//(1.0)*vec4(rr,gg,bb,1.0)
  	vec4 color = texture2D(audioMap, p);

  gl_FragColor = color;
}