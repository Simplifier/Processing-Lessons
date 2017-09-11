float speed = 5;
float y = 0;
int h = 60;

int ballHolderX;
int ballHolderY;

PImage net;

void respawnNet() {
  ballHolderX = 15;
  netY = (int)random(10, height - netH);
}

void drawNet() {
  pushMatrix();
  translate(netX, netY);
  rotate(PI/ 2);
  translate(-13 / 2, -153 / 2);
  scale(.5);
  image(net, 0, 0);
  popMatrix();
}

void init() {
  strokeWeight(10);

  textAlign(CENTER, TOP);
  textSize(40);
  fill(80);

  net = loadImage("net.png");
}

void updateNet() {
  background(255);
  drawNet();

  if (y > height) {
    y = y % height;
    reduceScore();
  }

  pushMatrix();
  translate(ballHolderX, ballHolderY);
}

void updatePaddle() {
  popMatrix();

  drawPaddle();
  text(score, width / 2, 0);
}

void reduceScore() {
  if (!hit) {
    score -= 5;
  }
  hit = false;
  if (score < 0) {
    score = 0;
  }
}

void drawPaddle() {
  stroke(#5888E5, 200);
  line(5, y + 5 - height, 5, y + h + 5 - height);
  line(5, y + 5, 5, y + h + 5);
  y += speed;
}

void updateBall() {
  if (isShooting) {
    stroke(#F2C553);
    point(ballX, ballY);
    
    if(ballX > width){
      isShooting = false;
    }
    
    ballX += 6;
  }
}

void keyPressed() {
  if (key == ' ') {
    isShooting = true;
    ballX = 0;
    ballHolderX = 15;
    ballHolderY = (int)y + h / 2;
  }
}