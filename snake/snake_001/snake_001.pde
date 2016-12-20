int cols, rows;
float cellsize;
Snake snake;

void setup() {
  size(400, 400, P3D);
  frameRate(12);
  cols = 40; 
  rows = 40;
  cellsize = width/float(rows);
  snake = new Snake(int(random(cols)), int(random(rows)));
}
void draw() {
  background(196);
  drawGrid();
  snake.update();
  snake.draw();
}
void keyPressed() {
  switch(keyCode) {
  case 37:
    snake.left();
    break;
  case 38:
    snake.up();
    break;
  case 39:
    snake.right();
    break;
  case 40:
    snake.down();
    break;
  }
}

