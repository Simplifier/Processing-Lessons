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

void drawLevel() {
  successCount = 0;
  checkCount = 0;

  PImage babyWinston = loadImage("pix/BabyWinston.png");
  PImage enemybug = loadImage("pix/EnemyBug.png");
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
  ellipse(75, 75, 4, 4);
  ellipse(275, 75, 4, 4);
  ellipse(75, 275, 4, 4);
  ellipse(275, 275, 4, 4);

  pushMatrix();
  scale(0.75);
  image(babyWinston, 150, 250);
  popMatrix();
}

void drawRock1() {
  checkWin(modelX(0, 0, 0) == 50 && modelY(0, 0, 0) == 0);
  PImage rock = loadImage("pix/Rock.png");
  PImage numberone = loadImage("pix/1.png");
  pushMatrix();
  scale(0.5);
  image(rock, 0, 40);
  popMatrix();
  pushMatrix();
  scale(0.25);
  image(numberone, 60, 240);
  popMatrix();
  noTint();
}

void drawRock2() {
  checkWin(modelX(0, 0, 0) == -100 && modelY(0, 0, 0) == 0);
  PImage rock = loadImage("pix/Rock.png");
  PImage numbertwo = loadImage("pix/2.png");
  pushMatrix();
  scale(0.5);
  image(rock, 700, 40);
  popMatrix();
  pushMatrix();
  scale(0.25);
  image(numbertwo, 1460, 240);
  popMatrix();
  noTint();
}

void drawRock3() {
  checkWin(modelX(0, 0, 0) == 0 && modelY(0, 0, 0) == -100);
  PImage rock = loadImage("pix/Rock.png");
  PImage numberthree = loadImage("pix/3.png");
  pushMatrix();
  scale(0.5);
  image(rock, 100, 640);
  popMatrix();
  pushMatrix();
  scale(0.25);
  image(numberthree, 260, 1440);
  popMatrix();
  noTint();
}

void drawRock4() {
  checkWin(modelX(0, 0, 0) == 50 && modelY(0, 0, 0) == 100);
  PImage rock = loadImage("pix/Rock.png");
  PImage numberfour = loadImage("pix/4.png");
  pushMatrix();
  scale(0.5);
  image(rock, 400, 240);
  popMatrix();
  pushMatrix();
  scale(0.25);
  image(numberfour, 860, 640);
  popMatrix();
  noTint();
}

void checkWin(boolean condition) {
  checkCount++;
  if (condition) {
    tint(#FAF36A);
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