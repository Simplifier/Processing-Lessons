import javax.swing.Timer;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

final int GRID_CELL = 80;//размер тайла
Maze maze = new Maze();
final int GRID_WIDTH = maze.map[0].length;
final int GRID_HEIGHT = maze.map.length;

PImage hero;
String heroSkin = "hero.png";//скин героя
int heroX;
int heroY;
int lastX;
int lastY;

void runEscape() {
  _init();

  Timer timer = new Timer(100, new ActionListener() {
    public void actionPerformed(ActionEvent ev) {
      saveHero();
    }
  });

  timer.setRepeats(false);
  timer.start();
}

void update() {
  background(255);
  fill(#626262);
  text("(" + x + ", " + y + ")", 5, 2);
  maze.draw();

  noStroke();
  image(hero, heroX, heroY);
}

private void _init() {
  textSize(22);
  textAlign(LEFT, TOP);
  imageMode(CENTER);
  hero = loadImage(heroSkin);
  _setHeroX(x);
  _setHeroY(y);
}

private void _tick() {
  delay(300);
  redraw();
}

private void _setHeroX(int x) {
  lastX = this.x;
  lastY = this.y;
  if (x < 0) {
    x = 0;
  } else if (x > GRID_WIDTH - 1) {
    x = GRID_WIDTH - 1;
  }

  this.x = x;
  heroX = int((x + .5) * GRID_CELL);
}

private void _setHeroY(int y) {
  lastX = this.x;
  lastY = this.y;
  if (y < 0) {
    y = 0;
  } else if (y > GRID_HEIGHT - 1) {
    y = GRID_HEIGHT - 1;
  }

  this.y = y;
  heroY = int((y + .5) * GRID_CELL);
}

////////////
//hero API
////////////

void moveLeft() {
  _tick();
  _setHeroX(x - 1);
}

void moveRight() {
  _tick();
  heroX += GRID_CELL;
  _setHeroX(x + 1);
}

void moveUp() {
  _tick();
  _setHeroY(y - 1);
}

void moveDown() {
  _tick();
  _setHeroY(y + 1);
}

boolean canMoveLeft() {
  if (x - 1 < 0) {
    return false;
  }
  return maze.map[y][x - 1] == 1;
}

boolean canMoveRight() {
  if (x + 1 > GRID_WIDTH - 1) {
    return false;
  }
  return maze.map[y][x + 1] == 1;
}

boolean canMoveUp() {
  if (y - 1 < 0) {
    return false;
  }
  return maze.map[y - 1][x] == 1;
}

boolean canMoveDown() {
  if (y + 1 > GRID_HEIGHT - 1) {
    return false;
  }
  return maze.map[y + 1][x] == 1;
}