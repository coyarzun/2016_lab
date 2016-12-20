PShader shader;
String  filename = "pNoiseShader_016";

void setup() {
  size(800, 400, P3D);
  noStroke();
  shader = loadShader("../_shaders/"+filename+".glsl");
  shader.set("resolution", float(width), float(height));
}
void draw() {
  shader.set("time", frameCount*0.1*3);  //500.0
  shader(shader);
  noStroke();
  rect(0, 0, width, height);
  if(recording)record();
}

boolean recording;

void record(){
  saveFrame("../_animated/"+filename+"/"+filename+"_####.png");
  println("saving zqnce");
}
void keyPressed(){
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../_stills/"+filename+"_####.png");
    println("still saved");
  }
}
