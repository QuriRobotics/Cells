Cell[] cell;
Button reset, zoomIn, zoomReset, zoomOut, oneStep, pause, play;
int[][][] world; // 0 - future, 1 - present
int cellSize = 20;
int sx, sy;
int buttLeft, buttRight;
int canvasSizeX, canvasSizeY;
int density = 20; // %
int cellAmount;
float zoom = 1;
boolean locked = false, simOnline = true;
float biasX, biasY, difX = 0.0, difY = 0.0;

void setup()
{
  size(1200, 720, JAVA2D);
  background(255);
  frameRate(30);
  sx = int(width*0.92/cellSize);
  sy = height/cellSize;
  world = new int[sx][sy][2];
  buttLeft = sx * cellSize + 10;
  buttRight = width - sx * cellSize - 20;
  canvasSizeX = sx * cellSize;
  canvasSizeY = sy * cellSize;
  cellAmount = sx * sy * density / 100;
  cell = new Cell[cellAmount];
  world = new int[sx][sy][2];
  for(int i = 0; i<sy; i++)
  {
    for(int j = 0; j<sx; j++)
    {
      world[j][i][0] = 0;
      world[j][i][1] = 0;
    }
  }
  for (int i = 0; i < cellAmount; i++)
  {
    cell[i] = new Cell(int(random(sx)), int(random(sy)), int(random(1,5)), cellSize);
    world[cell[i].x][cell[i].y][0] = cell[i].type;
    world[cell[i].x][cell[i].y][1] = cell[i].type;
  }
  reset = new Button(buttLeft, 10, buttRight, 40, color(0, 0, 0), color(55));
  zoomIn = new Button(buttLeft, reset.y + reset.ys + 10, buttRight, 100, color(255, 0, 0), color(200, 0, 0));
  zoomReset = new Button(buttLeft, zoomIn.y + zoomIn.ys + 10, buttRight, 100, color(0, 255, 0), color(255, 0, 0));
  zoomOut = new Button(buttLeft, zoomReset.y + zoomReset.ys + 10, buttRight, 100, color(0, 0, 255), color(0, 0, 200));
  oneStep = new Button(buttLeft, zoomOut.y + zoomOut.ys + 10, buttRight, 100, color(255, 255, 0), color(200, 200, 0));
  pause = new Button(buttLeft, oneStep.y + oneStep.ys + 10, buttRight, 100, color(0, 255, 0), color(255, 0, 0));
  play = new Button(buttLeft, pause.y + pause.ys + 10, buttRight, 100, color(0, 255, 0), color(255, 0, 0));
}
void draw()
{
  background(255);
  fill(110, 230, 135);
  rect(biasX*zoom, biasY*zoom, sx*cellSize*zoom, sy*cellSize*zoom);
  if(simOnline)
  {
    simulate();
  }
  display();
  fill(255);
  rect(canvasSizeX, 0, width - canvasSizeX, height);
  reset.draw();
  zoomIn.draw();
  zoomReset.draw();
  zoomOut.draw();
  oneStep.draw();
  pause.draw();
  play.draw();
}

void simulate()
{
  for(int i = 0; i < cellAmount; i++)
  {
    if(cell[i].type == 3)
    {
      world[cell[i].x][cell[i].y][1] = 0;
      int dx = int(random(-1, 2) + sx), dy = int(random(-1, 2) + sy);
      if(world[(cell[i].x+dx)%sx][(cell[i].y+dy)%sy][1] == 0)
      {
        cell[i].x += dx;
        cell[i].x %= sx;
        cell[i].y += dy;
        cell[i].y %= sy;
      }
      world[cell[i].x][cell[i].y][0] = cell[i].type;
    }
  }
}

void display()
{
  for(int i = 0; i < cellAmount; i++)
  {
    cell[i].draw(zoom, biasX * zoom, biasY * zoom);
    world[cell[i].x][cell[i].y][1] = cell[i].type;
    world[cell[i].x][cell[i].y][0] = 0;
  }
}


void mouseReleased()
{
  if(reset.overButt())
    for (int i = 0; i < cellAmount; i++)
    {
      cell[i] = new Cell(int(random(sx)), int(random(sy)), int(random(1,5)), cellSize);
    }
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
    biasX = 0;
    biasY = 0;
  }
  if(oneStep.overButt())
  {
    simOnline = false;
    simulate();
    display();
  }
  if(pause.overButt())
  {
    simOnline = false;
  }
  if(play.overButt())
  {
    simOnline = true;
  }
  locked = false;
  mouseX = 0;
  mouseY = 0;
}

void mouseDragged()
{
  if(locked)
  {
    biasX = mouseX-difX;
    biasY = mouseY-difY;
  }
}
void mousePressed()
{
  if(mouseX > 0 && mouseX < canvasSizeX &&
        mouseY > 0 && mouseY < canvasSizeY) locked = true;
  difX = mouseX - biasX; 
  difY = mouseY - biasY;
}