PShader shader;
PImage  sample, curve;

void setup(){
  size(800,600,P3D);
  shader      = loadShader("colorShader_002.glsl");
  sample      = loadImage("sample.png"); 
  curve       = loadImage("baseTexture.jpg");
  shader.set("textureMap", curve);
}
void draw(){
  //shader.set("resolution", float(width), float(height));
  //shader.set("time", frameCount*0.1*.3);  //500.0
  resetShader();
  image(sample,0,0,width,height/2);
  shader(shader);
  
  image(sample,0,height/2,width,height/2);
}
