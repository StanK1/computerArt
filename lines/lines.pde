void setup() {
size(800,800);
background(0);
}
float x1,x2,y1,y2;
int duraction = 15000;
int lastTime = 0;


void draw(){

  
strokeWeight(1);
stroke(random(255));
//stroke(0,random(255),0);
stroke(random(255),random(255),random(255),127);
fill(0,random(255),0,0);

if(millis() >= duraction) {
noLoop();
return;
}
  x1 = random(width);
  y1 = random(height);
  x2 = x1 + random(-50,50);
  y2 = y1 + random(-50,50);
//line(x1,y1,x2, y2);
rect(x1,0,x2,y2);
}
