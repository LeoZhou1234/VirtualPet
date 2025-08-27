import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

void setup() {
  size(500, 500);
  background(170,225,245);
  arduino = new Arduino(this, Arduino.list()[0], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
}

float calcOffset(int r, int yOffset) {
   return (sqrt(sq(r) - sq(yOffset)));
}

void draw() {
  int lightLevel = arduino.analogRead(5);
  System.out.println(lightLevel);
  noStroke();
  
  //body
  fill(205,205,210);
  ellipse(250,250,300,300);
  
  //eyes
  fill(255,255,255);
  ellipse(175,200,150,150);
  ellipse(325,200,150,150);
  
  int pupilDiameter = 115-lightLevel;
  if (pupilDiameter < 20) {
    pupilDiameter = 20;
  } else if (pupilDiameter > 115) {
    pupilDiameter = 115;
  }
  
  fill(0,0,0);
  ellipse(175,200,pupilDiameter,pupilDiameter);
  ellipse(325,200,pupilDiameter,pupilDiameter);
  
  //beak
  fill(255,205,0);
  triangle(250,250,240,270,260,270);

  int yOffset = 75;
  
  fill(255,255,255);
  beginShape();
  vertex(250 - calcOffset(150, yOffset), 250+yOffset);
  bezierVertex(250 - 75, 275 , 250 + 75, 275, 250 + calcOffset(150,yOffset), 250+yOffset);
  endShape();
  beginShape();
  vertex(250 - calcOffset(150, yOffset), 250+yOffset);
  bezierVertex(250 - 75, 425 , 250 + 75, 425, 250 + calcOffset(150,yOffset), 250+yOffset);
  endShape();
}
