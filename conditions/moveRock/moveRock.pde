void setup() {
  init();
  size(400, 400, P3D);
}

void draw() {
  // нарисовать уровень
  drawLevel();

  // нарисовать валун #1
  drawRock1();

  // нарисовать валун #2
  drawRock2();

  // нарисовать валун #3
  drawRock3();

  // нарисовать валун #4
  drawRock4();
}