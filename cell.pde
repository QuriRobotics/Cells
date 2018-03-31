class Cell
{
  int x, y, type, cellSize; // 1-яд, 2-стена, 3-клетка, 4-еда, 5-пусто
  int[] genome = new int[64];
  color cellColor;
  Cell(int xs, int ys, int types, int cellSizes)
  {
    x = xs;
    y = ys;
    type = types;
    cellSize = cellSizes;
    switch(type)
    {
    case 1:
      cellColor = color(255, 0, 0);
      break;
    case 2:
      cellColor = color(120);
      break;
    case 3:
      cellColor = color(255, 255, 255);
      break;
    case 4:
      cellColor = color(0, 255, 0);
      break;
    }
  }

  void draw()
  {
    fill(cellColor);
    rect(x*cellSize, y*cellSize, cellSize, cellSize);
  }
}
