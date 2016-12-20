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
    pg.translate(pos.x*cellsize, pos.y*cellsize);
    pg.rotate(direction*HALF_PI);
    //pg.rect(0, 0, cellsize, cellsize);
    pg.box(cellsize);
    pg.popMatrix();
  }
}

