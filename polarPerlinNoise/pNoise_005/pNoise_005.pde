//from https://processing.org/reference/noise_.html
float noiseScale = 0.02;

void draw() {
  for (int i=0; i< width; i++) {
    for (int j=0; j< height; j++) {  
      set(i, j, getNoise(i, j));
    }
  }
}
color getNoise(float i, float j){
  float noiseVal = noise((i-frameCount)*noiseScale, j*noiseScale);
  return color(255*noiseVal);
}
