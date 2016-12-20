PVector[] p, mp;
int sides;
float r, da;

void setup(){
  size(400,400);
  r = 100;
  
  define(3);
}
void define(int ss){
  sides = ss;
  da = TWO_PI/sides;
  p  = new PVector[sides];
  mp = new PVector[sides];
  
  for(int i=0; i<sides; i++){
    p[i]=new PVector(width/2+r*cos(i*da),height/2+r*sin(i*da));
  }
  
  for(int i=0; i<sides; i++){
    mp[i]=new PVector( (p[i].x+p[(i+1)%sides].x)/2, (p[i].y+p[(i+1)%sides].y)/2);
  }
//println(p);
}
void draw(){
  background(255);
  stroke(200);//noFill();
  ellipse(width/2, height/2, 2*r, 2*r);
  stroke(255,0,255,128);
  for(int i=0; i<sides; i++){
    line(p[i].x,p[i].y,p[(i+1)%sides].x,p[(i+1)%sides].y);
  }
  stroke(0,0,255,128);
  for(int i=0; i<sides; i++){
    line(mp[i].x,mp[i].y,mp[(i+1)%sides].x,mp[(i+1)%sides].y);
  }

//trace rounded
  stroke(0);noFill();
  beginShape();
  for(int i=0; i<sides; i++){
    PVector tmp1 = mp[i];
    PVector tmp2 = p[(i+1)%sides];
    PVector tmp3 = mp[(i+1)%sides];
    vertex(tmp1.x,tmp1.y);
    quadraticVertex(tmp2.x, tmp2.y, tmp3.x, tmp3.y);
  }
  endShape();
}
void keyPressed(){
  println(key);
  if(key=='3')define(3);
  if(key=='4')define(4);
  if(key=='5')define(5);
  if(key=='6')define(6);
  if(key=='7')define(7);
  if(key=='8')define(8);
}



