//cubic bezier dev
PImage img, pimg;
PGraphics pg;
ArrayList d;
PFont     font;
boolean render = !true;

void setup() {
  size(800, 400, P3D);//displayWidth, displayHeight);
  colorMode(HSB);
  //println(displayWidth+"x"+displayHeight);
  //frameRate(30);
  font = createFont("AndaleMono-8.vlw", 8);
  d = new ArrayList();//(20,20);
  d.add( new Draggable(0,height/2) );
  d.add( new Draggable(width, height/2) );
  d.add( new Draggable(width/2, height/4) );
  d.add( new Draggable(width/2, 3*height/4) );
  
  d.add( new Draggable(width/2, 0) );
  d.add( new Draggable(width/2, height) );
  d.add( new Draggable(width/4, height/2) );
  d.add( new Draggable(3*width/4, height/2) );
  
  pg  = createGraphics(width,height,P3D);
  //img = loadImage("noisePattern_800x400.png");
  //img = loadImage("zebraPattern_800x400.png");
  pimg = createImage(width, height, RGB);
  doImg();
  //setAuto();
}
void draw() {
  doImg();
  xyshear();  
  
  background(0);//pimg);
  image(pimg,0,0);
  image(pg,0,0,100,50);

  if (!render) {
    Draggable a, b, c1, c2;
    Draggable aa, bb, cc1, cc2;
    
    a  = ((Draggable)d.get(0));
    b  = ((Draggable)d.get(1));
    c1 = ((Draggable)d.get(2));
    c2 = ((Draggable)d.get(3));
    
    aa  = ((Draggable)d.get(4));
    bb  = ((Draggable)d.get(5));
    cc1 = ((Draggable)d.get(6));
    cc2 = ((Draggable)d.get(7));


    noFill();
    stroke(236, 0, 140);
    strokeWeight(4);
    line(a.x, a.y, c1.x, c1.y);
    line(b.x, b.y, c2.x, c2.y);
    line(c1.x, c1.y, c2.x, c2.y);
    stroke(236, 0, 140);
    bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);
    
    line(aa.x, aa.y, cc1.x, cc1.y);
    line(bb.x, bb.y, cc2.x, cc2.y);
    line(cc1.x, cc1.y, cc2.x, cc2.y);
    stroke(236, 0, 140);
    bezier(aa.x, aa.y, cc1.x, cc1.y, cc2.x, cc2.y, bb.x, bb.y);

    for (int i=0; i<d.size(); i++) {
      Draggable tmp = (Draggable)d.get(i);
      tmp.update();
      tmp.draw();
    }
    
  }else{
     for (int i=0; i<d.size(); i++) {
      Draggable tmp = (Draggable)d.get(i);
      tmp.update();
    }
    saveFrame("render/autoNoiseShearFeedback_####.png");
  }
  
  
}












