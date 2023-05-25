class Rock {
  int x, y, diam, speed, health, explosionCount;
  int drift;
  PImage rock, rock1;
  boolean isRotated = false, exploding = false, shouldDestroy = false;

  Timer rockAnimationTimer;
  Timer explosionTimer;

  //constructor
  Rock() {
    x = width + 100;
    y = int(random(50, height));
    diam = int(random(50, 200));
    health = diam/10;
    speed = int(random(1+level, 9+level));
    drift = int((random(-100.0, 100.0))/50.0);
    rock = loadImage("rock.png");
    rock1 = loadImage("rock2.png");
    rock.resize(diam, diam);
    rock1.resize(diam, diam);
    rockAnimationTimer = new Timer(int(random(100, 300)));
    rockAnimationTimer.start();
    explosionTimer = new Timer(50);
  }

  void display() {
    imageMode(CENTER);
    if (exploding) {
      if (explosionCount < 6) {
        PImage explosion = loadImage("explosion_" + explosionCount + ".png");
        explosion.resize(diam/2, diam/2);
        image(explosion, x, y);
        if (explosionTimer.isFinished()) {
          explosionCount += 1;
          explosionTimer.start();
        }
      } else {
        shouldDestroy = true;
        println("destroy rock");
      }
    } else {
      if (isRotated) {
        image(rock, x, y);
      } else {
        image(rock1, x, y);
      }

      if (rockAnimationTimer.isFinished()) {
        if (isRotated) {
          isRotated = false;
        } else {
          isRotated = true;
        }

        rockAnimationTimer.start();
      }
    }
  }

  void move() {
    x -= speed;
    y += drift;
  }

  void explode(boolean touchingShip) {
    if (!exploding) {
      if (touchingShip) {
        s1.health -= int((diam)/20.0);
      }
      explosionSound.play(1.7-(diam/150), diam * 0.0025);
      exploding = true;
      explosionCount = 0;
      explosionTimer.start();
    }
  }


  boolean offScreen() {
    if (x < -20 || y <= 1 || y > width) {
      return true;
    }
    return false;
  }
}
