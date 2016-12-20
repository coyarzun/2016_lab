#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
#define PROCESSING_TEXTURE_SHADER
#define PI 3.14159265358979323846

uniform float     time;
uniform vec2      resolution;
uniform sampler2D texture;
uniform sampler2D audioMap;

void main(void) {
  vec2 p = gl_FragCoord.xy / resolution.xy;
  p.y=1.0-p.y;
  vec2 rm = -0.5+1.0*p;

  float aspectRatio = resolution.x/resolution.y;
  rm.x *= aspectRatio;
  rm*=1.0;
  float r = length(rm);
  float a = atan(rm.y,rm.x);


  a = PI*sin(a+time);
  	//(1.0)*vec4(rr,gg,bb,1.0)
  vec4 color = texture2D(texture, p);
  vec4 o     = texture2D(audioMap, vec2(0,0));

  float rr = (p.y*1.0+cos(a/20.0))*o.r;///20.0+sin(time)
  float gg = (p.x*1.0+sin(2.0*a/10.0+sin(time)))*o.r;//r*1.0+sin(a*PI/20.0);//p.x*1.0+sin(2.0*a/10.0+sin(time));/
  float bb = (r*0.5+sin(a/3.0)*cos(a/1.0+sin(time)))*o.r;//1.0*p.x*sin(time*PI/30.);
  

 	  color.r*=rr;
    color.g+=gg;
    color.b+=bb;
    //
    color.r *= 2.2;
    //color2.g *= 3.0;
    color.b *= -1.2;

        //curves
    color.r         = texture2D(audioMap, vec2(color.r, 0)).r;
    color.g         = texture2D(audioMap, vec2(color.g, 0)).g;
    color.b         = texture2D(audioMap, vec2(color.b, 0)).b;

  gl_FragColor = color;
}