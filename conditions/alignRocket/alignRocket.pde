void setup() {
  init();
  size(500, 500);
}

void draw() {
  // нарисовать уровень
  drawLevel();

  pushMatrix();
  
  // сдвигаем в центр
  translate(width / 2, height / 2);
  // двигаем в координаты (x, y) относительно центра
  translate(x, y);
  
  // 1. переменная alpha хранит угол поворота ракеты вокруг Земли.
  // используя alpha, разверни ракету по направлению движения.
  // 2. сделай так, чтобы ракета поворачивалась вокруг центра, а не верхнего левого угла
  
  drawRocket(); // нарисовать ракету
  
  popMatrix();
  
  // расскомментируй следующую строку, чтобы ракета полетела
  //moveRocket();
}