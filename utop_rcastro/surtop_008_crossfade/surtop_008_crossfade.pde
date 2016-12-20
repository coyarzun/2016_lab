import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer[] player;
Smoothy[]     gain;
float[]       distances;

Serial myPort;
int val;

int intervals;

void setup() {
  size(200, 200);
  println(Serial.list());
  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);
  minim = new Minim(this);
  
  intervals = 9;
  player = new AudioPlayer[intervals];
  for(int i=0; i<player.length; i++){
    player[i] = minim.loadFile("surtopia "+(i+1)+".mp3");//
    player[i].loop();
  }
  gain = new Smoothy[intervals];
  for(int i=0; i<gain.length; i++){
    gain[i] = new Smoothy(0);
  }
  distances = new float[intervals+1];
  float dIni = 0;
  float dFin = 400;
  float dDis = (dFin-dIni)/(intervals+1);
  for(int i=0; i<distances.length; i++){
    distances[i] = dIni+i*dDis;
  }
}
void draw() {//min 4, max 313 cm
  String serialString = myPort.readStringUntil(13);
  if (serialString != null) {
    String[] m = splitTokens(trim(serialString), " ");
    if(m.length>0) { 
      val = int(m[0]);
      println(val);
      for(int i=0; i<gain.length; i++){
        float g = map(val,distances[i],distances[i+1],0,-60);//-60 min
        g = constrain(g,0,-60);
        gain[i].setTo( g );
      }
    }
  }
  for(int i=0; i<gain.length; i++){
    player[i].setGain(gain[i].getVal());
  }
}

