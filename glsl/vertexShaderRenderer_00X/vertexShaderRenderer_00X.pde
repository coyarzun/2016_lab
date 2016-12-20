PShader shader;
int     cfn;
String    filename;
String[]  filenameFrag;
String    filenameLight;
int total = 21;

void setup() {
  cfn = 0;
  filename       = "vertexShader";
  filenameFrag   = new String[total];
  filenameLight  = "vShader_001";
  for(int i=0; i<filenameFrag.length; i++){
    filenameFrag[i] = "fragShader_"+nf(i+1,3);
  }
  size(800, 400, P3D);
  noStroke();
  loadShaderF();
}
void loadShaderF(){
  try{
  shader = loadShader("../_shaders/"+filenameFrag[cfn]+".glsl","../_shaders/"+filenameLight+".glsl");
  println("loading "+filenameFrag[cfn]+"...");
  }catch(Exception e){}
  shader.set("resolution", float(width), float(height));
  
}
void draw() {
  shader.set("time", frameCount*0.1*.3);  //500.0
  //shader.set("mouse", float(mouseX), float(mouseY));
  shader(shader);
  //image(img, 0, 0, width, height);
  background(0);
  
  
  translate(width/2.0,height/2.0);
  //lights();
  directionalLight(0, 0, 0, 0, 0, -1);
  rotateX(radians(-30.0-frameCount*0.5));
  rotateY(radians(frameCount*0.2));
  box(100);
  box(20,400, 20);
  for(int i=0; i<36; i++){
    for(int j=0; j<18; j++){
      pushMatrix();
      rotateY(map(i,0,36,0,TWO_PI));
      rotateZ(map(j,0,18,-PI/2.0,PI/2.0));
      translate(200*cos(0.125*map(i,0,36,0.0,2.0*PI)),0);
      //fill(random(255));
      //fill(0);
      box(10);
      box(40,2,2);
      popMatrix();
    }
  }
  if(recording)record();
}

boolean recording;
void record(){
  saveFrame("../_renders/_animated/"+filenameFrag[cfn]+"/"+filenameFrag[cfn]+"_####.png");
  println("saving zqnce");
}
void keyPressed(){
  if(keyCode==37){
    cfn--; cfn+=filenameFrag.length; cfn%=(filenameFrag.length);
    loadShaderF();
  }
  if(keyCode==39){
    cfn++; cfn%=(filenameFrag.length);
    loadShaderF();
  }
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../_renders/_stills/"+filenameFrag[cfn]+"_####.png");
    println("still saved");
  }
}
