class Laser {
  int x, y, w, h, speed, damage, drift;
  PImage laser;

  Laser(int x, int y, int drift) {
    this.x = x;
    this.y = y;
    this.drift = drift;
    w = 22;
    h = 6;
    speed = 10;
    laser = loadImage("laser.png");
    damage = 4;
  }

  void display() {
    imageMode(CENTER);
    laser.resize(w, h);
    image(laser, x, y);
  }

  void move() {
    x += speed;
    y += drift;
  }

  boolean reachedRight() {
    if(x > width + 40){
      return true;
    }
    else{
      return false;
    }
  }
  
  boolean hittingRock(Rock r){
    if(dist(x, y, r.x, r.y) < ((r.diam)/3)){
      return true;
    }
    return false;
  }
}
