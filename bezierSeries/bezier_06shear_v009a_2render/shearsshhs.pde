void shear() {
  int[] dX = new int[height];
  int[] dY = new int[height];
  Draggable a, b, c1, c2;

  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  int steps = height;
  for (int i=0; i<steps; i++) {
    float t = i/float(steps);
    float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    dX[i] = int(sx-width/2);
    dY[i] = int(sy-i);
  }

  for (int j=0; j<height; j++) {
    for (int i=0; i<width; i++) {
      int k  = j*width+i;
      int jj = j+dY[j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      int ii = i+dX[j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      int kk = jj*width+ii;
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      pimg.pixels[k] = img.pixels[kk];
    }
  }
}
void xshear() {
  int[] dX = new int[height];
  int[] dY = new int[height];
  Draggable a, b, c1, c2;

  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  int steps = height;
  for (int i=0; i<steps; i++) {
    float t = i/float(steps);
    float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    dX[i] = int(sx-width/2);
    dY[i] = int(sy-i);
  }

  for (int j=0; j<height; j++) {
    for (int i=0; i<width; i++) {
      int k  = j*width+i;
      int jj = j+dX[j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      int ii = i+dY[j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      int kk = jj*width+ii;
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      pimg.pixels[k] = img.pixels[kk];
    }
  }
}
void wshear() {
  int[] dX = new int[height];
  int[] dY = new int[height];
  Draggable a, b, c1, c2;

  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  int steps = height;
  for (int i=0; i<steps; i++) {
    float t = i/float(steps);
    float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    dX[i] = int(sx-i);//width/2);
    dY[i] = int(sy-height/2);
  }

  
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      
      int jj = j+dY[j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      
      int ii = i+dX[j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      
      int kk = jj*width+ii;
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      
      pimg.pixels[k] = pimg.pixels[kk];
    }
  }
}
void vshear() {
  int[] dX = new int[width];
  int[] dY = new int[width];
  Draggable a, b, c1, c2;

  a  = ((Draggable)d.get(0));
  b  = ((Draggable)d.get(1));
  c1 = ((Draggable)d.get(2));
  c2 = ((Draggable)d.get(3));

  int steps = width;
  for (int i=0; i<steps; i++) {
    float t = i/float(steps);
    float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
    float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
    dX[i] = int(sx-i);//width/2);
    dY[i] = -int(sy-height/2);
  }

  
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      
      int ii = i+dX[i];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      
      int jj = j+dY[i];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      
      
      int kk = jj*width+ii;
      
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      
      pimg.pixels[k] = pimg.pixels[kk];
    }
  }
}
void xyshear() {
  int hsteps = width;
  int vsteps = height;
  
  int[][] dX = new int[hsteps][vsteps];
  int[][] dY = new int[hsteps][vsteps];
  
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

  
  for (int i=0; i<hsteps; i++) {
      float t = i/float(hsteps);
      float sx = bezierPoint(a.x, c1.x, c2.x, b.x, t);
      float sy = bezierPoint(a.y, c1.y, c2.y, b.y, t);
      float tdX = int(sx-i);//width/2);
      float tdY = -int(sy-height/2);
      for (int j=0; j<vsteps; j++) {
        float tt = j/float(vsteps);
        float ssx = bezierPoint(aa.x, cc1.x, cc2.x, bb.x, tt);
        float ssy = bezierPoint(aa.y, cc1.y, cc2.y, bb.y, tt);
        dX[i][j] = -int(ssx-width/2+tdX);;
        dY[i][j] = int(ssy-j+tdY);//height/2);
      }
  }

  
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      int k  = j*width+i;
      
      int ii = i+dX[i][j];
      if (ii<0)ii+=width;
      if (ii>width-1)ii-=width;
      
      int jj = j+dY[i][j];
      if (jj<0)jj+=height;
      if (jj>height)jj-=height;
      
      
      int kk = jj*width+ii;
      
      if (kk<0)kk+=img.pixels.length;
      kk%=img.pixels.length;
      
      pimg.pixels[k] = pimg.pixels[kk];
    }
  }
}
