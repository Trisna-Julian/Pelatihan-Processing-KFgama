import processing.serial.*;
String inString;
int red;
int green;
int blue;


void setup() {
  size(250, 250); 
  Serial Arduino;
  printArray(Serial.list());
  Arduino= new Serial(this,Serial.list()[0],9600);
  Arduino.bufferUntil('\n');
}

void draw() {
  color inside=color(red,green,blue);
  background(inside);
}

void serialEvent(Serial Arduino) { 
  inString = Arduino.readStringUntil('\n');
  //print(inString);
  String[] warna=splitTokens(inString,";");
  red=int(warna[0]);
  green=int(warna[1]);
  blue=int(warna[2]);
  
  print(inString);
} 