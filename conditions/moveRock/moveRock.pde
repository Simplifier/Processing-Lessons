void setup() {
  size(400, 400, P3D);
}

void draw() {
  // нарисовать уровень
  drawLevel();

  pushMatrix();
  translate(50, 0);
  // нарисовать валун #1
  drawRock1();
  popMatrix();

  pushMatrix();
  translate(-100, 0);
  // нарисовать валун #2
  drawRock2();
  popMatrix();

  pushMatrix();
  translate(0, -100);
  // нарисовать валун #3
  drawRock3();
  popMatrix();

  pushMatrix();
  translate(50, 100);
  // нарисовать валун #4
  drawRock4();
  popMatrix();
}