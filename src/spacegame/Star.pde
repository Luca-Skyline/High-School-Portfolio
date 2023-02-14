class Star {
  int x, y, diam;
  float speed;
  color col;

  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = abs(int(random(-3, 4))) + 1;
    speed = abs(random(-3, 6)) + 1;
    col = color(random(230, 255), random(230, 255), 255);
  }

  void display() {
    fill(col);
    circle(x, y, diam);
  }

  void move() {
    if (x<=0) {
      x = width + 2;
      y = int(random(height));
      speed += 0.5;
    } else {
      x -= int(speed);
    }
  }
}
