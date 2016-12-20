void keyPressed(){
  if(key==32){
    render=!render;
  }
  if(key=='a')doImg();//;arrayCopy(img.pixels,pimg.pixels);
}
void mousePressed() {
  for (int i=0; i<d.size(); i++) {
    Draggable tmp = (Draggable)d.get(i);
    if (tmp.mousePressed()) {
      for (int j=i+1; j<d.size();j++) {
        Draggable tmp2 = (Draggable)d.get(j);
        tmp2.mouseReleased();
      }
      //break;
    }
  }
}
void mouseReleased() {
  for (int i=0; i<d.size(); i++) {
    Draggable tmp = (Draggable)d.get(i);
    tmp.mouseReleased();
  }
}
