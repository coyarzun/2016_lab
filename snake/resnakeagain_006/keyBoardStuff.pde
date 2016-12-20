void keyPressed() {
  switch(keyCode) {
  case 37:
    snake.todirecion = 2;
    break;
  case 38:
    snake.todirecion = 3;
    break;
  case 39:
    snake.todirecion = 0;
    break;
  case 40:
    snake.todirecion = 1;
    break;
  }
}

