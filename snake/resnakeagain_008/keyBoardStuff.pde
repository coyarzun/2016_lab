void keyPressed() {
  switch(keyCode) {
  case 37:
    snake.setDirection(2);
    break;
  case 38:
    snake.setDirection(3);
    break;
  case 39:
    snake.setDirection(0);
    break;
  case 40:
    snake.setDirection(1);
    break;
  }
}

