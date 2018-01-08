//////////////////////////////////////////////////////////////////////////////////////////
// InfoSNAKE
// ---------
// This Program is an interpretation of the original SNAKE-game for educational purposes.
// All images and sounds used are public domain:  
//  * jelly.png -- https://commons.wikimedia.org/wiki/File:Food-Jelly.svg?uselang=de
//  * 206016__junkfood2121__liquid-fill-glass.mp3 
//       -- http://www.freesound.org/people/junkfood2121/sounds/206016/ (converted to mp3)
//
//
// License: GPLv3.0
// F. Kick DBG Eppelheim
//////////////////////////////////////////////////////////////////////////////////////////


///// vars //////////////////////////////////////////////////////////////////////////

// General Settings
int cellSize = 25;
int fieldWidth = 30;
int fieldHeight = 30;

// SNAKE
int[] x = new int[fieldWidth*fieldHeight];
int[] y = new int[fieldWidth*fieldHeight];
int tailLenght=2;    
boolean dead=false;
int vx=0;       // speed x
int vy=-1;      // speed y


// FOOD
int foodX=int(random(1, fieldWidth-1));
int foodY=int(random(1, fieldHeight-1));
PImage foodImage;
int foodsize;
float foodAlpha = 255;




//////  CONSTRUCTOR  ////////////////////////////////////////////////////////////////////////// 
void init() {
  java.awt.EventQueue.invokeLater(new Runnable() {
    @Override
    public void run() {
      avoidFocusLosing();
    }
  });

  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  foodImage = loadImage("jelly.png");  
  frameRate(10);
  x[0]=int(random(1, fieldWidth-1));
  y[0]=int(random((fieldHeight-1)/2, fieldHeight-1));
  x[1]=x[0];
  y[1]=y[0]-vy;
  foodsize = cellSize;
}

void avoidFocusLosing() {
  surface.setVisible(true);
  frame.setAlwaysOnTop(true);
  frame.toFront();
  frame.requestFocus();
  frame.setAlwaysOnTop(false);
}

void focusGained() {
  //println("focusGained");
}

void focusLost() {
  //println("focusLost");
}


//////  LOOP  /////////////////////////////////////////////////////////////////////////////////
void draw() {
  if (dead==false) {                  // As long as the game is running
    background(255);
    drawFood();
    moveSnake(tailLenght);
    handleCollision();
    countScore();
  } else {
    fill(150, 100);
    rect(width/2, height/2, width, height);
    textSize(100);
    fill(20);
    text("GAME OVER", width/2, height/2);
    textSize(30);
    fill(120);
    text("SCORE: ", width/2, 2*(height/3)+50);
    showScore();
    noLoop();
  }
}

void keyPressed() {
  if (keyCode == UP) {
    if (vy!=1) {
      vy=-1;
      vx=0;
    }
  } else if (keyCode == DOWN) {
    if (vy!=-1) {
      vy=1;
      vx=0;
    }
  } else if (keyCode == LEFT) {
    if (vx!=1) {
      vx=-1;
      vy=0;
    }
  } else if (keyCode == RIGHT) {
    if (vx!=-1) {
      vx=1;
      vy=0;
    }
  }
}


/////  methods  //////////////////////////////////////////////////////////////////////////


// This method works recursively: It is always moved the nth body part. This is
// Each a copy, because the last part of the body receives the coordinates of
// Penultimate body part, the penultimate coordinates of the third to last, etc.
// Only the head is finally moving in the current direction.
// Is called up the method in the loop with moveSnake(<length of the snake>). Thereby
// The last part of the body of the snake is moved, and the method for so long for the called 
// previous body part until the head is reached.
void moveSnake(int n) {
  if (n>=1) {
    // Moving a body part
    x[n] = x[n-1];
    y[n] = y[n-1];
    moveSnake(n-1);
  } else {
    //  Moving the head
    x[0] = x[0]+vx;
    y[0] = y[0]+vy;
  }
  // Draw the body part
  fill(70, 110, 200);
  rect((x[n]*cellSize)+1, (y[n]*cellSize)+1, cellSize-2, cellSize-2);
}

void handleCollision() {
  if (x[0]<=0 || x[0]>=fieldWidth || y[0]<=0 || y[0]>=fieldHeight) {
    dead = true;
  }
  for (int n=1; n<tailLenght; n++) {
    if (x[0]==x[n] && y[0]==y[n] ) {
      dead = true;
    }
  }
}


void countScore() {
  if ( foodX == x[0] && foodY == y[0] ) {
    jellyEaten();
    tailLenght++;

    // The food is not received direct new coordinates, but first
    // Grow as a success signal. In the method to draw food () is the size of Foods
    // Monitored - it is larger than the pitch, so it continues to grow to a
    // Border, from there, the size is reset and new coordinates set.
    foodsize=int(foodsize*1.4);
  }
}

void drawFood() {
  // If the food was just eaten, it is expected to grow
  if (foodsize!=cellSize) {
    if (foodsize<cellSize*5) {
      foodsize=int(foodsize*1.4);
      foodAlpha /= 1.6;
      tint(255, foodAlpha);
    } else { // until it reaches the maximum size
      // then it should shrink back to normal size and
      foodsize=cellSize;
      // receive new coordinates
      placeFood();
      foodAlpha = 255;
      noTint();
    }
  }
  image(foodImage, foodX*cellSize, foodY*cellSize, foodsize, foodsize);
}

void placeFood() {
  foodX=int(random(1, fieldWidth-1));
  foodY=int(random(1, fieldHeight-1));
}  

void stop() {
  super.stop();
}