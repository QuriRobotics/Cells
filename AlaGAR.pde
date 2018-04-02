Cell[] cell;
Button reset, zoomIn, zoomReset, zoomOut;
int[][][] world;
int cellSize = 20;
int sx, sy;
int buttLeft, buttRight;
int canvasSizeX, canvasSizeY;
int density = 15; // %
int cellAmount;
float zoom = 1;

void setup()
{
  size(1200, 720, JAVA2D);
  background(255);
  frameRate(30);
  sx = int(width*0.9/cellSize);
  sy = height/cellSize;
  world = new int[sx][sy][2];
  buttLeft = sx * cellSize + 10;
  buttRight = width - sx * cellSize - 20;
  canvasSizeX = sx * cellSize;
  canvasSizeY = sy * cellSize;
  cellAmount = sx * sy * density / 100;
  cell = new Cell[cellAmount];
  for (int i = 0; i < cellAmount; i++)
    cell[i] = new Cell(int(random(sx)), int(random(sy)), int(random(1,5)), cellSize);
  reset = new Button(buttLeft, 10, buttRight, 100, color(0, 255, 0), color(255, 0, 0));
  zoomIn = new Button(buttLeft, 120, buttRight, 100, color(0, 255, 0), color(255, 0, 0));
  zoomReset = new Button(buttLeft, 230, buttRight, 100, color(0, 255, 0), color(255, 0, 0));
  zoomOut = new Button(buttLeft, 340, buttRight, 100, color(0, 255, 0), color(255, 0, 0));
}
void draw()
{
  background(255);
  fill(110, 230, 135);
  rect(0, 0, sx*cellSize, sy*cellSize);
  for (int i = 0; i < cellAmount; i++)
  {
    if(cell[i].type == 3)
    {
      cell[i].x += int(random(-2, 2)) + sx;
      cell[i].x %= sx;
      cell[i].y += int(random(-2, 2)) + sy;
      cell[i].y %= sy;
    }
    cell[i].draw(zoom);
  }
  fill(255);
  rect(canvasSizeX, 0, width - canvasSizeX, height);
  reset.draw();
  zoomIn.draw();
  zoomReset.draw();
  zoomOut.draw();
}

void mouseReleased()
{
  if(reset.overButt())
    for (int i = 0; i < cellAmount; i++)
      cell[i] = new Cell(int(random(sx)), int(random(sy)), int(random(1,5)), cellSize);
  if(zoomIn.overButt())
  {
    zoom *= 1.1;
  }
  if(zoomOut.overButt() && zoom*cellSize >= 1)
  {
    zoom /= 1.1;
  }
  if(zoomReset.overButt())
  {
    zoom = 1;
  }
  mouseX = 0;
  mouseY = 0;
}