PVector[] p, mp;
int sides;
float r, da;

void setup() {
  size(400, 400);
  r = height/2-10;

  defineRandom();
}
void draw() {
  background(255);
  stroke(200);//noFill();
  ellipse(width/2, height/2, 2*r, 2*r);
  stroke(255, 0, 255, 128);
  for (int i=0; i<sides; i++) {
    line(p[i].x, p[i].y, p[(i+1)%sides].x, p[(i+1)%sides].y);
  }
  stroke(0, 0, 255, 128);
  for (int i=0; i<sides; i++) {
    line(mp[i].x, mp[i].y, mp[(i+1)%sides].x, mp[(i+1)%sides].y);
  }
  
  for (int j=0; j<sides; j++) {
    PVector tmp1 = mp[j];
    PVector tmp2 = p[(j+1)%sides];
    PVector tmp3 = mp[(j+1)%sides];
    
    int steps = 8*4;
    float t, sx, sy, sdiam;
    float tx, ty, sa;
    boolean itsMe;
    for (int i=0; i<steps+1; i++) {
      itsMe = (frameCount)%steps==i;

      t = i/float(steps);

      PVector m1, m2, m3;
      m1 = new PVector( lerp(tmp1.x, tmp2.x, t), lerp(tmp1.y, tmp2.y, t) ); 
      m2 = new PVector( lerp(tmp2.x, tmp3.x, t), lerp(tmp2.y, tmp3.y, t) );
      m3 = new PVector( lerp(m1.x, m2.x, t), lerp(m1.y, m2.y, t) );

      sx = m3.x;//bezierPoint(a.x, c1.x, c2.x, b.x, t);
      sy = m3.y;//bezierPoint(a.y, c1.y, c2.y, b.y, t);
      if (itsMe) {
        line(m1.x, m1.y, m2.x, m2.y);
        //ellipse(m3.x, m3.y, 6, 6);
        ellipse(m1.x, m1.y, 6, 6);
        ellipse(m2.x, m2.y, 6, 6);
      }
      //sdiam = map(i, 0, steps+1, 16, 1);
      sdiam = i%16==0?8:5;
      if (itsMe) sdiam*=1.8;

      float f = map(i, 0, steps+1, 0, 1);
      color cc = lerpColor(color(255, 0, 255), color(255, 255, 0), f);

      stroke(!itsMe? cc:0);
      ellipse(sx, sy, sdiam, sdiam);

      //    tx = bezierTangent(a.x, c1.x, c2.x, b.x, t);
      //    ty = bezierTangent(a.y, c1.y, c2.y, b.y, t);
      sa = atan2((m2.y-m1.y), (m2.x-m1.x));
      sa -= HALF_PI;
      line(sx, sy, 4*sdiam*cos(sa)+sx, 4*sdiam*sin(sa)+sy);
      line(sx, sy, 4*sdiam*cos(PI+sa)+sx, 4*sdiam*sin(PI+sa)+sy);
    }
  }

  stroke(0);
  noFill();
  beginShape();
  for (int i=0; i<sides; i++) {
    PVector tmp1 = mp[i];
    PVector tmp2 = p[(i+1)%sides];
    PVector tmp3 = mp[(i+1)%sides];

    vertex(tmp1.x, tmp1.y);
    quadraticVertex(tmp2.x, tmp2.y, tmp3.x, tmp3.y);
  }
  endShape();
}
void keyPressed() {
  if(keyCode==32)defineRandom();
  if(key=='3')define(3);
  if(key=='4')define(4);
  if(key=='5')define(5);
  if(key=='6')define(6);
  if(key=='7')define(7);
  if(key=='8')define(8);
  if(key=='q')defineStar(3);
  if(key=='w')defineStar(4);
  if(key=='e')defineStar(5);
  if(key=='r')defineStar(6);
  if(key=='t')defineStar(7);
  if(key=='y')defineStar(8);
  if(key=='a')defineRandomStar();
}


void define(int ss) {
  sides = ss;
  da = TWO_PI/sides;
  p  = new PVector[sides];
  mp = new PVector[sides];

  for (int i=0; i<sides; i++) {
    p[i]=new PVector(width/2+r*cos(i*da), height/2+r*sin(i*da));
  }

  for (int i=0; i<sides; i++) {
    mp[i]=new PVector( (p[i].x+p[(i+1)%sides].x)/2, (p[i].y+p[(i+1)%sides].y)/2);
  }
  //println(p);
}



void defineRandom() {
  sides = int(random(9));
  float[] angles = new float[sides];
  float[] ratios = new float[sides];
  for (int i=0; i<sides; i++) {
    angles[i]=random(TWO_PI);
    ratios[i]=random(r/2, r*1.5);
  }
  angles = sort(angles);

  p  = new PVector[sides];
  mp = new PVector[sides];

  for (int i=0; i<sides; i++) {
    p[i]=new PVector(width/2+ratios[i]*cos(angles[i]), height/2+ratios[i]*sin(angles[i]));
  }

  for (int i=0; i<sides; i++) {
    mp[i]=new PVector( (p[i].x+p[(i+1)%sides].x)/2, (p[i].y+p[(i+1)%sides].y)/2);
  }
  //println(p);
}

void defineStar(int ss) {
  sides = 2*ss;
  da = TWO_PI/sides;
  p  = new PVector[sides];
  mp = new PVector[sides];

  for (int i=0; i<sides; i++) {
    float rr = i%2==0? r : r/3;
    p[i]=new PVector(width/2+rr*cos(i*da), height/2+rr*sin(i*da));
  }

  for (int i=0; i<sides; i++) {
    mp[i]=new PVector( (p[i].x+p[(i+1)%sides].x)/2, (p[i].y+p[(i+1)%sides].y)/2);
  }
  //println(p);
}

void defineRandomStar() {
  sides = 2*int(random(9));
  
  float[] angles = new float[sides];
  float[] ratios = new float[sides];
  
  for (int i=0; i<sides; i++) {
    angles[i]=random(TWO_PI);
    ratios[i]=i%2==0? random(r*.75, r*1.5):random(r*.5, r*.65);
  }
  angles = sort(angles);

  p  = new PVector[sides];
  mp = new PVector[sides];

  for (int i=0; i<sides; i++) {
    p[i]=new PVector(width/2+ratios[i]*cos(angles[i]), height/2+ratios[i]*sin(angles[i]));
  }

  for (int i=0; i<sides; i++) {
    mp[i]=new PVector( (p[i].x+p[(i+1)%sides].x)/2, (p[i].y+p[(i+1)%sides].y)/2);
  }
  //println(p);
}


