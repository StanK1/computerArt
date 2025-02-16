void setup() {
  size(800, 800, P3D);
  noStroke();
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(frameCount % 360, 80, 0);
 // drawShadow();
  defineLights();
  
  for (int x = -width / 2; x <= width / 2; x += 80) {
    for (int y = -height / 2; y <= height / 2; y += 80) {
      pushMatrix();
      translate(x + width / 2, y + height / 2, sin(frameCount * 0.02 + x * 0.01 + y * 0.01) * 100);
      rotateY(map(mouseX, 0, width, 0, PI));
      rotateX(map(mouseY, 0, height, 0, PI));
      fill(map(x, -width / 2, width / 2, 0, 255), map(y, -height / 2, height / 2, 0, 255), 255);
      box(60);
      popMatrix();
    }
  }
}

void drawShadow() {
  fill(0, 0, 0, 180); // 70% shadowing
  rect(0, 0, width, height);
}

void defineLights() {
  // Colorful moving lights
  pointLight(255, 0, 0, width / 2, sin(frameCount * 0.05) * 300, 200);
  pointLight(0, 255, 0, -width / 2, cos(frameCount * 0.05) * 300, -200);
  pointLight(0, 0, 255, cos(frameCount * 0.05) * 300, -height / 2, 200);
}
