void doNoise(){
  pimg.loadPixels();for(int i=0; i<pimg.pixels.length; i++){
    pimg.pixels[i] = color( random(255),random(255),random(255) );
  };pimg.updatePixels();
}
void autoShear() {
  Draggable a, b, c1, c2;
  Draggable aa, bb, cc1, cc2;
  ((Draggable)d.get(0)).move(10, 0);
  ((Draggable)d.get(1)).move(-10, 0);
  ((Draggable)d.get(2)).move(0, 10);
  ((Draggable)d.get(3)).move(0, -10);

  ((Draggable)d.get(4)).move(10, 0);
  ((Draggable)d.get(5)).move(-10, 0);
  ((Draggable)d.get(6)).move(0, 10);
  ((Draggable)d.get(7)).move(0, -10);
  //    a  = ((Draggable)d.get(0));
  //    b  = ((Draggable)d.get(1));
  //    c1 = ((Draggable)d.get(2));
  //    c2 = ((Draggable)d.get(3));
  //    
  //    aa  = ((Draggable)d.get(4));
  //    bb  = ((Draggable)d.get(5));
  //    cc1 = ((Draggable)d.get(6));
  //    cc2 = ((Draggable)d.get(7));
}

void setAuto() {
  Draggable a, b, c1, c2;
  Draggable aa, bb, cc1, cc2;
  //((Draggable)d.get(0)).setAuto(0, 0);
  //((Draggable)d.get(1)).setAuto(0, 0);
  ((Draggable)d.get(2)).setAuto(width/2, height/2, radians(5));
  ((Draggable)d.get(3)).setAuto(width/2, height/2, radians(5));

  //((Draggable)d.get(4)).setAuto(0, 0);
  //((Draggable)d.get(5)).setAuto(0, 0);
  ((Draggable)d.get(6)).setAuto(width/2, height/2, radians(5));
  ((Draggable)d.get(7)).setAuto(width/2, height/2, radians(5));
}

