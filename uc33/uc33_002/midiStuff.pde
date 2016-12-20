void noteOn(Note note) {
    int vel = note.getVelocity();
    int pit = note.getPitch();
    //println("noteOnf "+pit+"vel "+vel);
  }
  void noteOff(Note note) {
    int pit = note.getPitch();//vel ==0
    //println("noteoff"+pit);//+"\t"+val);
    uc33.controllerIn(pit, 0);
  }
  void controllerIn(Controller controller) {
    int num = controller.getNumber();
    int val = controller.getValue();
    //println(num+"\t"+val);
    uc33.controllerIn(num, val);
  }
  void programChange(ProgramChange programChange) {
    int num = programChange.getNumber();
  }
