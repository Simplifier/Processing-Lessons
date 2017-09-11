int score = 0;

boolean isShooting;
int ballX;
int ballY;

int netX = 330;
int netY;
int netW = 51;
int netH = 87;

boolean hit = false;

void setup() {
  size(400, 400, P3D);
  init();
  respawnNet();
}

void draw() {
  updateNet();

  if (isShooting) {
    updateBall();
  }

  updatePaddle();
}

void applyHit() {
  isShooting = false;
  hit = true;
  score += 10;
  ballX = 0;
  respawnNet();
}