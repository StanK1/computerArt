float totalSquares = 200;
float angle = 0;
float maxSize = 200;
float growthRate = 0.1;
float rotationSpeed = 0.01;
float alphaValue = 10;

void setup() {
  size(800, 800);
  noFill();
  stroke(0, 50);
 // background(0, 10);
}

void draw() {
   background(0, 10);
  translate(width / 2, height / 2);
  
  for (int i = 0; i < totalSquares; i++) {
    pushMatrix();
    
    rotate(angle + TWO_PI / totalSquares * i);
    

    float size = map(i, 0, totalSquares, 10, maxSize);
    alphaValue = map(i, 0, totalSquares, 10, 50);
    
    stroke(map(i, 0, totalSquares, 100, 255), map(i, 0, totalSquares, 100, 200), 255, alphaValue);
    strokeWeight(2);
    rect(-size / 2, -size / 2, size, size);
    
    popMatrix();
  }

  angle += rotationSpeed;
  maxSize += growthRate;

}
