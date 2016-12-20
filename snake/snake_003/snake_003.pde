int cols, rows;
float cellsize;
Snake snake;

void setup() {
  size(400, 400, P3D);
  frameRate(2);
  cols = 20; 
  rows = 20;
  cellsize = width/float(rows);
  snake = new Snake(int(random(cols)), int(random(rows)));
}
void draw() {
  background(196);
  drawGrid();
  snake.update();
  snake.draw();
}
void drawGrid(){
  stroke(128);
  for(int i=0; i<cols;i++){
    for(int j=0; j<rows; j++){
      line(i*cellsize,0,i*cellsize,height);
      line(0,j*cellsize,height,j*cellsize);
    }
  }
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

