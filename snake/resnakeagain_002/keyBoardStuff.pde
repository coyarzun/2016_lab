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

