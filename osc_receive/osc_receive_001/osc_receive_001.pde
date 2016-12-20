import oscP5.*;
import netP5.*;

VOsc vosc;

void setup(){
  vosc = new VOsc();
}
void draw(){
  
}
class VOsc{
  OscP5 oscP5;
  NetAddress myRemoteLocation;

  VOsc() {
    oscSetup();
  }
  void draw() {
    
  }
  void oscSetup() {
    oscP5 = new OscP5(this, 7400);
    //myRemoteLocation = new NetAddress("169.254.51.80",8000);
    oscP5.plug(this, "hello", "/hello");
  }
  void hello(String v) {  
    println(v);
  }
  void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.isPlugged()==false) {
      println("### received an osc message.");
      println("### addrpattern\t"+theOscMessage.addrPattern());
      println("### typetag\t"+theOscMessage.typetag());
    }
  }
}
