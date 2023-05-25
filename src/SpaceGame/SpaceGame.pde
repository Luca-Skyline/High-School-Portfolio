// Luca DalCanto | Nov 29 2022 | SPACE GAME
// Included in game: sounds, power ups, animated sprites, levels, start and game over screen
import processing.sound.*;

SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Torpedo> torpedoes = new ArrayList<Torpedo>();
Star[] stars = new Star[500];
boolean topDown;
PFont font;
SoundFile laser;
SoundFile music;
SoundFile gO;
SoundFile explosionSound;

Timer rockTimer;
Timer rockAnimationTimer;
Timer energyTimer;
Timer scoreTimer;
Timer puTimer;
Timer turretTimer;

int score, level, shipSpeed;
boolean play;

void setup() {
  size(displayWidth, displayHeight);
  fullScreen();
  s1 = new SpaceShip();

  laser = new SoundFile(this, "laserBlast.wav");
  music = new SoundFile(this, "music.wav");
  gO = new SoundFile(this, "death.wav");
  explosionSound = new SoundFile(this, "explosion.wav");
  music.amp(1.0);
  music.loop();

  level = 1;

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  rockTimer = new Timer(120);
  rockTimer.start();
  energyTimer = new Timer(350);
  energyTimer.start();
  puTimer = new Timer(int(random(3000, 15000)));
  puTimer.start();
  turretTimer = new Timer(int(random(10000, 15000)));
  score = 0;
  play = false;
  scoreTimer = new Timer(1000);
  scoreTimer.start();
  font = createFont("Krungthep", 20);
}

void draw() {
  if (!play) {
    startScreen();
    return;
  }
  
  println(rocks.size());
  noCursor();
  background(0);
  for (int i = 0; i < stars.length; i++) {
    stars[i].display();
    stars[i].move();
  }

  //Add a rock
  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
  }

  if (energyTimer.isFinished() && lasers.size() == 0) {
    s1.energy += 1;
    energyTimer.start();
  }

  if (scoreTimer.isFinished()) {
    score += 1;
    if (score % 20 == 0) {
      level += 1;
      rockTimer = new Timer(120 - (level * 8));
      rockTimer.start();
    }
    scoreTimer.start();
  }

  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());
    puTimer = new Timer(int(random(3000, 15000)));
    puTimer.start();
  }

  if (turretTimer.isFinished()) {
    s1.turretCount = 1;
  }


  //display powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    if (pu.offScreen()) {
      powerups.remove(pu);
    } else {
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        if (pu.type == 'E') {
          s1.energy += 75;
          s1.health += 15;
          if (s1.health > 100) {
            s1.health = 100;
          }
        } else if (pu.type == 'A') {
          s1.ammo += random(1, 4);
        } else if (pu.type == 'T') {
          s1.turretCount = 2;
          turretTimer.start();
        }

        powerups.remove(pu);
      }
    }
  }


  s1.move(shipSpeed * 5);

  //display lasers
  for (int i = 0; i < lasers.size(); i++) {
    Laser l = lasers.get(i);
    if (l.reachedRight()) {
      lasers.remove(l);
    } else {
      l.move();
      l.display();
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.shouldDestroy) {
          rocks.remove(rock);
        } else if (l.hittingRock(rock)) {
          rock.health -= l.damage;
          lasers.remove(l);
          if (rock.health <= 0) {
            rock.explode(false);
          }
        }
      }
    }
  }

  //display torpedoes
  for (int i = 0; i < torpedoes.size(); i++) {
    Torpedo t = torpedoes.get(i);
    if (t.reachedRight() || t.shouldDestroy) {
      torpedoes.remove(t);
    } else {
      t.move();
      t.display();
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (t.exploding) {
        } else if (t.hittingRock(rock)) {
          for (int k = 0; k < rocks.size(); k++) {
            t.blowUp(rocks.get(k));
          }
        }
      }
    }
  }

  s1.display();

  //display rocks
  for (int i = 0; i < rocks.size(); i++) {
    Rock r = rocks.get(i);
    if (r.offScreen()) {
      rocks.remove(r);
    } else {
      r.display();
      r.move();
      if (s1.intersect(r)) {
        //s1.health -= int((r.diam)/50.0);
        r.explode(true);
      }
    }
  }

  infoPanel();

  if (s1.health <= 0) {
    gameOver();
  }
}

void mousePressed() {
  if (s1.canFire()) {
    laser.play(1.0, 0.02);
    lasers.add(new Laser(s1.x+20, s1.y+8, shipSpeed * 3));
    if (s1.turretCount == 2) {
      lasers.add(new Laser(s1.x+50, s1.y-3, shipSpeed * 3));
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      shipSpeed = -1;
    } else if (keyCode == DOWN) {
      shipSpeed = 1;
    }
  } else if (key == ENTER) {
    if (s1.ammo > 0) {
      torpedoes.add(new Torpedo(s1.x, s1.y+8, shipSpeed * 3));
      s1.ammo--;
    }
  } else {
    if (s1.canFire()) {
      laser.play(1.0, 0.02);
      lasers.add(new Laser(s1.x, s1.y+8, shipSpeed * 3));
      if (s1.turretCount == 2) {
        lasers.add(new Laser(s1.x+50, s1.y-3, shipSpeed * 3));
      }
    }
  }
}

void keyReleased() {
  if (key ==CODED) {
    if (keyCode == UP || keyCode == DOWN) {
      shipSpeed = 0;
    }
  }
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(10, 10, width-20, 50);
  fill(250);
  textFont(font);
  text("SCORE: " + score, 20, 42);
  text("ENERGY: " + s1.energy, 155, 42);
  text("TORPEDOS: " + s1.ammo, 300, 42);
  text("WARP: " + level, width-110, 42);
  if (s1.hit) {
    fill(#FF0004);
    s1.hit = false;
  }
  text("SHIELDS: " + s1.health + "%", 450, 42);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(LEFT);
  textFont(font);
  text("-- SPACE TREK --", 80, 200);
  text("Your goal is to avoid the rocks as you navigate the astroid field. When you run out of shields, the Enterprise will be destroyed.\nYou have a replenishing source of Phasers (ENERGY) which can run out if used too much, as well as a few torpedoes.\n Your goal is to last as long as possible without dying. Your score is the seconds you last. The ship will get faster the more you play.\nDO NOT WORRY ABOUT ROCKS GOING OFF THE SCREEN!!\nUse the arrow keys to move UP and DOWN, SPACE to fire phasers, and ENTER/RETURN to fire a torpedo and take out a bunch of rocks.\n\nThere are three types of powerups in the field. The blue one will give you energy (phasers) and shields.\nThe red one gives you torpedoes. The green one allows you to shoot two lasers with 1 energy.\nMAKE SURE TO TURN ON VOLUME!", 150, 300);
  text("Press any key to begin...", 150, height/2 + 250);
  if (keyPressed || mousePressed) {
    play = true;
  }
}

void gameOver() {
  cursor();
  noLoop();
  music.stop();
  gO.play();
  background(0);
  fill(255);
  textAlign(CENTER);
  textFont(font);
  text("-- GAME OVER --", width/2, height/2);
  text("Score: " + score, width/2, height/2 + 70);
  text("Warp Speed (level): " + level, width/2, height/2 + 140);
  
  text("(Press ESC to exit)", width/2, height/2 + 400);

  s1.ammo = 0;
  s1.energy = 0;
}
