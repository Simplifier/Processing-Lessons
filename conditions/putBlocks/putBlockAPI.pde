int[][] roomMatrix = {
  {1, 2, 1, 1, 0, 1, 1, 1}, 
  {0, 0, 1, 0, 0, 0, 0, 2}, 
  {1, 0, 0, 0, 0, 1, 1, 0}, 
  {1, 0, 0, 0, 1, 0, 1, 1}, 
  {0, 1, 0, 0, 0, 0, 1, 1}, 
  {2, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 0, 0, 1, 1, 0, 1, 0}, 
  {1, 0, 1, 1, 1, 0, 0, 2}
};

int successCount;
int checkCount;
int startTime;
int time = 4000;

PImage babyWinston;
PImage enemybug;
PImage n1;
PImage n2;
PImage n3;
PImage n4;

void init() {
  frameRate(10);
  textFont(createFont("Arial Bold", 110));

  babyWinston = loadImage("pix/BabyWinston.png");
  enemybug = loadImage("pix/EnemyBug.png");
  n1 = loadImage("pix/1.png");
  n2 = loadImage("pix/2.png");
  n3 = loadImage("pix/3.png");
  n4 = loadImage("pix/4.png");
  drawLevel();
}

void drawLevel() {
  successCount = 0;
  checkCount = 0;

  noStroke();
  for (int row=0; row<roomMatrix.length; row++) {
    for (int col=0; col<roomMatrix[row].length; col++) {
      int id = roomMatrix[row][col];
      switch(id) {
      case 0:
        fill(100, 150, 175);
        rect(col*50, row*50, 50, 50);
        break;
      case 1:
        fill(100, 100, 100);
        rect(col*50, row*50, 50, 50);
        break;
      case 2:
        fill(100, 150, 175);
        rect(col*50, row*50, 50, 50);
        pushMatrix();
        scale(0.5);
        image(enemybug, col*2*50, -55+row*2*50);
        popMatrix();
        break;
      }
    }
  }

  drawTips();

  pushMatrix();
  scale(0.75);
  image(babyWinston, 150, 250);
  popMatrix();
}

void drawTips() {
  pushMatrix();
  translate(50, 50);
  drawRect(n1, 50);
  popMatrix();

  pushMatrix();
  translate(175, 125);
  rotate(radians(45));
  translate(-25, -10);
  drawRect(n2, 50);
  popMatrix();

  pushMatrix();
  translate(50, 300);
  rotate(radians(-90));
  drawRect(n3, 50);
  popMatrix();

  pushMatrix();
  translate(250, 300);
  rotate(radians(-45));
  drawRect(n4, 50);
  popMatrix();
  noTint();
}

void drawRect1() {
  drawRect(n1);
  checkWin(modelX(0, 0, 0) == 50 && modelY(0, 0, 0) == 50);
}

void drawRect2() {
  drawRect(n2);
  checkWin(modelX(25, 10, 0) == 175 && modelY(25, 10, 0) == 125 && getRotation() == 45);
}

void drawRect3() {
  drawRect(n3);
  checkWin(modelX(0, 0, 0) == 50 && modelY(0, 0, 0) == 300 && getRotation() == -90);
}

void drawRect4() {
  drawRect(n4);
  checkWin(modelX(0, 0, 0) == 250 && modelY(0, 0, 0) == 300 && getRotation() == -45);
}

void checkWin(boolean condition) {
  checkCount++;
  if (condition) {
    successCount++;
  }
  if (successCount == 4) {
    if (startTime == 0) {
      startTime = millis();
    } else if (millis() - startTime >= time) {
      win();
    }
  }
  if (successCount != checkCount) {
    startTime = 0;
  }
}

void win() {
  popMatrix();
  fill(0, 100);
  rect(0, 0, width, height);
  filter(BLUR, 8);
  fill(255, 150);
  textAlign(CENTER, CENTER);
  textSize(110);
  text("Win!", width / 2, height / 2);
  pushMatrix();
}

void showScore() {
  textAlign(RIGHT, TOP);
  textSize(40);
  text(successCount, width - 10, 0);
}

void drawRect(PImage number, int alpha) {
  fill(255, alpha);
  tint(0, alpha);
  drawRect(number);
  noTint();
  fill(255);
}

void drawRect(PImage number) {
  pushMatrix();
  rect(0, 0, 50, 20);
  translate(15, 0);
  scale(0.2);
  image(number, 0, 0);
  popMatrix();
}

float getRotation() {
  PMatrix3D cmat = (PMatrix3D)getMatrix();
  return degrees(atan2(cmat.m10, cmat.m00));
}