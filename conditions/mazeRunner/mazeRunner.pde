int x = 0;
int y = 4;

void settings() {
  size(GRID_CELL * GRID_WIDTH, GRID_CELL * GRID_HEIGHT);
}

void setup() {
  noLoop();
  runEscape();
}

void draw() {
  update();
}

void saveHero() {
  moveRight();
  moveUp();
  moveLeft();
  moveDown();
}