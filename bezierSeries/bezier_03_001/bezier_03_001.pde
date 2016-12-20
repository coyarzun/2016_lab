ArrayList path;

void setup() {
  size(400, 400);
  path = new ArrayList();
}
void draw() {
  background(255);  
  drawPath();
}
void drawPath(){
  PVector tmp1, tmp2;
  for(int i=0; i<path.size(); i++){
    tmp1 = (PVector)path.get(i);
    int next = path.size()>1 && i<path.size()-1? i+1:i; 
    tmp2 = (PVector)path.get(next);
    stroke(200);
    ellipse(tmp1.x,tmp1.y,6,6);
    if(path.size()>1){
      line(tmp1.x,tmp1.y,tmp2.x,tmp2.y);
      ellipse(tmp2.x,tmp2.y,6,6);
    }
  }
}
void mousePressed(){
  path.add( new PVector( mouseX, mouseY ) );
}
void keyPressed() {
  if(keyCode==32){
    path.clear();
  }
}
