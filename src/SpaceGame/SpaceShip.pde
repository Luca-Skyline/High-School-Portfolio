class SpaceShip {
  int x, y, w, energy, ammo, turretCount, health;
  PImage ship;

  boolean hit;

  //Constructor
  SpaceShip() {
    x = 100;
    y = height/2;
    w = 100;
    energy = 50;
    ammo = 5;
    turretCount = 1;
    ship = loadImage("ship.png");
    health = 100;
  }

  void display() {
    imageMode(CENTER);
    ship.resize(100, 25);
    image(ship, x, y);
  }

  void move(int speed) {
    y += speed;
    if (y > height - 12) {
      y = height - 12;
    } else if (y < 100) {
      y = 100;
    }
  }

  boolean canFire() {
    if (energy > 0) {
      energy--;
      return true;
    }
    return false;
  }

  boolean canFireTorpedo() {
    if (ammo > 0) {
      ammo --;
      return true;
    }
    return false;
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d < r.diam/2-10 && !r.exploding) {
      //health -= 1;
      hit = true;
      return true;
    }
    return false;
  }
}
