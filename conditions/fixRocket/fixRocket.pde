void setup() {
  init();
  size(500, 500);
}

void draw() {
  // нарисовать уровень
  drawLevel();

  pushMatrix();
  translate(width / 2, height / 2);
  translate(x, y);
  rotate(radians(alpha - 180));
  drawRocket(); // нарисовать ракету
  
  // нарисовать иллюминаторы
  drawBigWindow();
  drawSmallWindow();
  drawSmallWindow();
  drawSmallWindow();
  drawSmallWindow();
  
  popMatrix();
  
  moveRocket();
}