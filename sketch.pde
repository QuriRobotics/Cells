Cell[] cell = new Cell[100];
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
}
void draw()
{
  background(110, 230, 135);
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
}
