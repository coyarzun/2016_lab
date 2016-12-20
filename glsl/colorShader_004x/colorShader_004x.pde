PShader shader;
int     cfn;
String[]  filename;// = "pNoiseShader_040";

void setup() {
  cfn = 0;
  filename = new String[40];
  for(int i=0; i<filename.length; i++){
    filename[i] = "pNoiseShader_"+nf(i+1,3);
  }
  size(800, 400, P3D);
  noStroke();
  loadShaderF();
}
void loadShaderF(){
  shader = loadShader("../_shaders/"+filename[cfn]+".glsl");
  shader.set("resolution", float(width), float(height));
  println("loading "+filename[cfn]+"...");
}
void draw() {
  shader.set("time", frameCount*0.1*3);  //500.0
  shader(shader);
  noStroke();
  rect(0, 0, width/2, height);
  if(recording)record();
}

boolean recording;

void record(){
  saveFrame("../_renders/_animated/"+filename+"/"+filename+"_####.png");
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
    saveFrame("../_renders/_stills/"+filename+"_####.png");
    println("still saved");
  }
}
