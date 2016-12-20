PShader pNoise;

void setup() {
  size(400, 400, P3D);
  noStroke();
  pNoise = loadShader("pNoise.glsl");
  pNoise.set("resolution", float(width), float(height));
}

void draw() {
  pNoise.set("time", millis() / 500.0);  
  shader(pNoise);
  rect(0, 0, width, height);
}

