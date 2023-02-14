class Torpedo {
  int x, y, w, h, speed, drift, explosionCount;
  PImage laser;

  boolean exploding = false, shouldDestroy = false;

  Timer explosionTimer;

  Torpedo(int x, int y, int drift) {
    this.x = x; 
    this.y = y;
    this.drift = drift;
    w = 22;
    h = 6;
    speed = 5;
    laser = loadImage("torpedo.png");
    explosionTimer = new Timer(50);
  }

  void display() {
    imageMode(CENTER);
    if (exploding) {
      if (explosionCount < 6) {
        PImage explosion = loadImage("explosion_" + explosionCount + ".png");
        explosion.resize(300, 300);
        image(explosion, x, y);
        if (explosionTimer.isFinished()) {
          explosionCount += 1;
          explosionTimer.start();
        }
      } else {
        shouldDestroy = true;
      }
    } else {
      laser.resize(w, h);
      image(laser, x, y);
    }
  }

  void move() {
    x += speed;
    y += drift;
  }

  boolean reachedRight() {
    if (x > width + 40) {
      return true;
    } else {
      return false;
    }
  }

  boolean hittingRock(Rock r) {
    if (dist(x, y, r.x, r.y) < ((r.diam)/3) && !r.exploding) {
      exploding = true;
      return true;
    }
    return false;
  }

  void blowUp(Rock r) {
    if (dist(x, y, r.x, r.y) < 300) {
      r.explode(false);
    }
  }
}
