//from https://processing.org/reference/noise_.html
float noiseScale = 0.02;
for(int i=0; i< width; i++){
  for(int j=0; j< height; j++){  
    float noiseVal = noise((i)*noiseScale, j*noiseScale);
    set(i,j,color(255*noiseVal));
  }
}

