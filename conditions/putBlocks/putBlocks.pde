void setup() {
  init();
  size(400, 400, P3D);
}

void draw() {
  // нарисовать уровень
  drawLevel();

  // нарисовать подсказки
  drawTips();

  pushMatrix();
  translate(0, 50);
  // нарисовать блок #1
  drawRect1();
  popMatrix();

  pushMatrix();
  translate(50, 150);
  // нарисовать блок #2
  drawRect2();
  popMatrix();

  pushMatrix();
  translate(50, 350);
  // нарисовать блок #3
  drawRect3();
  popMatrix();

  pushMatrix();
  translate(200, 200);
  // нарисовать блок #4
  drawRect4();
  popMatrix();

  showScore();
}