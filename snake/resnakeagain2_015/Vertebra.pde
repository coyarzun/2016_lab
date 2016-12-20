class Vertebra{
  PVector pos;
  int   direction;

  Vertebra(PVector p, int d){
    pos = new PVector(p.x,p.y);
    update(pos,d);
  }
  void update(PVector p, int d){
    pos.x = p.x;
    pos.y = p.y; 
    pos.z = p.z; 
    direction = d;
  }
  void draw(PGraphics pg){
    pg.stroke(0);
    pg.pushMatrix();
    pg.rectMode(CENTER);
    pg.translate(cellsize/2,cellsize/2);
    pg.translate(pos.x*cellsize, pos.y*cellsize);
    pg.rotate(direction*HALF_PI);
    pg.rect(0, 0, cellsize, cellsize);
    pg.popMatrix();
  }
  void draw3D(PGraphics pg){
    pg.stroke(0);
    pg.pushMatrix();
    //pg.rectMode(CENTER);
    pg.translate(cellsize/2,cellsize/2,cellsize/2);
    pg.translate(pos.x*cellsize, pos.y*cellsize, pos.z*cellsize);
    pg.rotate(direction*HALF_PI);
    pg.box(cellsize);
    pg.popMatrix();
  }
  void setZ(int i){
    pos.z = 0;//-i;
  }
}

