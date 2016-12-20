class VCropped{
  float  index;
  int    iwidth, iheight;
  PImage img;
  float  friction;
  float  cx, cy, tox, toy, dx, dy, xoff, yoff;
  float rotacion, drotacion, torotacion, ddrotacion;
  int[] maskArray;
  
  VCropped(int w, int h, float ind){
    index = ind;
    //img  = im;
    iwidth = w;
    iheight = h;
    img = createImage(src.width,src.height,RGB);
    xoff = (width-iwidth)/2;
    yoff = (height-iheight)/2;
//    xoff*= ind/100f;
//    yoff*= ind/100f;
    friction = map(index, 100, 0, 0.01, 0.6);
    
    rotacion = 0;
    drotacion = radians((100-index)*0.1f);//map(index,0,100,2,17));
    doMaskTask();
  }
  void doMaskTask(){
    maskArray = new int[img.pixels.length];
    int cx = img.width/2;
    int cy = img.height/2;
    for(int i=0; i<maskArray.length; i++){
      int x = i%img.width;
      int y = i/img.width;
      maskArray[i] = dist(x,y,cx,cy)>=iwidth/3? 0:255;//random(100)>50?0:255;//
    }
    //img.mask(maskArray);
  }
  void doImgStuff(PImage im){
    img.copy(im,0,0,im.width,im.height,0,0,img.width,img.height);
    img.mask(maskArray);
  }
  void update(PImage im){
    doImgStuff(im);
    tox = map(mouseX, 0, width,  cimg[0].xoff, -cimg[0].xoff);
    toy = map(mouseY, 0, height, cimg[0].yoff, -cimg[0].yoff );
    dx  = tox-cx;
    dy  = toy-cy;
    dx *= friction;
    dy *= friction;
    cx += dx;
    cy += dy;
    if(mousePressed){
      rotacion+=drotacion;//*index*4;
    }else{
      torotacion=0;
      ddrotacion = torotacion-rotacion;
      ddrotacion*=friction/100f;
      rotacion+=ddrotacion;
    }
  }
  void draw(){
    pushMatrix();
    translate(cx,cy);//cx+xoff,cy+yoff);
    pushMatrix();
    translate(img.width/2,img.height/2);
    rotateZ(rotacion);
    translate(-img.width/2,-img.height/2);
    //imageMode(
    //tint(random(255),(255),(255),(255));
    color cl = color((frameCount+index+int(random(32)))%256,random(255),255);//random(255));
    tint(cl, map(index,100,0,0,255));
    image(img,0,0);//,img.width,img.height,0,0,img.width,img.height,DARKEST);
    noTint();
    stroke(0,0);//hue(cl),255,255);//0,0);//
    stroke(cl, map(index,100,0,0,255));
    noFill();
//    rect(0,0,img.width,img.height);
//    ellipse(img.width/2,img.height/2,img.width,img.height);
//    ellipse(img.width/2,img.height/2,iwidth,iheight);
    popMatrix();
    popMatrix();
  }
}
