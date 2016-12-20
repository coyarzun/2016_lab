PImage  img;
PShader shader;
int     cfn;
String[]  filename;
int total = 30;

void setup() {
  cfn = 0;
  img = loadImage("../_data/wiros_400x400.jpg");
  filename = new String[total];
  for(int i=0; i<filename.length; i++){
    filename[i] = "tShader_"+nf(i+1,3);
  }
  size(800, 400, P3D);
  noStroke();
  textureWrap(REPEAT);
  loadShaderF();
}
void loadShaderF(){
  try{
  shader = loadShader("../_shaders/"+filename[cfn]+".glsl");
  }catch(Exception e){}
  shader.set("resolution", float(width), float(height));
  println("loading "+filename[cfn]+"...");
}
void draw() {
  shader.set("time", frameCount*0.1*.3);  //500.0
  shader.set("mouse", float(mouseX), float(mouseY));
  shader(shader);
  image(img, 0, 0, width, height);
  if(recording)record();
}

boolean recording;

void record(){
  saveFrame("../_renders/_animated/"+filename[cfn]+"/"+filename[cfn]+"_####.png");
  println("saving zqnce");
}
void keyPressed(){
  if(keyCode==37){
    cfn--; cfn+=filename.length; cfn%=(filename.length);
    loadShaderF();
  }
  if(keyCode==39){
    cfn++; cfn%=(filename.length);
    loadShaderF();
  }
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../_renders/_stills/"+filename[cfn]+"_####.png");
    println("still saved");
  }
}
