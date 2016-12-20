#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

uniform sampler2D texture;
uniform sampler2D ppixels;

uniform vec2 resolution;

void main(void) {
    vec2 p = gl_FragCoord.xy/ resolution.xy;
    vec4 color = texture2D(ppixels, p);
    
    gl_FragColor    = color;
}
