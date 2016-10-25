import processing.serial.*;
String myData="";
Serial myPort;

void setup(){
  printArray(Serial.list());
  myPort=new Serial(this,Serial.list()[0],9600);
  myPort.clear();
  delay(2000);
}

void draw(){
  
  myPort.write("take");
  myPort.write('\n');
  delay(100);
  myData=myPort.readStringUntil('\n');
  print(myData);
  
}