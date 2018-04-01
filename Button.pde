class Button
{
  int x, y, xs, ys;
  color pressed, released;
  Button(int sx, int sy, int sxs, int sys, color press, color release)
  {
    x = sx;
    y = ys;
    xs = sxs;
    ys = sys;
    pressed = press;
    relesased = release;
  }
  bool overButt(int mousex, int mousey)
  {
    if(mousex > x && mousex < x + xs &&
        mousey > y && mousey < y + ys) return true;
    else return false;
  }
}