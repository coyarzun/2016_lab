ArrayList path, median;
PFont     font;

void setup() {
  size(2*400, 400);
  font = createFont("AndaleMono-8.vlw", 8);
  
  path = new ArrayList();
  median = new ArrayList();
}
void draw() {
  background(255);  
  drawAnyPath(path,200);
  drawAnyPath(median,color(0,255,255));
  drawQuadratic();
}
void drawQuadratic(){
  stroke(0);noFill();
  beginShape();
  int sides = median.size()-1;
  for(int i=0; i<sides; i++){
    PVector tmp1 = (PVector)median.get(i);
    PVector tmp2 = (PVector)path.get((i+1));//%sides
    PVector tmp3 = (PVector)median.get((i+1));//%sides);
    vertex(tmp1.x,tmp1.y);
    quadraticVertex(tmp2.x, tmp2.y, tmp3.x, tmp3.y);
  }
  endShape();
}
void drawAnyPath(ArrayList anyPath, color c){
  PVector tmp1, tmp2;
  for(int i=0; i<anyPath.size(); i++){
    tmp1 = (PVector)anyPath.get(i);
    int next = anyPath.size()>1 && i<anyPath.size()-1? i+1:i; 
    tmp2 = (PVector)anyPath.get(next);
    stroke(c);
    ellipse(tmp1.x,tmp1.y,6,6);
    if(anyPath.size()>1){
      line(tmp1.x,tmp1.y,tmp2.x,tmp2.y);
      ellipse(tmp2.x,tmp2.y,6,6);
      textSize(8);
      fill(0);
      text("( "+tmp2.x+", "+tmp2.y+" )", tmp2.x, tmp2.y);
    }
  }
}
void addMedian(){
  int l = path.size(); 
  if(l>1){
    PVector tmp1, tmp2;
    tmp1 = (PVector)path.get(l-2);
    tmp2 = (PVector)path.get(l-1);
    median.add( new PVector( (tmp1.x+tmp2.x)/2,(tmp1.y+tmp2.y)/2 ) );
  }
}
void mousePressed(){
  path.add( new PVector( mouseX, mouseY ) );
  addMedian();
}
void keyPressed() {
  if(keyCode==32){
    path.clear();
    median.clear();
  }
}
