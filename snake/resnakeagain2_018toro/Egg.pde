class Egg{
  PVector pos;
  
  Egg(){
    pos = new PVector();
    rebirth();
  }
  void rebirth(){
    pos.x = int(random(cols));
    pos.y = int(random(rows));
  }
  void update(){
  }
  void draw(PGraphics pg){
    pg.pushMatrix();
    pg.translate(cellsize/2,cellsize/2);
    pg.translate(pos.x*cellsize, pos.y*cellsize);
    pg.ellipse(0,0,cellsize,cellsize);
    pg.popMatrix();
  }
  void draw3D(PGraphics pg){
    pg.pushMatrix();
    pg.translate(cellsize/2,cellsize/2,cellsize/2);
    pg.translate(pos.x*cellsize, pos.y*cellsize);
    pg.sphere(cellsize/2);
    pg.popMatrix();
  }
}
