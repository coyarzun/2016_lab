PVector a,b,c1,c2;
//size(100,100);
background(255);
a  = new PVector(0,0);
b  = new PVector(width,height);
c1 = new PVector(0,height/2);
c2 = new PVector(width,height/2);
bezier(a.x,a.y,c1.x,c1.y,c2.x,c2.y,b.x,b.y);
strokeWeight(4);
point(a.x,a.y);
point(b.x,b.y);
point(c1.x,c1.y);
point(c2.x,c2.y);
