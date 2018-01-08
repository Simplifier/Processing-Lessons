PImage earth;
PImage rocket;

float x;
float y;
int alpha = 180;

void init() {
  earth = loadImage("planet.png");
  rocket = loadImage("rocket.png");
  drawLevel();
  noStroke();
  x = 180 * cos(radians(alpha));
  y = 180 * sin(radians(alpha));
}

void drawLevel() {
  background(#3B5279);

  pushMatrix();
  translate(width / 2, height / 2);
  image(earth, -100, -100);
  popMatrix();
}

void drawRocket() {
  image(rocket, -50, -40);
}

void drawBigWindow(){
  fill(#556080);
  ellipse(0, 0, 20, 20);
}

void drawSmallWindow(){
  fill(#8697CB);
  ellipse(0, 0, 12, 12);
}

void moveRocket(){
  x = 180 * cos(radians(alpha));
  y = 180 * sin(radians(alpha));
  alpha++;
}