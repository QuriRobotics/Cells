class Cell
{
  int x, y, type, cellSize; // 1-яд, 2-стена, 3-клетка, 4-еда, 5-пусто
  int index = 0;
  int[] genome = new int[64]; // 0...7 - сделать шаг, 8...15 - схватить еду или нейтрализовать яд, 16...23 - посмотреть, 24...31 - поворот, 32...63 - безусловный переход
  color cellColor;
  boolean alive = true;
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

  void draw(float zoom, float bx, float by)
  {
    if(!alive) return;
    fill(cellColor);
    if (cellSize*zoom < 8) noStroke();
    else stroke(0);
    rect(x*cellSize*zoom + bx, y*cellSize*zoom + by, cellSize*zoom, cellSize*zoom);
    stroke(0);
  }
}
