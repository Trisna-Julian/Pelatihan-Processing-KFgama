import processing.serial.*;
import grafica.*;


Serial myPort;                       // The serial port
int[] serialInArray = new int[3];    // Where we'll put what we receive
int serialCount = 0;                 // A count of how many bytes we receive
int xpos, ypos;                 // Starting position of the ball
boolean firstContact = false;

int nPoints=1000;
GPointsArray points = new GPointsArray(nPoints);

Table table;



void setup(){
  size(500,350);
  background(100);

  printArray(Serial.list());

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  table = new Table();
  table.addColumn("x axis");
  table.addColumn("y axis");
}

void drawGraph(){
  GPlot plot=new GPlot(this);
  plot.setPos(25,25);
  
  plot.setTitleText("Sawtooth Graph");
  plot.getXAxis().setAxisLabelText("x axis");
  plot.getYAxis().setAxisLabelText("y axis");
  
  plot.setPoints(points);
  
  plot.defaultDraw();
}

void draw(){
  drawGraph();
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  
  
  if (firstContact == false) {
    int inByte = myPort.read();
    if (inByte == 'A') { 
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    } 
  } 
  else {
    
    points.add(xpos,ypos);
    myPort.write('A');
    serialCount = 0;
    }
  }
}