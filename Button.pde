class Button
{
  int x, y, xs, ys;
  color pressed, released;
  Button(int sx, int sy, int sxs, int sys, color release, color press)
  {
    x = sx;
    y = sy;
    xs = sxs;
    ys = sys;
    pressed = press;
    released = release;
  }
  boolean overButt()
  {
    if(mouseX > x && mouseX < x + xs &&
        mouseY > y && mouseY < y + ys) 
    {
      return true;
    } 
    else return false;
  }
  void draw()
  {
    if(overButt())
    {
      fill(pressed);
    }
    else
    {
      fill(released);
    }
    rect(x, y, xs, ys);
  }
}