int rows, cols;
float cellsize;
Snake snake;

void setup() {
  size(400, 400);
  frameRate(3);
  cols = 8;
  rows = 8;
  cellsize = height/float(rows);
  snake = new Snake(0,0,3);// int(random(cols)), int(random(rows)), 0);
}
void draw() {
  background(196);
  doGrid();
  
  snake.draw();
  snake.update();
}
void doGrid() {
  for (int i=0; i<cols;i++) {
    for (int j=0; j<rows;j++) {
      stroke(128);
      line(i*cellsize, 0, i*cellsize, height);
      line(0, j*cellsize, width, j*cellsize);
    }
  }
}

