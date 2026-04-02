//Hannah Hijjawi | 3 Mar 2026 | ShapeGame
int x,y,tx,ty,score;
float tw;
PImage player, target;

void setup() {
  size(500,500);
  x = width/2;
  y = height/2;
  tx = int(random(20, width-20));
  ty = int(random(20, height-20));
  score = 0;
  tw = 100.0;
  player = loadImage("player.png");
  target = loadImage("target.png");
}

void draw() {
  background(127);
  //ellipse(x,y,20,20);
  imageMode(CENTER);
  image(player,x,y);
  scorePanel();
  target();
}

void scorePanel () {
  fill(120,127,127,127);
  rect(width/2,15,width,30);
  fill(255);
  textSize(32);
  text("Score:" + score,20,25);
}

void target() {
  float d = dist(x,y,tx,ty);
  println(d);
  println(score);
  rectMode(CENTER);
  image(target,tx,ty,tw,tw);
  //rect(tx,ty,50,50);
  if (d<tw) {
    score = score + int(tw);
    tx = int(random(20, width-20));
    ty = int(random(20, height-20));
    tw = 100.0;
 }
 tw = tw - 0.1;
 if (tw <= 10) {
   gameOver();
 }
}

void gameOver () {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Game Over!",width/2,height/2);
  noLoop();
}

void keyPressed() {
  if(y<0) {
    y = height;
  }
  else if(y>height) {
    y = 0;
  }
  else if(x<0) {
    x = width;
  }
  else if(x>width) {
    x = 0;
  }
  
  
  if(key == 'w' || key == 'W') {
    y = y - 10;
  }
  else if(key == 's' || key == 'S') {
    y = y + 10;
  }
  else if(key == 'a' || key == 'A') {
    x = x - 10;
  }
  else if(key == 'd' || key == 'D') {
    x = x + 10;
  }
}
