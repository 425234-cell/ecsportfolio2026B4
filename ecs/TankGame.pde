// Hannah Hijjawi | Apr 14 2026 | TankGame
PImage bg;
Tank t1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer obsTimer, puTimer;

void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  t1 = new Tank();
  //obstacles.add(new Obstacle(250, 250));
  //obstacles.add(new Obstacle(25, 400));
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
  puTimer = new Timer(1000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  //Add Timer to distribute obstacles
  if (obsTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height))));
    obsTimer.start();
  }
  if (puTimer.isFinished()) {
    // Add power up
    powerups.add(new PowerUp());
    // restart timer
    puTimer.start();
  }
  //Display and remove power ups
  for (int i = 0; i < powerups.size(); i ++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(t1)) {
      if (pu.type == 'h') {
        t1.health = t1.health +100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        t1.laserCount = t1.laserCount + 150;
        powerups.remove(pu);
      } else if (pu.type == 't') {
        t1.turretCount = t1.turretCount + 1;
        powerups.remove(pu);
      }
    }
  }

  //obstacles.add(new Obstacle(250, 250));

  // Displays and removes obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedSide()) {
      obstacles.remove(o);
    }
    //detect collision to tank
    if (t1.intersect(o)) {
      //impact to change score, health, and obstacle
      t1.health = t1.health - 15;
      obstacles.remove(o);
    }
    //impact to change score, health, and obstacle
  }
  //Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        projectiles.remove(i);
        obstacles.remove(i);
        continue;
      }
    }
    p.display();
    p.move();
    if (p.reachedSide()) {
      projectiles.remove(i);
    }
  }
  t1.display();
  scorePanel();
  println("Obstacles in Memory:" +obstacles.size());
  println("Projectiles in Memory:" +projectiles.size());
}

void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 35, width, 40);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 50);
  text("Health:" + t1.health, width/2-150, 38);
  text("Ammo:" + t1.laserCount, width/2+150, 38);
}

void keyPressed () {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'd') {
    t1.move('d');
  } else if (key == 'a') {
    t1.move('a');
  }
}

void mousePressed() {
  if (t1.turretCount == 1) {
    projectiles.add(new Projectile (int(t1.x), int(t1.y)));
  } else if (t1.turretCount==2) {
    projectiles.add(new Projectile (int(t1.x), int(t1.y)));
    projectiles.add(new Projectile (int(t1.x), int(t1.y)));
  }
  //projectiles.add(new Projectile (int(tank1.x), int(tank1.y)));
}
