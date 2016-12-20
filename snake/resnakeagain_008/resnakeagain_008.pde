int rows, cols;
float cellsize;
PGraphics pg, pg3d;
Snake snake;

void setup() {
  size(800, 400, P3D);
  frameRate(3);
  pg   = createGraphics(width/2,height);
  pg3d = createGraphics(width/2,height, P3D); 
  cols = 16;
  rows = 16;
  cellsize = pg.height/float(rows);
  snake = new Snake(-1,0,0);// int(random(cols)), int(random(rows)), 0);
}
void draw() {
  snake.update();
  
  pg.beginDraw();
  pg.background(196);
  doGrid(pg);
  snake.draw(pg);
  pg.endDraw();
  
  pg3d.beginDraw();
  pg.background(196);
  doGrid(pg3d);
  snake.draw3D(pg3d);
  pg3d.endDraw();
  
  image(pg,0,0);
  image(pg3d,width/2,0);
}
void doGrid(PGraphics pg) {
  for (int i=0; i<cols;i++) {
    for (int j=0; j<rows;j++) {
      pg.stroke(128);
      pg.line(i*cellsize, 0, i*cellsize, height);
      pg.line(0, j*cellsize, width, j*cellsize);
    }
  }
}

