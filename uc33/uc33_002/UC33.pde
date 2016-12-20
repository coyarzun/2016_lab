class UC33 {
  float friction;
  MidiIO midiIO;
  Knob[]   knobs;
  Fader[]  faders;
  Button[] player;
  Button[] numPad;

  UC33() {
    friction = 0.3;
    midiSetup();
    knobs = new Knob[24];
    for (int i=0; i<knobs.length; i++)knobs[i]=new Knob();
    faders = new Fader[9];
    for (int i=0; i<faders.length; i++)faders[i]=new Fader();
    numPad = new Button[10];
    for (int i=0; i<numPad.length; i++)numPad[i]=new Button();
    player = new Button[4];
    for (int i=0; i<player.length; i++)player[i]=new Button();
  }
  void update() {
    for (int i=0; i<knobs.length; i++)knobs[i].update();
    for (int i=0; i<faders.length; i++)faders[i].update();
    for (int i=0; i<numPad.length; i++)numPad[i].update();
    for (int i=0; i<player.length; i++)player[i].update();
  }
  void draw() {
    float cellsize = 20;
    pushMatrix();
    translate(width/2, height/2);
    rotateX(-radians(30));
    rotateY(radians(frameCount));
    fill(255);
    
    pushMatrix();
    translate(-4*cellsize, 0, -4*cellsize);
    for (int i=0; i<8; i++) {
      for (int j=0; j<3; j++) {
        int k=j*8+i;
        pushMatrix();
        translate(i*cellsize, 32*knobs[k].balancedVal, j*cellsize);
        box(20, 64*knobs[k].balancedVal, 20);
        popMatrix();
      }
    }
    popMatrix();

    pushMatrix();
    translate(-4*cellsize, 0, 4*cellsize);
    for (int i=0; i<9; i++) {

      pushMatrix();
      translate(i*cellsize, 0);
      box(20, 20, 128*faders[(i+1)%faders.length].normVal);
      popMatrix();
    }
    popMatrix();
    
    pushMatrix();
    translate(6*cellsize, 0, -4*cellsize);
    for (int i=0; i<10; i++) {
      pushMatrix();
      translate(i%3*cellsize, 0, i/3*cellsize);
      fill( numPad[(i+1)%numPad.length].boolVal? 255: 0);
      box(20, 128*numPad[(i+1)%numPad.length].normVal, 20);
      popMatrix();
    }
    popMatrix();
    
    pushMatrix();
    translate(6*cellsize, 0, 4*cellsize);
    for (int i=0; i<4; i++) {
      pushMatrix();
      translate(i*cellsize, 0);
      fill( player[i%player.length].boolVal? 255: 0);
      box(20, 128*player[i%player.length].normVal, 20);
      popMatrix();
    }
    popMatrix();

    popMatrix();
  }
  void midiSetup() {
    midiIO = MidiIO.getInstance(p);
    midiIO.printDevices();

    //midiIO.plug(p, "noteOn", 0, 0);
    midiIO.plug(p, "noteOff", 0, 0);
    midiIO.plug(p, "controllerIn", 0, 0);
    //midiIO.plug(p, "programChange", 0, 0);
  }
  void controllerIn(int n, int v) {
    //uc33--> P03
    //
    //numeric:22,23,24,
    //        41,42,44
    //        52,53,54
    //           57
    //
    //player:  25,27,28,29
    //faders:105,106,107,108,110,111,112,116,26
    //
    //       20,21,40,43,70,71,72,73
    //       50,51,55,87,75,76,77,78
    //knobs: 45,46,47,5,80,81,82,83
    //
    println(n+" "+v);
    switch(n) {
    case 26:  
      faders[0].setTo(v); 
      break;
    case 105: 
      faders[1].setTo(v); 
      break;
    case 106: 
      faders[2].setTo(v); 
      break;
    case 107: 
      faders[3].setTo(v); 
      break;
    case 108: 
      faders[4].setTo(v); 
      break;
    case 110: 
      faders[5].setTo(v); 
      break;
    case 111: 
      faders[6].setTo(v); 
      break;
    case 112: 
      faders[7].setTo(v); 
      break;
    case 116: 
      faders[8].setTo(v); 
      break;

    case 20:  
      knobs[0].setTo(v); 
      break;
    case 21:  
      knobs[1].setTo(v); 
      break;
    case 40:  
      knobs[2].setTo(v); 
      break;
    case 43:  
      knobs[3].setTo(v); 
      break;
    case 70:  
      knobs[4].setTo(v); 
      break;
    case 71:  
      knobs[5].setTo(v); 
      break;
    case 72:  
      knobs[6].setTo(v); 
      break;
    case 73:  
      knobs[7].setTo(v); 
      break;

    case 50:  
      knobs[8].setTo(v); 
      break;
    case 51:  
      knobs[9].setTo(v); 
      break;
    case 55:  
      knobs[10].setTo(v); 
      break;
    case 87:  
      knobs[11].setTo(v); 
      break;
    case 75:  
      knobs[12].setTo(v); 
      break;
    case 76:  
      knobs[13].setTo(v); 
      break;
    case 77:  
      knobs[14].setTo(v); 
      break;
    case 78:  
      knobs[15].setTo(v); 
      break;

    case 45:  
      knobs[16].setTo(v); 
      break;
    case 46:  
      knobs[17].setTo(v); 
      break;
    case 47:  
      knobs[18].setTo(v); 
      break;
    case 5:   
      knobs[19].setTo(v); 
      break;
    case 80:  
      knobs[20].setTo(v); 
      break;
    case 81:  
      knobs[21].setTo(v); 
      break;
    case 82:  
      knobs[22].setTo(v); 
      break;
    case 83:  
      knobs[23].setTo(v); 
      break;

    case 22:      numPad[1].setTo(v);      break;
    case 23:      numPad[2].setTo(v);      break;
    case 24:      numPad[3].setTo(v);      break;
    case 41:      numPad[4].setTo(v);      break;
    case 42:      numPad[5].setTo(v);      break;
    case 44:      numPad[6].setTo(v);      break;
    case 52:      numPad[7].setTo(v);      break;
    case 53:      numPad[8].setTo(v);      break;
    case 54:      numPad[9].setTo(v);      break;
    case 57:      numPad[0].setTo(v);      break;
    
    case 25:      player[0].setTo(v);      break;
    case 27:      player[1].setTo(v);      break;
    case 28:      player[2].setTo(v);      break;
    case 29:      player[3].setTo(v);      break;
    
    }
  }


  class Knob {
    float val, toVal, dVal;
    float normVal, balancedVal;

    Knob() {    }
    void setTo(int in) {
      toVal = float(in);
    }
    void update() {
      dVal  = (toVal-val)*friction;
      val+=dVal;
      normVal     = map(val, 0, 127, 0, 1);
      balancedVal = map(val, 0, 127, -1, 1);
    }
  }
  class Fader {
    float val, toVal, dVal;
    float normVal;

    Fader() {    }
    void setTo(int in) {
      toVal = float(in);
    }
    void update() {
      dVal  = (toVal-val)*friction;
      val+=dVal;
      normVal = map(val, 0, 127, 0, 1);
    }
  }
  class Button {
    float val, toVal, dVal;
    float normVal;
    boolean boolVal;

    Button() {    }
    
    void setTo(int in) {
      toVal = float(in);
    }
    void update() {
      dVal  = (toVal-val)*friction;
      val+=dVal;
      normVal = map(val, 0, 127, 0, 1);
      boolVal = (int(val))==0;
    }
  }
}








