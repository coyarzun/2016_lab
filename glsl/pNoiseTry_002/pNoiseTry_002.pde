PShader pNoise;

void setup() {
  size(800, 400, P3D);
  noStroke();
  //pNoise = loadShader("pNoise_008.glsl");
  pNoise = loadShader("pNoise_009.glsl");
  pNoise.set("resolution", float(width), float(height));
}

void draw() {
  pNoise.set("time", millis() / 500.0);  //500.0
  shader(pNoise);
  rect(0, 0, width, height);
}
void keyPressed(){
  saveFrame("render/pNoise_009_test_####.png");
}

