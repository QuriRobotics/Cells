Cell[] cell = new Cell[100];
Button reset;
int[][][] world;
int cellSize = 20;
int sx, sy;

void setup()
{
  size(1200, 720);
  background(255);
  frameRate(30);
  sx = int(width*0.9/cellSize);
  sy = height/cellSize;
  world = new int[sx][sy][2];
  for (int i = 0; i < 100; i++)
    cell[i] = new Cell(int(random(sx)), int(random(sy)), int(random(1,5)), cellSize);
  reset = new Button(sx * cellSize + 10, 10, width - sx * cellSize - 20, 100, color(0, 255, 0), color(255, 0, 0));
}
void draw()
{
  background(255);
  fill(110, 230, 135);
  rect(0, 0, sx*cellSize, sy*cellSize);
  for (int i = 0; i < 100; i++)
  {
    if(cell[i].type == 3)
    {
      cell[i].x += int(random(-2, 2)) + sx;
      cell[i].x %= sx;
      cell[i].y += int(random(-2, 2)) + sy;
      cell[i].y %= sy;
    }
    cell[i].draw();
  }
  reset.draw();
}

void mouseReleased()
{
  mouseX = 0;
  mouseY = 0;
}