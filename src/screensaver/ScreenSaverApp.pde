//Screen Saver App | October 7 2022 | Luca DalCanto

float xpos, ypos;
float strokeW;
float pointCount;

void setup() {
  fullScreen();
  size(displayWidth, displayHeight);
  background(24, 0, 24);
  xpos = random(width);
  ypos = random(height);
}

void draw() {
  noStroke();
  fill(14, 5);
  rect(0, 0, width, height);
  strokeW = random(3, 9);
  pointCount = random(90, 190);
  stroke(random(50, 255), random(10), random(80));
  if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  }

  switch(int(random(4))) {
    case 0:
      strokeWeight(strokeW);
      moveLeft(xpos, ypos, pointCount);
      break;
  
    case 1:
      strokeWeight(strokeW);
      moveUp(xpos, ypos, pointCount);
      break;
  
    case 2:
      strokeWeight(strokeW);
      moveDown(xpos, ypos, pointCount);
      break;
  
    default:
      strokeWeight(strokeW);
      moveRight(xpos, ypos, pointCount);
      break;
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX + i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY - i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY + i;
  }
}
