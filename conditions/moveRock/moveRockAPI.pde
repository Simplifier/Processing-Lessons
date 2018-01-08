int[][] roomMatrix = {
  {1, 2, 1, 1, 1, 2, 1, 1}, 
  {0, 0, 1, 1, 1, 0, 0, 0}, 
  {1, 0, 1, 1, 1, 0, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 1, 1}, 
  {1, 1, 0, 0, 0, 0, 1, 1}, 
  {2, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 0, 1, 1, 1, 0, 1, 0}, 
  {1, 0, 1, 1, 1, 0, 0, 2}
};

int successCount;
int checkCount;
int startTime;
int time = 4000;

PImage rock;
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
  rock = loadImage("pix/Rock.png");
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

  noStroke();
  fill(255);
  ellipse(75, 75, 2, 2);
  ellipse(275, 75, 2, 2);
  ellipse(75, 275, 2, 2);
  ellipse(275, 275, 2, 2);

  pushMatrix();
  scale(0.75);
  image(babyWinston, 150, 250);
  popMatrix();
}

void drawRock1() {
  boolean isSuccess = modelX(0, 0, 0) == 50 && modelY(0, 0, 0) == 0;
  if(isSuccess) {
    tint(#FAF36A);
  }
  drawRock(n1, 0, 50);
  noTint();
  checkWin(isSuccess);
}

void drawRock2() {
  boolean isSuccess = modelX(0, 0, 0) == -100 && modelY(0, 0, 0) == 0;
  if(isSuccess) {
    tint(#FAF36A);
  }
  drawRock(n2, 350, 50);
  noTint();
  checkWin(isSuccess);
}

void drawRock3() {
  boolean isSuccess = modelX(0, 0, 0) == 0 && modelY(0, 0, 0) == -100;
  if(isSuccess) {
    tint(#FAF36A);
  }
  drawRock(n3, 50, 350);
  noTint();
  checkWin(isSuccess);
}

void drawRock4() {
  boolean isSuccess = modelX(0, 0, 0) == 50 && modelY(0, 0, 0) == 100;
  if(isSuccess) {
    tint(#FAF36A);
  }
  drawRock(n4, 200, 150);
  noTint();
  checkWin(isSuccess);
}

void drawRock(PImage number, int x, int y){
  pushMatrix();
  translate(x, y);
  drawRock(number);
  popMatrix();
}

void drawRock(PImage number){
  pushMatrix();
  translate(0, -30);
  scale(0.5);
  image(rock, 0, 0);
  popMatrix();
  pushMatrix();
  translate(15, 10);
  scale(0.25);
  image(number, 0, 0);
  popMatrix();
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
  text("Win!", width / 2, height / 2);
  pushMatrix();
}