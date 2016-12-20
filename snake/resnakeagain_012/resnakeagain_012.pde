int rows, cols;
float cellsize;
PGraphics pg, pg3d;
Snake snake;
Egg   egg;

void setup() {
  size(800, 400, P3D);
  frameRate(3);
  pg   = createGraphics(width/2,height);
  pg3d = createGraphics(width/2,height, P3D); 
  cols = 16;
  rows = 16;
  cellsize = pg.height/float(rows);
  snake = new Snake(-1,0,0);// int(random(cols)), int(random(rows)), 0);
  egg   = new Egg();
}
void draw() {
  snake.update();
  egg.update();
  
  pg.beginDraw();
  pg.background(196);
  doGrid(pg);
  snake.draw(pg);
  egg.draw(pg);
  pg.endDraw();
  
  pg3d.beginDraw();
  pg3d.background(196);
  pg3d.translate(pg3d.width/2,pg3d.height/2);
  pg3d.scale(.6);
  pg3d.rotateX(radians(60));
  pg3d.translate(-pg3d.width/2,-pg3d.height/2);
  doGrid(pg3d);
  snake.draw3D(pg3d);
  egg.draw3D(pg3d);
  pg3d.endDraw();
  
  image(pg,0,0);
  image(pg3d,width/2,0);
}
void doGrid(PGraphics pg) {
  for (int i=0; i<cols+1;i++) {
    for (int j=0; j<rows+1;j++) {
      pg.stroke(128);
      pg.line(i*cellsize, 0, i*cellsize, pg.height);
      pg.line(0, j*cellsize, pg.width, j*cellsize);
    }
  }
}

