final int COUNT = 150;

float[] pt;
int[] style;

void setup() {
  size(1024, 768, P3D);
  background(0);
  colorMode(HSB, 360, 100, 100);
  pt = new float[6 * COUNT]; 
  style = new int[2 * COUNT];

  int index = 0;
  for (int i = 0; i < COUNT; i++) {
    pt[index++] = random(TWO_PI);
    pt[index++] = random(TWO_PI);
    pt[index++] = random(60, 80);
    pt[index++] = int(random(2, 50) * 5);
    pt[index++] = random(4, 32);
    pt[index++] = radians(random(5, 30)) / 5;

    style[i * 2] = color(random(360), 100, 100);
    style[i * 2 + 1] = floor(random(100)) % 3;
  }
}

void draw() {
  drawBackground();
  translate(width / 2, height / 2, 0);
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));

  int index = 0;
  for (int i = 0; i < COUNT; i++) {
    pushMatrix();
    rotateX(pt[index++]);
    rotateY(pt[index++]);
    stroke(style[i * 2]);
    strokeWeight(2);
    noFill();
    arcLine(0, 0, pt[index++], pt[index++], pt[index++]);
    pt[index - 5] += pt[index] / 10;
    pt[index - 4] += pt[index++] / 20;
    popMatrix();
  }
}

void drawBackground() {
  background((frameCount / 2) % 360, 100, 20);
  fill(0, 0, 0, 180); // 70% shadow overlay
  rect(0, 0, width, height);
}

void arcLine(float x, float y, float degrees, float radius, float w) {
  int lineCount = floor(w / 2);
  for (int j = 0; j < lineCount; j++) {
    beginShape();
    for (int i = 0; i < degrees; i++) {
      float angle = radians(i);
      vertex(x + cos(angle) * radius, y + sin(angle) * radius);
    }
    endShape();
    radius += 2;
  }
}
