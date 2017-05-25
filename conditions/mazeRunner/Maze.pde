public class Maze {
  public int[][] map = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  };

  public void draw() {
    stroke(255);
    fill(#E0AF0B);
    for (int i=0; i<map.length; i++) {
      int[] row = map[i];
      for (int j=0; j<row.length; j++) {
        if (row[j] == 1) {
          int x = j * GRID_CELL;
          int y = i * GRID_CELL;

          rect(x, y, GRID_CELL, GRID_CELL);
        }
      }
    }

    drawGrid();
  }

  private void drawGrid() {
    stroke(0, 150, 255, 50);
    //рисуем вертикальные линии сетки
    for (int x=0; x<width; x+=GRID_CELL) {
      line(x, 0, x, height);
    }
    //рисуем горизонтальные линии сетки
    for (int y=0; y<height; y+=GRID_CELL) {
      line(0, y, width, y);
    }
  }
}