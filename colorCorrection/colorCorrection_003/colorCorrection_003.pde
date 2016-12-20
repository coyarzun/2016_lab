PShader shader;
PImage  sample, curve;

void setup(){
  size(1920/2,1080/2,P3D);
  shader      = loadShader("colorShader_004.glsl");
  sample      = loadImage("sample.png"); 
  curve       = loadImage("curve_001_updownz.png");//baseTexture.jpg");
  
}
void draw(){
  
  //shader.set("time", frameCount*0.1*.3);  //500.0
  resetShader();
  //image(sample,0,0,width,height/2);
  shader(shader);
  shader.set("textureMap", curve);
  shader.set("resolution", float(width), float(height));
  image(sample,0,0);//,height*0.0/2,width*0,height/2);
}
