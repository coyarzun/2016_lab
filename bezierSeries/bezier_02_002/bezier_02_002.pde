PVector[] p, mp;
int sides;
float r, da;

size(400,400);
sides = 3;
r = 100;
da = TWO_PI/sides;
p  = new PVector[sides];
mp = new PVector[sides];

for(int i=0; i<sides; i++){
  p[i]=new PVector(width/2+r*cos(i*da),height/2+r*sin(i*da));
}

for(int i=0; i<sides; i++){
  mp[i]=new PVector( (p[i].x+p[(i+1)%sides].x)/2, (p[i].y+p[(i+1)%sides].y)/2);
}


stroke(200);
ellipse(width/2, height/2, 2*r, 2*r);

for(int i=0; i<sides; i++){
    line(p[i].x,p[i].y,p[(i+1)%sides].x,p[(i+1)%sides].y);
}
for(int i=0; i<sides; i++){
    line(mp[i].x,mp[i].y,mp[(i+1)%sides].x,mp[(i+1)%sides].y);
}



