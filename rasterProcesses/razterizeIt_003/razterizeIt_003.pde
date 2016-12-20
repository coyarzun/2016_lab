float  friction;
float  cx, cy, tox, toy, dx, dy, xoff, yoff;
PImage img, src;
PImage imgs[];
PVector offsets[], pos[], topos[], dpos[];

int    total;

void setup(){
  size(400,400);
  src = loadImage("wiros_600x600.jpg");
  
  friction = 0.1;
  
  img = createImage(src.width,src.height,RGB);
  img.copy(src,0,0,src.width,src.height,0,0,img.width,img.height);
  
  xoff = (width-src.width)/2;
  yoff = (height-src.height)/2;
  total = 10;
  
  imgs    = new PImage[total];
  offsets = new PVector[total];
  pos     = new PVector[total];
  topos   = new PVector[total];
  dpos    = new PVector[total];
  
  for(int i=0; i<total; i++){
    int cell = 1;
    imgs[i] = createImage(src.width-2*i*cell,src.height-2*i*cell,RGB);
    imgs[i].copy(src, i*cell,  i*cell, width-2*i*cell, height-2*i*cell, 0,0,imgs[i].width, imgs[i].height); 
    offsets[i] = new PVector((width-img.width)/2,(height-img.height)/2);
    pos[i]     = new PVector(0,0);
    topos[i]   = new PVector(0,0);
    dpos[i]    = new PVector(0,0);
  }
}

void draw(){
  for(int i=0; i<total; i++){
    topos[i].x = map(mouseX, 0, width,  0, 2*offsets[i].x);
    topos[i].y = map(mouseY, 0, height, 0, 2*offsets[i].y);
                          
    dpos[i].x = topos[i].x-pos[i].x;
    dpos[i].y = topos[i].y-pos[i].y;
                          
    friction = map(i,0,total,0.001,0.2);
    
    dpos[i].mult(friction);
    pos[i].add(dpos[i]);
    
    image(imgs[i],pos[i].x+offsets[i].x,pos[i].y);
    //filter(INVERT);
  }
}
