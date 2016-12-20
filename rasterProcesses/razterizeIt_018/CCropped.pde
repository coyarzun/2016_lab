class CCropped{
  float  index;
  PImage img;
  float  friction;
  float  cx, cy, tox, toy, dx, dy, xoff, yoff;
  float rotacion, drotacion, torotacion, ddrotacion;
  
  CCropped(PImage im, float ind){
    index = ind;
    img  = im;
    xoff = (width-img.width)/2;
    yoff = (height-img.height)/2;
//    xoff*= ind/100f;
//    yoff*= ind/100f;
    friction = map(index, 100, 0, 0.01, 0.6);
    
    rotacion = 0;
    drotacion = radians((100-index)*0.1f);//map(index,0,100,2,17));
    doMaskTask();
  }
  void doMaskTask(){
    int[] maskArray = new int[img.pixels.length];
    for(int i=0; i<maskArray.length; i++){
      int x = i%img.width;
      int y = i/img.width;
      int cx = img.width/2;
      int cy = img.height/2;
      maskArray[i] = dist(x,y,cx,cy)>=img.width/3? 0:255;
    }
    img.mask(maskArray);
  }
  void update(){
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
    translate(cx+xoff,cy+yoff);
    pushMatrix();
    translate(img.width/2,img.height/2);
    rotateZ(rotacion);
    translate(-img.width/2,-img.height/2);
    //imageMode(
    //tint(random(255),(255),(255),(255));
    color cl = color((frameCount+index+int(random(32)))%256,random(255),255);//random(255));
    tint(cl);
    image(img,0,0);//,img.width,img.height,0,0,img.width,img.height,DARKEST);
    noTint();
    stroke(hue(cl),255,255);
    noFill();
//    rect(0,0,img.width,img.height);
    ellipse(img.width/2,img.height/2,img.width,img.height);
    popMatrix();
    popMatrix();
  }
}
