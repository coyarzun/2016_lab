//fragShader
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PI 3.14159265358979323846

varying vec3 vertNormal;
varying vec3 vertLightDir;

uniform float time;

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main() {  
  float intensity;
  vec4 color;
  intensity = max(0.0, dot(vertLightDir, vertNormal));

  //color = vec4(vertNormal,1.0);//vec3(intensity)

  vec3 rgb = rgb2hsv(
                vec3(
                      vertNormal.x,//intensity*mod(time,1.0),
                      vertNormal.y,//intensity*(0.5+0.5*sin(mod(time,2.0*PI))),
                      vertNormal.z//intensity*(0.5+0.5*cos(mod(time,2.0*PI)))
                ));

  rgb.x+=time;rgb.x=mod(rgb.x,1.0);

  color = vec4( 
                hsv2rgb( rgb )
                
                ,
                1.0);

  gl_FragColor = color;  
}