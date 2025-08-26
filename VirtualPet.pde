void setup() {
  size(500, 500);
  background(170,225,245);
}

void draw() {
  noStroke();
  
  //body
  fill(205,205,210);
  ellipse(250,250,300,300);
  
  //eyes
  fill(255,255,255);
  ellipse(175,200,150,150);
  ellipse(325,200,150,150);
  fill(0,0,0);
  ellipse(175,200,125,125);
  ellipse(325,200,125,125);
  
  //beak
  fill(255,205,0);
  triangle(250,250,240,270,260,270);
}
