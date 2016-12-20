import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer[] player;
Smoothy[]     gain;
float[]       pan, angulo, angularSpeeds, toAngularSpeeds;
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
  pan             = new float[intervals];
  angulo          = new float[intervals];
  angularSpeeds   = new float[intervals];
  toAngularSpeeds = new float[intervals];
  
  for(int i=0; i<pan.length; i++){
    pan[i] = 0;
    angulo[i]           = 0;
    angularSpeeds[i]    = 0;
    toAngularSpeeds[i]  = radians(10);
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
        
        
        float g = -60;//constrain(g,0,-60);
        if(i==0){
          g=0;
        }else{
          if(val<distances[i+1]) {
            g=0;
          }else{
            g=-60;
          }
        }
        
        
        gain[i].setTo( g );
        
        
        toAngularSpeeds[i]  =  map(val,0,314,radians(20), radians(5));
        angularSpeeds[i]+=  (toAngularSpeeds[i]-angularSpeeds[i])*.3;
        angulo[i]       += angularSpeeds[i];
        pan[i] =sin(angulo[i]);
        
      }
    }
  }
  for(int i=0; i<gain.length; i++){

    player[i].setGain(gain[i].getVal());
    player[i].setPan(pan[i]);
    
  }
}











