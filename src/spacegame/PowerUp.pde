class PowerUp {
  int x, y, speed;
  int drift;
  PImage puImage;
  char type;


  //constructor
  PowerUp() {
    x = width + 100;
    y = int(random(50, height));
    speed = 8;
    drift = int((random(-100.0, 100.0))/50.0);
    int rand = int(random(3));
    if (rand == 0) {
      type = 'E';
      puImage = loadImage("energy.png");
    } else if (rand == 1) {
      type = 'A';
      puImage = loadImage("ammo.png");
    } else {
      type = 'T';
      puImage = loadImage("turret.png");
    }
  }

  void display() {
    imageMode(CENTER);
    puImage.resize(88, 24);
    image(puImage, x, y);
  }

  void move() {
    x -= speed;
    y += drift;
  }

  boolean offScreen() {
    if (x < -20 || y <= 1 || y > width) {
      return true;
    }
    return false;
  }

  boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d < 30) {
      return true;
    }
    return false;
  }
}
