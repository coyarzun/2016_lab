PShader shader, zhader;
PGraphics pg;
int     cfn, ctn;
String    filename;
String[]  filenameFrag;
String[]  filenameTexture;
String    filenameLight;
int total = 21;

void setup() {
  ctn = 0;
  cfn = 0;
  filename       = "vertexShader";
  filenameFrag   = new String[total];
  filenameTexture   = new String[18];
  filenameLight  = "vShader_001";
  for(int i=0; i<filenameFrag.length; i++){
    filenameFrag[i] = "fragShader_"+nf(i+1,3);
  }
  for(int i=0; i<filenameTexture.length; i++){
    filenameTexture[i] = "tShader_"+nf(i+1,3);
  }
  size(800, 400, P3D);
  pg = createGraphics(width,height,P3D);
  pg.noStroke();
  
  loadShaderF();
  loadShaderT();
}
void loadShaderT(){
  try{
  zhader = loadShader("../_shaders/"+filenameTexture[ctn]+".glsl");
  println("loading "+filenameTexture[ctn]+"...");
  }catch(Exception e){}
  zhader.set("resolution", float(width), float(height));
  
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
  zhader.set("time", frameCount*0.1*.3);  //500.0
  zhader.set("mouse", float(mouseX), float(mouseY));
  //shader.set("mouse", float(mouseX), float(mouseY));
  pg.beginDraw();
  pg.shader(shader);
  
  //image(img, 0, 0, width, height);
  pg.background(0);
  
  
  pg.translate(width/2.0,height/2.0);
  //lights();
  pg.directionalLight(0, 0, 0, 0, 0, -1);
  pg.rotateX(radians(-30.0-frameCount*0.5));
  pg.rotateY(radians(frameCount*0.2));
  pg.box(100);
  pg.box(20,400, 20);
  for(int i=0; i<36; i++){
    for(int j=0; j<18; j++){
      pg.pushMatrix();
      pg.rotateY(map(i,0,36,0,TWO_PI));
      pg.rotateZ(map(j,0,18,-PI/2.0,PI/2.0));
      pg.translate(200*cos(0.125*map(i,0,36,0.0,2.0*PI)),0);
      //fill(random(255));
      //fill(0);
      pg.box(10);
      pg.box(40,2,2);
      pg.popMatrix();
    }
  }
  
  pg.endDraw();
  pg.updatePixels();
  textureWrap(REPEAT);
  shader(zhader);
  image(pg,0,0, width, height);
  if(recording)record();
}
//isabella
boolean recording;
void record(){
  saveFrame("../_renders/_animated/"+filenameFrag+"/"+filenameFrag+"_####.png");
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
  if(keyCode==40){
    ctn--; ctn+=filenameTexture.length; ctn%=(filenameTexture.length);
    println(ctn);
    loadShaderT();
  }
  if(keyCode==38){
    ctn++; ctn%=(filenameTexture.length);
    loadShaderT();
  }
  if(keyCode==32)recording=!recording;
  if(key=='s'){
    saveFrame("../_renders/_stills/"+filenameFrag+"_####.png");
    println("still saved");
  }
}
